using System;
using System.Web.UI;

namespace WearDropWA
{
    public partial class ModificarMovimientoXLote : System.Web.UI.Page
    {
        private int idAlmacen;
        private int idMovimiento;
        private int idLote;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["idAlmacen"] != null && Request.QueryString["id"] != null)
                {
                    idAlmacen = Convert.ToInt32(Request.QueryString["idAlmacen"]);
                    idMovimiento = Convert.ToInt32(Request.QueryString["id"]);

                    ViewState["IdAlmacen"] = idAlmacen;
                    ViewState["IdMovimiento"] = idMovimiento;

                    // Cargar los datos de la relación existente
                    CargarDatosRelacion();

                    txtIdMovimiento.AutoPostBack = true;
                    txtIdMovimiento.TextChanged += txtIdMovimiento_TextChanged;

                    txtIdLote.AutoPostBack = true;
                    txtIdLote.TextChanged += txtIdLote_TextChanged;
                }
                else
                {
                    Response.Redirect("~/ListarAlmacenes.aspx");
                }
            }
            else
            {
                idAlmacen = (int)ViewState["IdAlmacen"];
                idMovimiento = (int)ViewState["IdMovimiento"];
            }
        }

        private void CargarDatosRelacion()
        {
            

            // if (relacion != null)
            // {
            //     txtIdMovimiento.Text = relacion.IdMovimiento.ToString();
            //     txtIdLote.Text = relacion.IdLote.ToString();
            //     CargarDatosMovimiento(relacion.IdMovimiento);
            //     CargarDatosLote(relacion.IdLote);
            // }

            // Datos de prueba según el ID del movimiento
            txtIdMovimiento.Text = idMovimiento.ToString();
            CargarDatosMovimiento(idMovimiento);

            // Simular un ID de lote asociado
            switch (idMovimiento)
            {
                case 1:
                    txtIdLote.Text = "1";
                    CargarDatosLote(1);
                    break;
                case 2:
                    txtIdLote.Text = "2";
                    CargarDatosLote(2);
                    break;
                case 3:
                    txtIdLote.Text = "3";
                    CargarDatosLote(3);
                    break;
                case 4:
                    txtIdLote.Text = "4";
                    CargarDatosLote(4);
                    break;
                case 5:
                    txtIdLote.Text = "5";
                    CargarDatosLote(5);
                    break;
                default:
                    txtIdLote.Text = "1";
                    CargarDatosLote(1);
                    break;
            }
        }

        protected void txtIdMovimiento_TextChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(txtIdMovimiento.Text))
            {
                try
                {
                    int nuevoIdMovimiento = Convert.ToInt32(txtIdMovimiento.Text.Trim());
                    CargarDatosMovimiento(nuevoIdMovimiento);
                }
                catch (FormatException)
                {
                    LimpiarCamposMovimiento();
                    MostrarMensaje("Por favor, ingrese un ID de movimiento válido");
                }
                catch (Exception ex)
                {
                    LimpiarCamposMovimiento();
                    MostrarMensaje($"Error al cargar el movimiento: {ex.Message}");
                }
            }
            else
            {
                LimpiarCamposMovimiento();
            }
        }

        private void CargarDatosMovimiento(int idMov)
        {
            try
            {
                

                // if (movimiento != null)
                // {
                //     txtLugarOrigen.Text = movimiento.LugarOrigen;
                //     txtLugarDestino.Text = movimiento.LugarDestino;
                //     txtFecha.Text = movimiento.Fecha.ToString("yyyy-MM-dd");
                //     txtTipo.Text = movimiento.TipoMovimiento;
                // }

                // Datos de ejemplo para demostración:
                switch (idMov)
                {
                    case 1:
                        txtLugarOrigen.Text = "Almacén Central";
                        txtLugarDestino.Text = "Almacén Lima Sur";
                        txtFecha.Text = "2024-10-15";
                        txtTipo.Text = "Salida";
                        break;
                    case 2:
                        txtLugarOrigen.Text = "Almacén Central";
                        txtLugarDestino.Text = "Tienda Miraflores";
                        txtFecha.Text = "2024-10-18";
                        txtTipo.Text = "Salida";
                        break;
                    case 3:
                        txtLugarOrigen.Text = "Proveedor ABC";
                        txtLugarDestino.Text = "Almacén Central";
                        txtFecha.Text = "2024-10-20";
                        txtTipo.Text = "Entrada";
                        break;
                    case 4:
                        txtLugarOrigen.Text = "Almacén Central";
                        txtLugarDestino.Text = "Almacén Norte";
                        txtFecha.Text = "2024-10-22";
                        txtTipo.Text = "Salida";
                        break;
                    case 5:
                        txtLugarOrigen.Text = "Almacén Central";
                        txtLugarDestino.Text = "Tienda San Isidro";
                        txtFecha.Text = "2024-10-25";
                        txtTipo.Text = "Salida";
                        break;
                    default:
                        txtLugarOrigen.Text = "Almacén Central";
                        txtLugarDestino.Text = "Sucursal Norte";
                        txtFecha.Text = DateTime.Now.ToString("yyyy-MM-dd");
                        txtTipo.Text = "Transferencia";
                        break;
                }
            }
            catch (Exception ex)
            {
                LimpiarCamposMovimiento();
                MostrarMensaje($"Error al cargar datos del movimiento: {ex.Message}");
            }
        }

        private void LimpiarCamposMovimiento()
        {
            txtLugarOrigen.Text = string.Empty;
            txtLugarDestino.Text = string.Empty;
            txtFecha.Text = DateTime.Now.ToString("yyyy-MM-dd");
            txtTipo.Text = string.Empty;
        }

        protected void txtIdLote_TextChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(txtIdLote.Text))
            {
                try
                {
                    int nuevoIdLote = Convert.ToInt32(txtIdLote.Text.Trim());
                    CargarDatosLote(nuevoIdLote);
                }
                catch (FormatException)
                {
                    LimpiarCamposLote();
                    MostrarMensaje("Por favor, ingrese un ID de lote válido");
                }
                catch (Exception ex)
                {
                    LimpiarCamposLote();
                    MostrarMensaje($"Error al cargar el lote: {ex.Message}");
                }
            }
            else
            {
                LimpiarCamposLote();
            }
        }

        private void CargarDatosLote(int idLt)
        {
            try
            {

                // if (lote != null)
                // {
                //     txtDescripcion.Text = lote.Descripcion;
                // }

                // Datos de ejemplo para demostración:
                switch (idLt)
                {
                    case 1:
                        txtDescripcion.Text = "Lote de camisetas básicas - 500 unidades en diferentes tallas y colores. Fecha de ingreso: 01/10/2024. Estado: Disponible para distribución.";
                        break;
                    case 2:
                        txtDescripcion.Text = "Lote de pantalones mezclilla - 300 unidades. Tallas variadas. Fecha de ingreso: 05/10/2024. Estado: Disponible.";
                        break;
                    case 3:
                        txtDescripcion.Text = "Lote de zapatillas deportivas - 250 unidades. Múltiples tallas. Fecha de ingreso: 10/10/2024. Estado: Disponible.";
                        break;
                    case 4:
                        txtDescripcion.Text = "Lote de chaquetas invierno - 200 unidades. Colores variados. Fecha de ingreso: 12/10/2024. Estado: Disponible.";
                        break;
                    case 5:
                        txtDescripcion.Text = "Lote de accesorios varios - 400 unidades. Gorras, bufandas y guantes. Fecha de ingreso: 15/10/2024. Estado: Disponible.";
                        break;
                    default:
                        txtDescripcion.Text = $"Lote de productos textiles. Contiene múltiples artículos. Fecha de ingreso: {DateTime.Now.AddDays(-15).ToString("dd/MM/yyyy")}. Estado: Disponible.";
                        break;
                }
            }
            catch (Exception ex)
            {
                LimpiarCamposLote();
                MostrarMensaje($"Error al cargar datos del lote: {ex.Message}");
            }
        }

        private void LimpiarCamposLote()
        {
            txtDescripcion.Text = string.Empty;
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            try
            {
                // Validar campos obligatorios
                if (string.IsNullOrWhiteSpace(txtIdMovimiento.Text))
                {
                    MostrarMensaje("Por favor, ingrese el ID del Movimiento");
                    return;
                }

                if (string.IsNullOrWhiteSpace(txtIdLote.Text))
                {
                    MostrarMensaje("Por favor, ingrese el ID del Lote");
                    return;
                }

                // Validar que los campos estén cargados
                if (string.IsNullOrWhiteSpace(txtLugarOrigen.Text) ||
                    string.IsNullOrWhiteSpace(txtLugarDestino.Text))
                {
                    MostrarMensaje("Los datos del movimiento no están completos. Verifique el ID del Movimiento.");
                    return;
                }

                if (string.IsNullOrWhiteSpace(txtDescripcion.Text))
                {
                    MostrarMensaje("Los datos del lote no están completos. Verifique el ID del Lote.");
                    return;
                }

                // Obtener valores
                int nuevoIdMovimiento = Convert.ToInt32(txtIdMovimiento.Text.Trim());
                int nuevoIdLote = Convert.ToInt32(txtIdLote.Text.Trim());

                // Actualizar la relación en la base de datos


                // if (resultado)
                // {
                //     MostrarMensajeYRedirigir(
                //         "Relación actualizada exitosamente", 
                //         ObtenerUrlRedireccion()
                //     );
                // }
                // else
                // {
                //     MostrarMensaje("Error al actualizar la relación. Por favor, intente nuevamente.");
                // }

                // Simulación de actualización exitosa
                MostrarMensajeYRedirigir(
                    "Relación actualizada exitosamente",
                    ObtenerUrlRedireccion()
                );
            }
            catch (FormatException)
            {
                MostrarMensaje("Por favor, ingrese valores numéricos válidos para los IDs");
            }
            catch (Exception ex)
            {
                MostrarMensaje($"Error al actualizar la relación: {ex.Message}");
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect(ObtenerUrlRedireccion());
        }

        private string ObtenerUrlRedireccion()
        {
            if (!string.IsNullOrEmpty(idAlmacen.ToString()))
            {
                return $"../MostrarAlmacen.aspx?id={idAlmacen}&tab=MovimientosXLotes";
            }
            else
            {
                return "ListarAlmacenes.aspx";
            }
        }

        private void MostrarMensaje(string mensaje)
        {
            ClientScript.RegisterStartupScript(
                this.GetType(),
                "alert",
                $"alert('{mensaje.Replace("'", "\\'")}');",
                true
            );
        }

        private void MostrarMensajeYRedirigir(string mensaje, string url)
        {
            ClientScript.RegisterStartupScript(
                this.GetType(),
                "alertAndRedirect",
                $"alert('{mensaje.Replace("'", "\\'")}'); window.location='{url}';",
                true
            );
        }
    }
}
