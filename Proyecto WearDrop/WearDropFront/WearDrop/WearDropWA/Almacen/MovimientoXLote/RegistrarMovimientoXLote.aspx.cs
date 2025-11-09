using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WearDropWA
{
    public partial class RegistrarRelacionMovimientoLote : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InicializarControles();

                // Si se pasa un ID de almacén por query string, almacenarlo
                if (Request.QueryString["IdAlmacen"] != null)
                {
                    ViewState["IdAlmacen"] = Request.QueryString["IdAlmacen"];
                }
            }
        }

        private void InicializarControles()
        {
            // Configurar fecha por defecto (solo visual, readonly)
            txtFecha.Text = DateTime.Now.ToString("yyyy-MM-dd");

            // Configurar el evento TextChanged para los campos de ID
            txtIdMovimiento.AutoPostBack = true;
            txtIdMovimiento.TextChanged += txtIdMovimiento_TextChanged;

            txtIdLote.AutoPostBack = true;
            txtIdLote.TextChanged += txtIdLote_TextChanged;
        }

        protected void txtIdMovimiento_TextChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(txtIdMovimiento.Text))
            {
                try
                {
                    int idMovimiento = Convert.ToInt32(txtIdMovimiento.Text.Trim());
                    CargarDatosMovimiento(idMovimiento);
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

        private void CargarDatosMovimiento(int idMovimiento)
        {
            try
            {

                // if (movimiento != null)
                // {
                //     txtLugarOrigen.Text = movimiento.LugarOrigen;
                //     txtLugarDestino.Text = movimiento.LugarDestino;
                //     txtFecha.Text = movimiento.Fecha.ToString("yyyy-MM-dd");
                //     txtTipo.Text = movimiento.TipoMovimiento; // Ahora es TextBox
                // }
                // else
                // {
                //     LimpiarCamposMovimiento();
                //     MostrarMensaje("No se encontró el movimiento especificado");
                // }

                // Datos de ejemplo para demostración:
                txtLugarOrigen.Text = "Almacén Central - Av. Principal 123";
                txtLugarDestino.Text = "Sucursal Norte - Calle Comercio 456";
                txtFecha.Text = DateTime.Now.ToString("yyyy-MM-dd");
                txtTipo.Text = "Transferencia";
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
                    int idLote = Convert.ToInt32(txtIdLote.Text.Trim());
                    CargarDatosLote(idLote);
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

        private void CargarDatosLote(int idLote)
        {
            try
            {

                // if (lote != null)
                // {
                //     txtDescripcion.Text = lote.Descripcion;
                // }
                // else
                // {
                //     LimpiarCamposLote();
                //     MostrarMensaje("No se encontró el lote especificado");
                // }

                // Datos de ejemplo para demostración:
                txtDescripcion.Text = $"Lote de productos textiles importados. Contiene 500 unidades de camisetas básicas en diferentes tallas y colores. Fecha de ingreso: {DateTime.Now.AddDays(-15).ToString("dd/MM/yyyy")}. Estado: Disponible para distribución.";
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

        protected void btnRegistrarRelacion_Click(object sender, EventArgs e)
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
                int idMovimiento = Convert.ToInt32(txtIdMovimiento.Text.Trim());
                int idLote = Convert.ToInt32(txtIdLote.Text.Trim());


                // if (resultado)
                // {
                //     MostrarMensajeYRedirigir(
                //         "Relación registrada exitosamente", 
                //         ObtenerUrlRedireccion()
                //     );
                // }
                // else
                // {
                //     MostrarMensaje("Error al registrar la relación. Por favor, intente nuevamente.");
                // }

                // Simulación de registro exitoso
                MostrarMensajeYRedirigir(
                    "Relación registrada exitosamente",
                    ObtenerUrlRedireccion()
                );
            }
            catch (FormatException)
            {
                MostrarMensaje("Por favor, ingrese valores numéricos válidos para los IDs");
            }
            catch (Exception ex)
            {
                MostrarMensaje($"Error al registrar la relación: {ex.Message}");
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect(ObtenerUrlRedireccion());
        }

        private string ObtenerUrlRedireccion()
        {
            string idAlmacen = ViewState["IdAlmacen"]?.ToString();

            if (!string.IsNullOrEmpty(idAlmacen))
            {
                return $"../MostrarAlmacen.aspx?IdAlmacen={idAlmacen}&tab=MovimientosXLotes";
            }
            else
            {
                return "../ListarAlmacenes.aspx";
            }
        }

        private void MostrarMensaje(string mensaje)
        {
            ScriptManager.RegisterStartupScript(
                this,
                GetType(),
                "alert",
                $"alert('{mensaje.Replace("'", "\\'")}');",
                true
            );
        }

        private void MostrarMensajeYRedirigir(string mensaje, string url)
        {
            ScriptManager.RegisterStartupScript(
                this,
                GetType(),
                "alertAndRedirect",
                $"alert('{mensaje.Replace("'", "\\'")}'); window.location='{url}';",
                true
            );
        }
    }
}
