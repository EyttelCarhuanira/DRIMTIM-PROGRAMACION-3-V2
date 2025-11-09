using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WearDropWA
{
    public partial class GestionarProveedores : System.Web.UI.Page
    {
        private DataTable ObtenerProveedores()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("ID", typeof(int));
            dt.Columns.Add("Nombre", typeof(string));
            dt.Columns.Add("Telefono", typeof(string));
            dt.Columns.Add("Direccion", typeof(string));
            dt.Columns.Add("RUC", typeof(string));

            // Datos de ejemplo
            dt.Rows.Add(1, "Proveedor Alpha", "987654321", "Av. Los Olivos 123", "20456789123");
            dt.Rows.Add(2, "Proveedor Beta", "945612378", "Jr. Primavera 456", "20123456789");
            dt.Rows.Add(3, "Proveedor Gamma", "999111222", "Calle Las Flores 789", "20567891234");
            dt.Rows.Add(4, "Proveedor Delta", "956789123", "Av. Grau 890", "20876543210");
            dt.Rows.Add(5, "Proveedor Omega", "912345678", "Jr. Los Sauces 147", "20999988877");

            return dt;
        }

        // 🔹 Carga inicial
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarProveedores();
            }
        }

        // 🔹 Cargar datos en el GridView
        private void CargarProveedores()
        {
            DataTable proveedores = ObtenerProveedores();
            dgvProveedores.DataSource = proveedores;
            dgvProveedores.DataBind();
        }

        // 🔹 Evento de paginación
        protected void dgvProveedores_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvProveedores.PageIndex = e.NewPageIndex;
            CargarProveedores();
        }

        // 🔹 Click en "Registrar"
        protected void btnRegistrarProveedor_Click(object sender, EventArgs e)
        {
            // Aquí rediriges a la página para registrar un nuevo proveedor
            Response.Redirect("~/RegistrarProveedor.aspx");
        }

        // 🔹 Click en "Modificar" (ícono del lápiz)
        protected void btnModificarProveedor_Click(object sender, EventArgs e)
        {
            var btn = (LinkButton)sender;
            int idProveedor = Convert.ToInt32(btn.CommandArgument);

            // Redirige con parámetro para editar
            Response.Redirect($"~/RegistrarProveedor.aspx?modo=editar&id={idProveedor}");
        }

        // 🔹 Click en "Ver" (ícono del ojo)
        protected void btnVerProveedor_Click(object sender, EventArgs e)
        {
            var btn = (LinkButton)sender;
            int idProveedor = Convert.ToInt32(btn.CommandArgument);

            // Redirige a la página de detalles del proveedor
            Response.Redirect($"~/VerProveedor.aspx?id={idProveedor}");
        }

        // 🔹 (Opcional) Click en "Eliminar"
        protected void btnEliminarProveedor_Click(object sender, EventArgs e)
        {
            // Aquí colocarías la lógica para eliminar el proveedor.
            // En esta versión demo, solo muestra un mensaje.
            ScriptManager.RegisterStartupScript(this, GetType(), "alerta",
                "alert('Proveedor eliminado correctamente (simulación).');", true);
        }
    }
}