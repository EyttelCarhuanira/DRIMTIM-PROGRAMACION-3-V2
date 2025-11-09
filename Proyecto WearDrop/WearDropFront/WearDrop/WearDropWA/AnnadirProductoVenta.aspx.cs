using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WearDropWA
{
    public partial class AnnadirProductoVenta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSeleccionarPrenda_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SeleccionarPrendaAnnadirProducto.aspx"); // Cambia por la ruta real
        }


        protected void btnRegresarAnnadirProd_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/RegistarVentas.aspx"); // Cambia por la ruta real
        }

        protected void btnAnadirProducto_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/RegistarVentas.aspx"); // Cambia por la página de destino
        }
    }
}