using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WearDropWA
{
    public partial class VerCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnVerCompras_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListarClientexCompras.aspx");
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {

        }
    }
}