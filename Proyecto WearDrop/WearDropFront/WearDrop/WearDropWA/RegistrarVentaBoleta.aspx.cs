using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WearDropWA
{
    public partial class RegistrarVentaBoleta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblTotal.Text = "0.00";

                // 🔹 Si venimos en modo "modificar", cambia el título
                string modo = Request.QueryString["modo"];
                if (!string.IsNullOrEmpty(modo) && modo.Equals("modificar", StringComparison.OrdinalIgnoreCase))
                {
                    lblTitulo.InnerText = "Modificar Boleta";
                }
            }
        }

        // 🔹 Botón "Regresar"
        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            // Mantener el estado "modo" si existe
            string modo = Request.QueryString["modo"];
            if (!string.IsNullOrEmpty(modo) && modo.Equals("modificar", StringComparison.OrdinalIgnoreCase))
            {
                Response.Redirect("~/RegistroVentaResumenVenta.aspx?modo=modificar");
            }
            else
            {
                Response.Redirect("~/RegistroVentaResumenVenta.aspx");
            }
        }


        // 🔹 Botón "Registrar Venta"
        protected void btnRegistrarVenta_Click(object sender, EventArgs e)
        {
            try
            {
                // Validaciones básicas
                if (string.IsNullOrWhiteSpace(txtDNI.Text) ||
                    string.IsNullOrWhiteSpace(txtNombresApellidos.Text) ||
                    string.IsNullOrWhiteSpace(txtEmail.Text) ||
                    string.IsNullOrWhiteSpace(txtIGV.Text))
                {
                    MostrarMensaje("Por favor, completa todos los campos antes de registrar la venta.");
                    return;
                }

                // Validar que IGV sea numérico
                if (!decimal.TryParse(txtIGV.Text, out decimal igv))
                {
                    MostrarMensaje("El campo IGV debe ser un número válido.");
                    return;
                }

                // 🔸 Aquí podrías calcular el total real o guardar los datos en base de datos
                decimal total = CalcularTotalConIGV(igv);
                lblTotal.Text = total.ToString("0.00");

                // 🔸 Simulación de guardado (aquí iría tu inserción a BD)
                // Ejemplo: GuardarBoleta(txtDNI.Text, txtNombresApellidos.Text, txtEmail.Text, igv, total);

                MostrarMensaje("✅ Venta registrada correctamente.");
                LimpiarCampos();
            }
            catch (Exception ex)
            {
                MostrarMensaje("❌ Error al registrar la venta: " + ex.Message);
            }

            Response.Redirect("~/GestionarVentas.aspx");
        }

        // 🔹 Calcula el total considerando el IGV
        private decimal CalcularTotalConIGV(decimal igv)
        {
            // Supongamos un subtotal fijo solo para ejemplo:
            decimal subtotal = 100; // <-- este valor vendría de tus productos o lógica real
            decimal total = subtotal + (subtotal * (igv / 100));
            return total;
        }

        // 🔹 Limpia los campos después de guardar
        private void LimpiarCampos()
        {
            txtDNI.Text = string.Empty;
            txtNombresApellidos.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtIGV.Text = string.Empty;
        }

        // 🔹 Método para mostrar mensajes en el navegador
        private void MostrarMensaje(string mensaje)
        {
            string script = $"alert('{mensaje.Replace("'", "\\'")}');";
            ScriptManager.RegisterStartupScript(this, GetType(), "msg", script, true);
        }
    }
}