using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WearDropWA
{
    public partial class RegistrarOrdenCompra : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                CargarDetalleOrden();
        }

        private void CargarDetalleOrden()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Numero");
            dt.Columns.Add("Prenda");
            dt.Columns.Add("Talla");
            dt.Columns.Add("Lote");
            dt.Columns.Add("Cantidad");
            dt.Columns.Add("PrecioLote");

            dt.Rows.Add("1", "Camisa", "M", "L001", "10", "500.00");
            dt.Rows.Add("2", "Pantalón", "L", "L002", "5", "300.00");

            dgvOrdenDetalle.DataSource = dt;
            dgvOrdenDetalle.DataBind();
        }

        protected void dgvOrdenDetalle_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvOrdenDetalle.PageIndex = e.NewPageIndex;
            CargarDetalleOrden();
        }

        protected void btnAgregarLinea_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AnnadirLineaDeLaCompra.aspx");
        }

        protected void btnEditarLinea_Click(object sender, EventArgs e)
        {
            var btn = (LinkButton)sender;
            string numero = btn.CommandArgument;
            Response.Write($"<script>alert('Editar línea N.º {numero}');</script>");
        }

        protected void btnEliminarLinea_Click(object sender, EventArgs e)
        {
            var btn = (LinkButton)sender;
            string numero = btn.CommandArgument;
            Response.Write($"<script>alert('Eliminar línea N.º {numero}');</script>");
        }

        protected void btnRegistrarOrden_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/GestionarOrdenesDeCompra.aspx");
        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/GestionarOrdenesDeCompra.aspx");
        }
    }
}