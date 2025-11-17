using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using WearDropWA.PackageAlmacen;
using WearDropWA.ProveedorWS;

namespace WearDropWA
{
    public partial class ModificarMovimiento : System.Web.UI.Page
    {
        private int idAlmacen;
        private int idMovimiento;
        private MovimientoAlmacenWSClient boMovimiento;
        private AlmacenWSClient boAlmacen;
        private ProveedorWSClient boProveedor;
        private movimientoAlmacen datMov;

        protected void Page_Load(object sender, EventArgs e)
        {
            boMovimiento = new MovimientoAlmacenWSClient();
            boAlmacen = new AlmacenWSClient();
            boProveedor = new ProveedorWSClient();

            if (!IsPostBack)
            {
                if (Request.QueryString["idAlmacen"] != null && Request.QueryString["id"] != null)
                {
                    idAlmacen = Convert.ToInt32(Request.QueryString["idAlmacen"]);
                    idMovimiento = Convert.ToInt32(Request.QueryString["id"]);

                    ViewState["IdAlmacen"] = idAlmacen;
                    ViewState["IdMovimiento"] = idMovimiento;

                    // Cargar almacenes y proveedores primero
                    CargarAlmacenesYProveedores();

                    // Luego cargar los datos del movimiento
                    CargarDatosMovimiento();
                }
                else
                {
                    Response.Redirect("~/Almacen/ListarAlmacenes.aspx");
                }
            }
            else
            {
                idAlmacen = (int)ViewState["IdAlmacen"];
                idMovimiento = (int)ViewState["IdMovimiento"];
            }
        }

        // Método modificado para cargar almacenes Y proveedores (SIN UBICACIÓN)
        private void CargarAlmacenesYProveedores()
        {
            try
            {
                // Obtener lista de almacenes del backend
                BindingList<almacen> listaAlmacenes = new BindingList<almacen>(boAlmacen.listarAlmacenesActivos());

                // Obtener lista de proveedores del backend
                BindingList<proveedor> listaProveedores = new BindingList<proveedor>(boProveedor.listarTodosLosProveedores());

                // Crear lista combinada con un formato unificado
                var listaCompleta = new List<object>();

                // Agregar almacenes con prefijo - SOLO NOMBRE (sin ubicación)
                foreach (var a in listaAlmacenes)
                {
                    listaCompleta.Add(new
                    {
                        Id = "A-" + a.id,
                        NombreCompleto = $"[ALMACÉN] {a.nombre}",
                        NombreLimpio = a.nombre
                    });
                }

                // Agregar proveedores con prefijo
                foreach (var p in listaProveedores)
                {
                    listaCompleta.Add(new
                    {
                        Id = "P-" + p.idProveedor,
                        NombreCompleto = $"[PROVEEDOR] {p.nombre}",
                        NombreLimpio = p.nombre
                    });
                }

                // Cargar dropdown de Lugar de Origen
                ddlLugarOrigen.DataSource = listaCompleta;
                ddlLugarOrigen.DataTextField = "NombreCompleto";
                ddlLugarOrigen.DataValueField = "Id";
                ddlLugarOrigen.DataBind();
                ddlLugarOrigen.Items.Insert(0, new ListItem("-- Seleccione lugar de origen --", "0"));

                // Cargar dropdown de Lugar de Destino
                ddlLugarDestino.DataSource = listaCompleta.ToList();
                ddlLugarDestino.DataTextField = "NombreCompleto";
                ddlLugarDestino.DataValueField = "Id";
                ddlLugarDestino.DataBind();
                ddlLugarDestino.Items.Insert(0, new ListItem("-- Seleccione lugar de destino --", "0"));
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert",
                    $"alert('Error al cargar almacenes y proveedores: {ex.Message}');", true);
            }
        }

        // Método para cargar los datos del movimiento existente
        private void CargarDatosMovimiento()
        {
            try
            {
                datMov = boMovimiento.obtenerMovimientoPorId(idMovimiento);

                if (datMov != null)
                {
                    // Cargar la fecha
                    txtFechaTraslado.Text = datMov.fecha.ToString("yyyy-MM-dd");

                    // Seleccionar el tipo
                    ddlTipo.SelectedValue = datMov.tipo.ToString();

                    // BUSCAR Y SELECCIONAR LUGAR DE ORIGEN
                    string idOrigenSeleccionado = "0";
                    foreach (ListItem item in ddlLugarOrigen.Items)
                    {
                        // Extraer el nombre del texto del item
                        string nombreItem = ExtraerNombreLugar(item.Text);

                        if (nombreItem.Equals(datMov.lugarOrigen, StringComparison.OrdinalIgnoreCase))
                        {
                            idOrigenSeleccionado = item.Value;
                            ddlLugarOrigen.SelectedValue = item.Value;
                            break;
                        }
                    }

                    // BUSCAR Y SELECCIONAR LUGAR DE DESTINO
                    string idDestinoSeleccionado = "0";
                    foreach (ListItem item in ddlLugarDestino.Items)
                    {
                        // Extraer el nombre del texto del item
                        string nombreItem = ExtraerNombreLugar(item.Text);

                        if (nombreItem.Equals(datMov.lugarDestino, StringComparison.OrdinalIgnoreCase))
                        {
                            idDestinoSeleccionado = item.Value;
                            ddlLugarDestino.SelectedValue = item.Value;
                            break;
                        }
                    }

                    string script = $@"
                <script type='text/javascript'>
                    $(document).ready(function() {{
                        // Esperar a que Select2 esté inicializado y luego establecer valores
                        setTimeout(function() {{
                            $('#{ddlLugarOrigen.ClientID}').val('{idOrigenSeleccionado}').trigger('change');
                            $('#{ddlLugarDestino.ClientID}').val('{idDestinoSeleccionado}').trigger('change');
                        }}, 100);
                    }});
                </script>
            ";
                    ClientScript.RegisterStartupScript(this.GetType(), "setSelect2Values", script);

                    // Guardar el movimiento completo en ViewState
                    ViewState["DatMovimiento"] = datMov;
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert",
                        "alert('Movimiento no encontrado');", true);
                    Response.Redirect($"~/Almacen/MostrarAlmacen.aspx?id={idAlmacen}&tab=Movimientos");
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert",
                    $"alert('Error al cargar datos del movimiento: {ex.Message}');", true);
            }
        }

        // Método simplificado ya que no hay ubicación que remover
        private string ExtraerNombreLugar(string textoCompleto)
        {
            // Elimina "[ALMACÉN] " o "[PROVEEDOR] " del inicio
            if (textoCompleto.StartsWith("[ALMACÉN] "))
            {
                return textoCompleto.Replace("[ALMACÉN] ", "").Trim();
            }
            else if (textoCompleto.StartsWith("[PROVEEDOR] "))
            {
                return textoCompleto.Replace("[PROVEEDOR] ", "").Trim();
            }
            return textoCompleto.Trim();
        }

        protected void lkModificar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    // Validar que se hayan seleccionado los lugares
                    string idLugarOrigen = ddlLugarOrigen.SelectedValue;
                    string idLugarDestino = ddlLugarDestino.SelectedValue;

                    if (idLugarOrigen == "0")
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert",
                            "alert('Debe seleccionar un lugar de origen');", true);
                        return;
                    }

                    if (idLugarDestino == "0")
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert",
                            "alert('Debe seleccionar un lugar de destino');", true);
                        return;
                    }

                    // Validar que no sean el mismo lugar
                    if (idLugarOrigen == idLugarDestino)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert",
                            "alert('El lugar de origen y destino no pueden ser el mismo');", true);
                        return;
                    }

                    // Validar tipo
                    string tipo = ddlTipo.SelectedValue;
                    if (tipo == "0")
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert",
                            "alert('Debe seleccionar un tipo de movimiento');", true);
                        return;
                    }

                    // Validar fecha
                    if (string.IsNullOrEmpty(txtFechaTraslado.Text))
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert",
                            "alert('Debe seleccionar una fecha de traslado');", true);
                        return;
                    }

                    DateTime fechaTraslado = Convert.ToDateTime(txtFechaTraslado.Text);

                    // Obtener los textos seleccionados
                    string lugarOrigen = ddlLugarOrigen.SelectedItem.Text;
                    string lugarDestino = ddlLugarDestino.SelectedItem.Text;

                    // Extraer nombres limpios
                    string nombreOrigen = ExtraerNombreLugar(lugarOrigen);
                    string nombreDestino = ExtraerNombreLugar(lugarDestino);

                    // Verificar que uno de los lugares sea el almacén actual
                    almacen almacenActual = boAlmacen.obtenerPorId(idAlmacen);
                    string nombreAlmacenActual = almacenActual.nombre;

                    bool origenEsAlmacenActual = idLugarOrigen.StartsWith("A-") &&
                                                  idLugarOrigen == "A-" + idAlmacen;
                    bool destinoEsAlmacenActual = idLugarDestino.StartsWith("A-") &&
                                                   idLugarDestino == "A-" + idAlmacen;

                    if (!origenEsAlmacenActual && !destinoEsAlmacenActual)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert",
                            $"alert('Al menos uno de los lugares (origen o destino) debe ser el almacén actual: {nombreAlmacenActual}');", true);
                        return;
                    }

                    // Recuperar el movimiento desde ViewState
                    datMov = (movimientoAlmacen)ViewState["DatMovimiento"];

                    // Si no existe en ViewState, crear uno nuevo (aunque no debería pasar)
                    if (datMov == null)
                    {
                        datMov = new movimientoAlmacen();
                        datMov.datAlmacen = new almacen { id = idAlmacen };
                    }

                    // Actualizar los campos modificables
                    datMov.idMovimiento = idMovimiento;
                    datMov.lugarOrigen = nombreOrigen;
                    datMov.lugarDestino = nombreDestino;

                    datMov.fecha = fechaTraslado;
                    datMov.fechaSpecified = true;

                    datMov.tipo = (tipoMovimiento)Enum.Parse(typeof(tipoMovimiento), tipo);
                    datMov.tipoSpecified = true;

                    // Llamar al servicio para modificar
                    int resultado = boMovimiento.modificarMovimientoAlmacen(datMov);

                    if (resultado > 0)
                    {
                        Response.Redirect($"~/Almacen/MostrarAlmacen.aspx?id={idAlmacen}&msg=movimientoModificado&tab=Movimientos");
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert",
                            "alert('Error al modificar el movimiento. Intente nuevamente.');", true);
                    }
                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert",
                        $"alert('Error: {ex.Message}');", true);
                }
            }
        }

        protected void lkCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect($"~/Almacen/MostrarAlmacen.aspx?id={idAlmacen}&tab=Movimientos");
        }
    }
}