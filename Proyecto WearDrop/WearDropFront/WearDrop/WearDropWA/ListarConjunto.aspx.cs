using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WearDropWA
{
    public partial class ListarConjunto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Prueba de DataTable para ver el formato en el GridView
            DataTable dt = new DataTable();
            dt.Columns.Add("IdPromocion");
            dt.Columns.Add("Nombre");
            dt.Columns.Add("Porcentaje Promocion");

            // Agrega filas de prueba para ver el formato
            dt.Rows.Add("1", "Promocion Por Falda", "50" );
            dt.Rows.Add("2", "Promocion Por  Jean", "80");
            dt.Rows.Add("3", "Promocion Por  Falda", "100");

            gvConjunto.DataSource = dt;
            gvConjunto.DataBind();
        }

        protected void lkFiltrar_Click(object sender, EventArgs e)
        {

        }
        protected void lkRegistrar_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegistrarConjunto.aspx");
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListarConjunto.aspx");
        }
        protected void btnModificar_Click(object sender, EventArgs e)
        {
            Response.Redirect("ModificarConjunto.aspx");
        }
        protected void btnVisualizar_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListarConjunto.aspx");
        }
    }
}