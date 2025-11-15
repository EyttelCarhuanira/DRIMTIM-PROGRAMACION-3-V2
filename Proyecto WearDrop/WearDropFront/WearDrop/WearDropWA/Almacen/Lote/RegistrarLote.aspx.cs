using System;
using System.ComponentModel;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using WearDropWA.PackageAlmacen;

namespace WearDropWA
{
    public partial class RegistrarLote : System.Web.UI.Page
    {
        private int idAlmacen;
        private MovimientoAlmacenWSClient boMov;
        private LoteWSClient boLote;
        private MovimientoAlmacenXLoteWSClient boMovXLote;
        private AlmacenWSClient boAlmacen;

        private BindingList<movimientoAlmacen> ListaMovimientos
        {
            get
            {
                if (ViewState["ListaMovimientos"] == null)
                    return new BindingList<movimientoAlmacen>();
                return (BindingList<movimientoAlmacen>)ViewState["ListaMovimientos"];
            }
            set
            {
                ViewState["ListaMovimientos"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            boMov = new MovimientoAlmacenWSClient();
            boLote = new LoteWSClient();
            boMovXLote = new MovimientoAlmacenXLoteWSClient();
            boAlmacen = new AlmacenWSClient();

            if (!IsPostBack)
            {
                if (Request.QueryString["idAlmacen"] != null)
                {
                    idAlmacen = Convert.ToInt32(Request.QueryString["idAlmacen"]);
                    ViewState["IdAlmacen"] = idAlmacen;

                    CargarDatosContexto();
                    CargarMovimientos();

                    if (Request.QueryString["idMovimiento"] != null)
                    {
                        int idMovimiento = Convert.ToInt32(Request.QueryString["idMovimiento"]);
                        ddlIdMovimiento.SelectedValue = idMovimiento.ToString();
                        ActualizarDatosMovimiento(idMovimiento);
                    }
                }
                else
                {
                    Response.Redirect("~/Almacen/ListarAlmacenes.aspx");
                }
            }
            else
            {
                idAlmacen = (int)ViewState["IdAlmacen"];
            }
        }

        private void CargarDatosContexto()
        {
            try
            {
                PackageAlmacen.almacen datAlmacen = boAlmacen.obtenerPorId(idAlmacen);

                if (datAlmacen != null)
                {
                    lblNombreAlmacen.Text = datAlmacen.nombre ?? "Almacén no encontrado";
                }
                else
                {
                    lblNombreAlmacen.Text = "Almacén no encontrado";
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert",
                    $"alert('Error al cargar datos del almacén: {ex.Message}');", true);
                lblNombreAlmacen.Text = "Error al cargar";
            }
        }

        private void CargarMovimientos()
        {
            try
            {
                ListaMovimientos = new BindingList<movimientoAlmacen>(boMov.listarMovimientosPorAlmacen(idAlmacen));

                var movimientosFormateados = ListaMovimientos.Select(m => new
                {
                    IdMovimiento = m.idMovimiento,
                    DescripcionCompleta = $"Mov {m.idMovimiento} - {m.tipo} - {m.lugarOrigen} a {m.lugarDestino}"
                }).ToList();

                ddlIdMovimiento.DataSource = movimientosFormateados;
                ddlIdMovimiento.DataTextField = "DescripcionCompleta";
                ddlIdMovimiento.DataValueField = "IdMovimiento";
                ddlIdMovimiento.DataBind();

                ddlIdMovimiento.Items.Insert(0, new ListItem("--Seleccione un movimiento--", "0"));
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert",
                    $"alert('Error al cargar movimientos: {ex.Message}');", true);
            }
        }

        protected void ddlIdMovimiento_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idMovimiento = Convert.ToInt32(ddlIdMovimiento.SelectedValue);

            if (idMovimiento > 0)
            {
                ActualizarDatosMovimiento(idMovimiento);
            }
            else
            {
                lblLugarOrigen.Text = "-";
                lblLugarDestino.Text = "-";
            }
        }

        private void ActualizarDatosMovimiento(int idMovimiento)
        {
            try
            {
                movimientoAlmacen movimientoSeleccionado = boMov.obtenerMovimientoPorId(idMovimiento);

                if (movimientoSeleccionado != null)
                {
                    lblLugarOrigen.Text = movimientoSeleccionado.lugarOrigen ?? "-";
                    lblLugarDestino.Text = movimientoSeleccionado.lugarDestino ?? "-";
                }
                else
                {
                    lblLugarOrigen.Text = "-";
                    lblLugarDestino.Text = "-";
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert",
                    $"alert('Error al cargar datos del movimiento: {ex.Message}');", true);
                lblLugarOrigen.Text = "-";
                lblLugarDestino.Text = "-";
            }
        }

        protected void lkRegistrar_Click(object sender, EventArgs e)
        {
            try
            {
                int idMovimiento = Convert.ToInt32(ddlIdMovimiento.SelectedValue);

                if (idMovimiento == 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert",
                        "alert('Debe seleccionar un movimiento');", true);
                    return;
                }

                string descripcion = txtDescripcionLote.Text.Trim();

                if (string.IsNullOrEmpty(descripcion))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert",
                        "alert('Debe ingresar una descripción para el lote');", true);
                    return;
                }

                // Crear el lote
                PackageAlmacen.lote nuevoLote = new PackageAlmacen.lote();
                nuevoLote.datAlmacen = new PackageAlmacen.almacen();
                nuevoLote.datAlmacen.id = idAlmacen;
                nuevoLote.descripcion = descripcion;
                nuevoLote.activo = true;

                int idLote = boLote.insertarLote(nuevoLote);

                if (idLote <= 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert",
                        "alert('Error al crear el lote');", true);
                    return;
                }

                // Buscar el movimiento seleccionado
                movimientoAlmacen movimientoSeleccionado = ListaMovimientos
                    .FirstOrDefault(m => m.idMovimiento == idMovimiento);

                if (movimientoSeleccionado == null)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert",
                        "alert('Error: No se pudo obtener el movimiento seleccionado');", true);
                    return;
                }

                // Crear la relación MovimientoXLote
                movimientoAlmacenXLote nuevaRelacionMovXLote = new movimientoAlmacenXLote();
                nuevaRelacionMovXLote.datMov = new movimientoAlmacen();
                nuevaRelacionMovXLote.datMov.idMovimiento = movimientoSeleccionado.idMovimiento;
                nuevaRelacionMovXLote.datMov.lugarOrigen = movimientoSeleccionado.lugarOrigen;
                nuevaRelacionMovXLote.datMov.lugarDestino = movimientoSeleccionado.lugarDestino;

                nuevaRelacionMovXLote.datLote = new PackageAlmacen.lote();
                nuevaRelacionMovXLote.datLote.idLote = idLote;

                int resultadoRelacion = boMovXLote.insertarMovXLote(nuevaRelacionMovXLote);

                if (resultadoRelacion > 0)
                {
                    Response.Redirect($"~/Almacen/MostrarAlmacen.aspx?id={idAlmacen}&msg=Lote registrado correctamente");
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert",
                        "alert('Error al registrar la relación Movimiento-Lote');", true);
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert",
                    $"alert('Error: {ex.Message}');", true);
            }
        }

        protected void lkCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect($"~/Almacen/MostrarAlmacen.aspx?id={idAlmacen}");
        }
    }
}
