using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WearDropWA
{
    public partial class RegistroVentaResumenVenta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // 🔹 Detectar modo desde la URL
                string modo = Request.QueryString["modo"];

                if (!string.IsNullOrEmpty(modo) && modo == "editar")
                {
                    lblTitulo.InnerText = "Modificar Venta";
                    Page.Title = "Modificar Venta";
                }
                else
                {
                    lblTitulo.InnerText = "Registrar Venta";
                    Page.Title = "Registrar Venta";
                }

                // 🔹 Inicialización
                GenerarIDVenta();
                CargarDatosEmpleado();
                txtFecha.Text = DateTime.Now.ToString("yyyy-MM-dd");
            }
        }

        // -------------------- MÉTODOS AUXILIARES --------------------

        private void GenerarIDVenta()
        {
            // Ejemplo: generar un ID aleatorio de prueba
            Random rnd = new Random();
            txtIDVenta.Text = "VTA-" + rnd.Next(1000, 9999).ToString();
        }

        private void CargarDatosEmpleado()
        {
            // Ejemplo: valores simulados
            txtIDEmpleado.Text = "EMP-001";
            txtUsuarioEmpleado.Text = "usuario_demo";
        }

        // -------------------- EVENTOS DE BOTONES --------------------

        protected void btnRegistrarComprobante_Click(object sender, EventArgs e)
        {
            // Validar campos obligatorios
            if (string.IsNullOrWhiteSpace(txtDNICliente.Text))
            {
                MostrarMensaje("⚠️ El campo 'DNI del Cliente' es obligatorio.");
                return;
            }

            if (ddlTipoComprobante.SelectedValue == "")
            {
                MostrarMensaje("⚠️ Debe seleccionar un tipo de comprobante.");
                return;
            }

            // Obtener el tipo de comprobante seleccionado
            string tipoComprobante = ddlTipoComprobante.SelectedValue;

            // 🔹 Guardar datos de la venta (aquí puedes insertar en base de datos)
            // Simulación de registro
            string idVenta = txtIDVenta.Text;
            string dniCliente = txtDNICliente.Text.Trim();
            string idEmpleado = txtIDEmpleado.Text;
            string usuarioEmpleado = txtUsuarioEmpleado.Text.Trim();
            string fecha = txtFecha.Text;
            string montoTotal = txtMontoTotal.Text.Trim();

            // 🔹 Dependiendo del tipo de comprobante, redirigir a la página correspondiente
            if (tipoComprobante == "Boleta")
            {
                // Puedes pasar datos con query string si lo necesitas
                Response.Redirect($"~/RegistrarVentaBoleta.aspx?idVenta={idVenta}");
            }
            else if (tipoComprobante == "Factura")
            {
                Response.Redirect($"~/RegistrarVentaFactura.aspx?idVenta={idVenta}");
            }
            else
            {
                MostrarMensaje("⚠️ Tipo de comprobante no reconocido.");
            }
        }

        protected void btnRegresarVenta_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/RegistarVentas.aspx");
        }

        // -------------------- UTILIDADES --------------------

        private void MostrarMensaje(string mensaje)
        {
            string script = $"alert('{mensaje.Replace("'", "\\'").Replace("\n", "\\n")}');";
            ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
        }


    }
}