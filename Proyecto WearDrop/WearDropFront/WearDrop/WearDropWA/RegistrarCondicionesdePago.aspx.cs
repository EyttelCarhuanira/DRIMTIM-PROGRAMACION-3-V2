using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WearDropWA
{
    public partial class RegistrarCondicionesdePago : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarCondiciones();
            }
        }

        // Simula datos (puedes reemplazar por BD)
        private void CargarCondiciones()
        {
            var lista = new List<dynamic>
            {
                new { ID = 1, Descripcion = "Contado", NumeroDias = 0 },
                new { ID = 2, Descripcion = "Crédito 15 días", NumeroDias = 15 },
                new { ID = 3, Descripcion = "Crédito 30 días", NumeroDias = 30 }
            };

            dgvCondicionesPago.DataSource = lista;
            dgvCondicionesPago.DataBind();
        }

        protected void dgvCondicionesPago_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvCondicionesPago.PageIndex = e.NewPageIndex;
            CargarCondiciones();
        }

        protected void btnRegistrarCondicion_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/RegistrarCondicion.aspx");
        }

        protected void btnModificarCondicion_Click(object sender, EventArgs e)
        {
            var btn = (LinkButton)sender;
            int id = Convert.ToInt32(btn.CommandArgument);
            Response.Redirect($"~/RegistrarCondicionPagoNueva.aspx?modo=editar&id={id}");
        }

        protected void btnVerCondicion_Click(object sender, EventArgs e)
        {
            var btn = (LinkButton)sender;
            int id = Convert.ToInt32(btn.CommandArgument);
            Response.Redirect($"~/VerCondicionPago.aspx?id={id}");
        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/RegistrarProveedor.aspx");
        }
    }
}