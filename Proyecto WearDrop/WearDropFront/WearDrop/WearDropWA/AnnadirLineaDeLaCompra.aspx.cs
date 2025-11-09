using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WearDropWA
{
    public partial class AnnadirLineaDeLaCompra : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarTiposDePrenda();
            }
        }

        // 🔹 Cargar los tipos de prenda en el DropDownList
        private void CargarTiposDePrenda()
        {
            // Aquí podrías traer los datos de la base de datos
            ddlTipoPrenda.Items.Clear();
            ddlTipoPrenda.Items.Add("Seleccione un tipo de prenda");
            ddlTipoPrenda.Items.Add("Camisa");
            ddlTipoPrenda.Items.Add("Pantalón");
            ddlTipoPrenda.Items.Add("Chaqueta");
            ddlTipoPrenda.Items.Add("Falda");
        }

        // 🔹 Evento: Seleccionar Prenda
        protected void btnSeleccionarPrenda_Click(object sender, EventArgs e)
        {
            string tipoSeleccionado = ddlTipoPrenda.SelectedValue;

            if (string.IsNullOrEmpty(tipoSeleccionado) || tipoSeleccionado == "Seleccione un tipo de prenda")
            {
                MostrarMensaje("Por favor, seleccione un tipo de prenda antes de continuar.");
                return;
            }

            // Simulación de obtener datos de la prenda
            txtNombrePrenda.Text = "Prenda seleccionada: " + tipoSeleccionado;
        }

        // 🔹 Evento: Ver Prenda
        protected void btnVerPrenda_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtNombrePrenda.Text))
            {
                MostrarMensaje("Debe seleccionar primero una prenda.");
                return;
            }

            // Redirige a una página de detalle de prenda (por ejemplo)
            Response.Redirect("VerPrenda.aspx");
        }

        // 🔹 Evento: Regresar
        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            // Redirige a la página anterior (ajústala según tu flujo)
            Response.Redirect("~/RegistrarOrdenCompra.aspx");
        }

        // 🔹 Evento: Añadir Línea
        protected void btnAnadirLinea_Click(object sender, EventArgs e)
        {
            // Validar los campos requeridos
            if (string.IsNullOrEmpty(txtNombrePrenda.Text) ||
                string.IsNullOrEmpty(txtIDLote.Text) ||
                string.IsNullOrEmpty(txtPrecioLote.Text))
            {
                MostrarMensaje("Por favor, complete todos los campos requeridos (*) antes de añadir la línea.");
                return;
            }

            // Aquí podrías guardar la información en la base de datos
            string nombre = txtNombrePrenda.Text;
            string idLote = txtIDLote.Text;
            string precio = txtPrecioLote.Text;

            // Ejemplo de confirmación temporal
            MostrarMensaje($"✔ Línea añadida correctamente:\n\nPrenda: {nombre}\nID Lote: {idLote}\nPrecio: S/{precio}");
        }

        // 🔹 Método auxiliar para mostrar alertas en el navegador
        private void MostrarMensaje(string mensaje)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "alert", $"alert('{mensaje}');", true);
        }
    }
}