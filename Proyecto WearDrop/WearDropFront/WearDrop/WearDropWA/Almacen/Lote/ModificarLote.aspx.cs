using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using WearDropWA.PackageAlmacen;
using WearDropWA.PackagePrendas;

namespace WearDropWA
{
    public partial class ModificarLote : System.Web.UI.Page
    {
        private int idAlmacen;
        private int idLote;
        private LoteWSClient boLote;
        private AlmacenWSClient boAlmacen;
        private PrendaLoteWSClient wsPrendaLote; // ✅ Cliente WS para prendas
        private PackageAlmacen.lote datLote;

        protected void Page_Load(object sender, EventArgs e)
        {
            boLote = new LoteWSClient();
            boAlmacen = new AlmacenWSClient();
            wsPrendaLote = new PrendaLoteWSClient(); // ✅ Inicializar

            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null && Request.QueryString["idAlmacen"] != null)
                {
                    idLote = Convert.ToInt32(Request.QueryString["id"]);
                    idAlmacen = Convert.ToInt32(Request.QueryString["idAlmacen"]);

                    ViewState["IdLote"] = idLote;
                    ViewState["IdAlmacen"] = idAlmacen;

                    CargarDatosAlmacen();
                    CargarDatosLote();
                    CargarPrendas(); // ✅ Cargar prendas desde BD
                }
                else
                {
                    Response.Redirect("~/Almacen/ListarAlmacenes.aspx");
                }
            }
            else
            {
                idLote = (int)ViewState["IdLote"];
                idAlmacen = (int)ViewState["IdAlmacen"];
            }
        }

        private void CargarDatosAlmacen()
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

        private void CargarDatosLote()
        {
            try
            {
                datLote = boLote.obtenerLotePorID(idLote);

                if (datLote != null)
                {
                    txtDescripcionLote.Text = datLote.descripcion ?? "";
                    ViewState["DatLote"] = datLote;
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert",
                        "alert('Lote no encontrado');", true);
                    Response.Redirect($"~/Almacen/MostrarAlmacen.aspx?id={idAlmacen}");
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert",
                    $"alert('Error al cargar datos del lote: {ex.Message}');", true);
            }
        }

        // ✅ CARGAR PRENDAS DESDE BD
        private void CargarPrendas()
        {
            try
            {
                prendaLote[] prendasLote = wsPrendaLote.listarPrendasPorLote(idLote);

                if (prendasLote != null && prendasLote.Length > 0)
                {
                    var prendasFormateadas = prendasLote.Select(pl => new
                    {
                        IdPrendaLote = pl.idPrendaLote,
                        IdPrenda = pl.idPrenda,
                        Talla = pl.talla.ToString() ?? "-",
                        Stock = pl.stock
                    }).ToList();

                    gvPrendas.DataSource = prendasFormateadas;
                    gvPrendas.DataBind();
                }
                else
                {
                    CargarPrendasVacio();
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert",
                    $"alert('Error al cargar prendas: {ex.Message}');", true);
                CargarPrendasVacio();
            }
        }

        private void CargarPrendasVacio()
        {
            gvPrendas.DataSource = null;
            gvPrendas.DataBind();
        }

        protected string GenerarPaginacion(int currentPage, int totalPages)
        {
            StringBuilder sb = new StringBuilder();

            int startPage = Math.Max(2, currentPage);
            int endPage = Math.Min(totalPages - 1, currentPage + 2);

            for (int i = startPage; i <= endPage; i++)
            {
                string activeClass = i == currentPage + 1 ? "active" : "";
                sb.AppendFormat(@"
                    <li class='page-item {0}'>
                        <a class='page-link' href='javascript:void(0)' 
                           onclick=""__doPostBack('ctl00${1}$gvPrendas','Page${2}')"">{2}</a>
                    </li>",
                    activeClass,
                    this.Master.GetType().Name == "WearDrop1_Master" ? "MainContent" : "ContentPlaceHolder1",
                    i);
            }

            return sb.ToString();
        }

        protected void gvPrendas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvPrendas.PageIndex = e.NewPageIndex;
            CargarPrendas();
        }

        // ✅ AÑADIR PRENDA - REDIRIGIR A RegistrarPrendaLote
        protected void btnAñadirPrenda_Click(object sender, EventArgs e)
        {
            Response.Redirect($"~/Almacen/PrendaLote/RegistrarPrendaLote.aspx?idAlmacen={idAlmacen}&idLote={idLote}");
        }

        protected void btnFiltrarPrenda_Click(object sender, EventArgs e)
        {
            // Implementar filtro si es necesario
        }

        // ✅ MODIFICAR PRENDA (Si tienes una página para eso)
        protected void btnModificar_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int idPrendaLote = int.Parse(btn.CommandArgument);

            // Redirigir a modificar prenda del lote (si existe la página)
            Response.Redirect($"~/Almacen/PrendaLote/ModificarPrendaLote.aspx?id={idPrendaLote}&idLote={idLote}&idAlmacen={idAlmacen}");
        }

        // ✅ ELIMINAR PRENDA DEL LOTE
        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton btn = (LinkButton)sender;
                int idPrendaLote = int.Parse(btn.CommandArgument);

                int resultado = wsPrendaLote.eliminarPrendaLote(idPrendaLote);

                if (resultado > 0)
                {
                    CargarPrendas();
                    ScriptManager.RegisterStartupScript(this, GetType(), "info",
                        "alert('Prenda removida del lote');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert",
                        "alert('Error al eliminar prenda');", true);
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert",
                    $"alert('Error: {ex.Message}');", true);
            }
        }

        // ✅ GUARDAR MODIFICACIONES DEL LOTE
        protected void lkGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                string descripcion = txtDescripcionLote.Text.Trim();

                if (string.IsNullOrEmpty(descripcion))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert",
                        "alert('La descripción del lote es obligatoria');", true);
                    return;
                }

                datLote = (PackageAlmacen.lote)ViewState["DatLote"];

                if (datLote == null)
                {
                    datLote = new PackageAlmacen.lote();
                    datLote.datAlmacen = new PackageAlmacen.almacen();
                    datLote.datAlmacen.id = idAlmacen;
                }

                datLote.idLote = idLote;
                datLote.descripcion = descripcion;

                int resultado = boLote.modificarLote(datLote);

                if (resultado > 0)
                {
                    Response.Redirect($"~/Almacen/MostrarAlmacen.aspx?id={idAlmacen}&msg=loteModificado");
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert",
                        "alert('Error al modificar el lote. Intente nuevamente.');", true);
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
