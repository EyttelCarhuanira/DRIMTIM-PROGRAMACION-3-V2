using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WearDropWA
{
    public partial class RegistrarProveedor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Si estamos editando un proveedor, se puede cargar aquí su información.
                string id = Request.QueryString["id"];
                if (!string.IsNullOrEmpty(id))
                {
                    CargarDatosProveedor(Convert.ToInt32(id));
                }
            }
        }

        private void CargarDatosProveedor(int idProveedor)
        {
            // 🔹 Aquí cargarías los datos desde la base de datos
            // Simulación:
            txtIDProveedor.Text = idProveedor.ToString();
            txtNombre.Text = "Proveedor Ejemplo";
            txtDireccion.Text = "Av. Los Olivos 123";
            txtRUC.Text = "20456789123";
            txtTelefono.Text = "987654321";
        }

        protected void btnRegistrarProveedor_Click(object sender, EventArgs e)
        {
            string nombre = txtNombre.Text;
            string direccion = txtDireccion.Text;
            string ruc = txtRUC.Text;
            string telefono = txtTelefono.Text;

            // 🔹 Validación básica
            if (string.IsNullOrWhiteSpace(nombre) || string.IsNullOrWhiteSpace(direccion) ||
                string.IsNullOrWhiteSpace(ruc) || string.IsNullOrWhiteSpace(telefono))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alerta",
                    "alert('Por favor, complete todos los campos obligatorios.');", true);
                return;
            }

            // 🔹 Simular guardado (en BD real usarías tu capa de negocio)
            ScriptManager.RegisterStartupScript(this, GetType(), "alerta",
                "alert('Proveedor registrado correctamente.');", true);

            // Opcional: redirigir después del registro
            Response.Redirect("~/GestionarProveedores.aspx");
        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/GestionarProveedores.aspx");
        }

        protected void btnAñadirCondiciones_Click(object sender, EventArgs e)
        {
            // Aquí podrías abrir un modal o redirigir a otra página
            Response.Redirect("~/RegistrarCondicionesdePago.aspx");
        }
    }
}