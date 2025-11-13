using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WearDropWA
{
    public partial class ListarMonto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Prueba de DataTable para ver el formato en el GridView
            DataTable dt = new DataTable();
            dt.Columns.Add("IdDescuento");
            dt.Columns.Add("Nombre");
            dt.Columns.Add("Monto Editable");
            dt.Columns.Add("Monto Máximo");
            // Agrega filas de prueba para ver el formato
            dt.Rows.Add("1", "Descuento Por Polo", "50","100");
            dt.Rows.Add("2", "Descuento Por  Jean", "80","103");
            dt.Rows.Add("3", "Descuento Por  Falda", "100","203");

            gvMonto.DataSource = dt;
            gvMonto.DataBind();
        }

        protected void lkFiltrar_Click(object sender, EventArgs e)
        {

        }
        protected void lkRegistrar_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegistrarMonto.aspx");
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListarMonto.aspx");
        }
        protected void btnModificar_Click(object sender, EventArgs e)
        {
            Response.Redirect("ModificarMonto.aspx");
        }
        protected void btnVisualizar_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListarMonto.aspx");
        }
    }
}