using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WearDropWA
{
    public partial class ListarClientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Prueba de DataTable para ver el formato en el GridView
            DataTable dt = new DataTable();
            dt.Columns.Add("IdCliente");
            dt.Columns.Add("Nombre");
            dt.Columns.Add("Apellidos");
            dt.Columns.Add("Dni");
            dt.Columns.Add("TipoCliente");

            // Agrega filas de prueba para ver el formato
            dt.Rows.Add("1", "Hercule123", "Zeus", "82138129","Chevere");
            dt.Rows.Add("2", "Zeus123", "Cronos", "1283291","Choro");
            dt.Rows.Add("3", "Zeus123", "Cronos", "1283291", "Choro");

            gvClientes.DataSource = dt;
            gvClientes.DataBind();
        }

        protected void btnVisualizar_Click(object sender, EventArgs e)
        {
            Response.Redirect("VerCliente.aspx");
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {

        }

        protected void lkRegistrar_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegistrarClientes.aspx");
        }

        protected void lkFiltrar_Click(object sender, EventArgs e)
        {

        }
    }
}