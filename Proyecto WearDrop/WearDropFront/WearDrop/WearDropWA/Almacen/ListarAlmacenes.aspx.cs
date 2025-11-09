using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WearDropWA
{
    public partial class ListarAlmacenes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarAlmacenes();
            }
        }

        private void CargarAlmacenes()
        {
            // Por ahora uso datos de prueba
            DataTable dt = new DataTable();
            dt.Columns.Add("IdAlmacen");
            dt.Columns.Add("Nombre");
            dt.Columns.Add("Ubicacion");
            dt.Columns.Add("Stock");

            // Agrega filas de prueba para ver el formato
            dt.Rows.Add("1", "Almacén Central", "Lima Centro", "100");
            dt.Rows.Add("2", "Almacén Norte", "San Martín de Porres", "85");
            dt.Rows.Add("3", "Almacén Sur", "Villa El Salvador", "120");

            gvAlmacenes.DataSource = dt;
            gvAlmacenes.DataBind();
        }

        protected void lkRegistrar_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegistrarAlmacen.aspx");
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int idAlmacen = int.Parse(btn.CommandArgument);
            Response.Redirect($"ModificarAlmacen.aspx?id={idAlmacen}");
        }

        protected void btnVisualizar_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int idAlmacen = int.Parse(btn.CommandArgument);
            Response.Redirect($"MostrarAlmacen.aspx?id={idAlmacen}");
        }

        protected void btnConfirmarEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                int idAlmacen = int.Parse(hfIdAlmacenEliminar.Value);

                // Ejemplo:
                // AlmacenBL almacenBL = new AlmacenBL();
                // bool resultado = almacenBL.EliminarAlmacen(idAlmacen);

                // Por ahora solo mostramos un mensaje
                ScriptManager.RegisterStartupScript(this, GetType(), "alert",
                    $"alert('Almacén con ID {idAlmacen} eliminado correctamente'); cerrarModal();", true);

                // Recargar los datos del GridView
                CargarAlmacenes();
            }
            catch (Exception ex)
            {
                // Manejo de errores
                ScriptManager.RegisterStartupScript(this, GetType(), "alert",
                    $"alert('Error al eliminar: {ex.Message}'); cerrarModal();", true);
            }
        }
    }
}