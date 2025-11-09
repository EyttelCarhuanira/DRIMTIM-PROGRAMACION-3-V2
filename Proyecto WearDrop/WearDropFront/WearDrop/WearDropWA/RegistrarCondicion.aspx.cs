using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WearDropWA
{
    public partial class RegistrarCondicion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblTitulo.InnerText = "Registrar Condición";
                // Si recibes parámetros (por ejemplo, IDProveedor)
                if (Request.QueryString["idProveedor"] != null)
                {
                    txtIDProveedor.Text = Request.QueryString["idProveedor"];
                }
            }
        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/RegistrarCondicionesdePago.aspx");
        }

        protected void btnRegistrarCondicion_Click(object sender, EventArgs e)
        {
            // Aquí puedes añadir validaciones y lógica para guardar la condición
            string numeroDias = txtNumeroDias.Text;
            string descripcion = txtDescripcion.Text;

            if (string.IsNullOrWhiteSpace(numeroDias) || string.IsNullOrWhiteSpace(descripcion))
            {
                MostrarMensaje("Por favor, completa todos los campos obligatorios.");
                return;
            }

            MostrarMensaje("✅ Condición registrada correctamente.");
            LimpiarCampos();

            Response.Redirect("~/RegistrarCondicionesdePago.aspx");
        }

        private void MostrarMensaje(string mensaje)
        {
            string script = $"alert('{mensaje.Replace("'", "\\'")}');";
            ScriptManager.RegisterStartupScript(this, GetType(), "msg", script, true);
        }

        private void LimpiarCampos()
        {
            txtNumeroDias.Text = "";
            txtDescripcion.Text = "";
        }
    }
}