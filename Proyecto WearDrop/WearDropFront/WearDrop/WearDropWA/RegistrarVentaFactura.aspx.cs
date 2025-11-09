using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WearDropWA
{
    public partial class RegistrarVentaFactura : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblTotal.Text = "0.00";
            }
        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/RegistroVentaResumenVenta.aspx");
        }

        protected void btnRegistrarVenta_Click(object sender, EventArgs e)
        {
            try
            {
                // Validaciones básicas
                if (string.IsNullOrWhiteSpace(txtRUC.Text) ||
                    string.IsNullOrWhiteSpace(txtRazonSocial.Text) ||
                    string.IsNullOrWhiteSpace(txtDireccion.Text) ||
                    string.IsNullOrWhiteSpace(txtNombresApellidos.Text) ||
                    string.IsNullOrWhiteSpace(txtIGV.Text) ||
                    string.IsNullOrWhiteSpace(ddlMetodoPago.SelectedValue))
                {
                    MostrarMensaje("Por favor, complete todos los campos antes de registrar la factura.");
                    return;
                }

                // Validar formato de RUC
                if (txtRUC.Text.Length != 11 || !long.TryParse(txtRUC.Text, out _))
                {
                    MostrarMensaje("El RUC debe contener 11 dígitos numéricos.");
                    return;
                }

                // Validar IGV
                if (!decimal.TryParse(txtIGV.Text, out decimal igv))
                {
                    MostrarMensaje("El IGV debe ser un número válido.");
                    return;
                }

                decimal total = CalcularTotalConIGV(igv);
                lblTotal.Text = total.ToString("0.00");

                // Aquí iría tu lógica de guardado a base de datos
                // GuardarFactura(txtRUC.Text, txtRazonSocial.Text, ddlMetodoPago.SelectedValue, txtDireccion.Text, txtNombresApellidos.Text, igv, total);

                MostrarMensaje("✅ Factura registrada correctamente.");
                LimpiarCampos();
            }
            catch (Exception ex)
            {
                MostrarMensaje("❌ Error al registrar la factura: " + ex.Message);
            }


            Response.Redirect("~/GestionarVentas.aspx");
        }

        private decimal CalcularTotalConIGV(decimal igv)
        {
            decimal subtotal = 100; // ejemplo
            return subtotal + (subtotal * (igv / 100));
        }

        private void LimpiarCampos()
        {
            txtRUC.Text = string.Empty;
            txtRazonSocial.Text = string.Empty;
            ddlMetodoPago.SelectedIndex = 0;
            txtDireccion.Text = string.Empty;
            txtNombresApellidos.Text = string.Empty;
            txtIGV.Text = "18";
        }

        private void MostrarMensaje(string mensaje)
        {
            string script = $"alert('{mensaje.Replace("'", "\\'")}');";
            ScriptManager.RegisterStartupScript(this, GetType(), "msg", script, true);
        }
    }
}