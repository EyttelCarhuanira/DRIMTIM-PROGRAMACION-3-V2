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
    public partial class RegistrarMovimiento : System.Web.UI.Page
    {
        private int idAlmacen;
        private MovimientoAlmacenWSClient boMovimiento;
        private AlmacenWSClient boAlmacen;
        private ProveedorWSClient boProveedor;

        protected void Page_Load(object sender, EventArgs e)
        {
            boMovimiento = new MovimientoAlmacenWSClient();
            boAlmacen = new AlmacenWSClient();
            boProveedor = new ProveedorWSClient();

            if (!IsPostBack)
            {
                if (Request.QueryString["idAlmacen"] != null)
                {
                    idAlmacen = Convert.ToInt32(Request.QueryString["idAlmacen"]);
                    ViewState["IdAlmacen"] = idAlmacen;

                    // Cargar los almacenes y proveedores en los dropdowns
                    CargarAlmacenesYProveedores();
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

        // 🔹 Método modificado para cargar almacenes Y proveedores (SIN UBICACIÓN)
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
                        NombreCompleto = $"[ALMACÉN] {a.nombre}"
                    });
                }

                // Agregar proveedores con prefijo
                foreach (var p in listaProveedores)
                {
                    listaCompleta.Add(new
                    {
                        Id = "P-" + p.idProveedor,
                        NombreCompleto = $"[PROVEEDOR] {p.nombre}"
                    });
                }

                // Cargar dropdown de Lugar de Destino
                ddlLugarDestino.DataSource = listaCompleta;
                ddlLugarDestino.DataTextField = "NombreCompleto";
                ddlLugarDestino.DataValueField = "Id";
                ddlLugarDestino.DataBind();
                ddlLugarDestino.Items.Insert(0, new ListItem("-- Seleccione lugar de destino --", "0"));

                // Cargar dropdown de Lugar de Origen
                ddlLugarOrigen.DataSource = listaCompleta.ToList();
                ddlLugarOrigen.DataTextField = "NombreCompleto";
                ddlLugarOrigen.DataValueField = "Id";
                ddlLugarOrigen.DataBind();
                ddlLugarOrigen.Items.Insert(0, new ListItem("-- Seleccione lugar de origen --", "0"));
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert",
                    $"alert('Error al cargar almacenes y proveedores: {ex.Message}');", true);
            }
        }

        protected void lkRegistrar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    // Validar que se hayan seleccionado los lugares
                    string idLugarDestino = ddlLugarDestino.SelectedValue;
                    string idLugarOrigen = ddlLugarOrigen.SelectedValue;

                    if (idLugarDestino == "0")
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert",
                            "alert('Debe seleccionar un lugar de destino');", true);
                        return;
                    }

                    if (idLugarOrigen == "0")
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert",
                            "alert('Debe seleccionar un lugar de origen');", true);
                        return;
                    }

                    // Validar que no sean el mismo lugar
                    if (idLugarDestino == idLugarOrigen)
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

                    // 🔹 Extraer el nombre sin el prefijo [ALMACÉN] o [PROVEEDOR]
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

                    // Crear el movimiento
                    movimientoAlmacen nuevoMovimiento = new movimientoAlmacen();
                    nuevoMovimiento.lugarOrigen = nombreOrigen;
                    nuevoMovimiento.lugarDestino = nombreDestino;
                    nuevoMovimiento.fecha = fechaTraslado;
                    nuevoMovimiento.fechaSpecified = true;

                    nuevoMovimiento.tipo = (tipoMovimiento)Enum.Parse(typeof(tipoMovimiento), tipo);
                    nuevoMovimiento.tipoSpecified = true;

                    // Asignar el almacén
                    nuevoMovimiento.datAlmacen = new almacen();
                    nuevoMovimiento.datAlmacen.id = idAlmacen;

                    // Llamar al servicio para insertar
                    int resultado = boMovimiento.insertarMovAlmacen(nuevoMovimiento);

                    if (resultado > 0)
                    {
                        // Éxito: redirigir con mensaje
                        Response.Redirect($"~/Almacen/MostrarAlmacen.aspx?id={idAlmacen}&msg=movimientoRegistrado");
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert",
                            "alert('Error al registrar el movimiento. Intente nuevamente.');", true);
                    }
                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert",
                        $"alert('Error: {ex.Message}');", true);
                }
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

        protected void lkCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect($"~/Almacen/MostrarAlmacen.aspx?id={idAlmacen}");
        }
    }
}