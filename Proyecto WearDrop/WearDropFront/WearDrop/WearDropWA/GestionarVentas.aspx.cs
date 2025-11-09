using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WearDropWA
{
    public partial class GestionarVentas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarVentas();
            }
        }

        private void CargarVentas()
        {
            // Ejemplo de lista de datos (puedes reemplazar con tu conexión a BD)
            var ventas = new List<dynamic>
    {
        new { ID="1", Fecha=DateTime.Now.AddDays(-100) ,
            Monto=200.0,Comprobante = "Boleta",
            Cliente = "María López" },

        new { ID="2", Fecha=DateTime.Now.AddDays(-100) ,
            Monto=200.0,Comprobante = "Boleta",
            Cliente = "María López" },
         new { ID="3", Fecha=DateTime.Now.AddDays(-100) ,
            Monto=200.0,Comprobante = "Boleta",
            Cliente = "María López" },
        new { ID="4", Fecha=DateTime.Now.AddDays(-100) ,
            Monto=200.0,Comprobante = "Boleta",
            Cliente = "María López" },
          new { ID="5", Fecha=DateTime.Now.AddDays(-100) ,
            Monto=200.0,Comprobante = "Boleta",
            Cliente = "María López" },
            new { ID="6", Fecha=DateTime.Now.AddDays(-100) ,
            Monto=200.0,Comprobante = "Boleta",
            Cliente = "María López" },
            new { ID="7", Fecha=DateTime.Now.AddDays(-100) ,
            Monto=200.0,Comprobante = "Boleta",
            Cliente = "María López" },
            new { ID="8", Fecha=DateTime.Now.AddDays(-100) ,
            Monto=200.0,Comprobante = "Boleta",
            Cliente = "María López" },
            new { ID="9", Fecha=DateTime.Now.AddDays(-100) ,
            Monto=200.0,Comprobante = "Boleta",
            Cliente = "María López" },
    };

            dgvVentas.DataSource = ventas;
            dgvVentas.DataBind();
        }

        protected void dgvVentas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvVentas.PageIndex = e.NewPageIndex;
            CargarVentas();
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            var btn = (LinkButton)sender;
            int id = Convert.ToInt32(btn.CommandArgument);

            // Redirigimos con parámetros
            Response.Redirect($"~/RegistarVentas.aspx?modo=editar&id={id}");
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            var btn = (LinkButton)sender;
            int id = Convert.ToInt32(btn.CommandArgument);
            // Lógica para eliminar
        }

        protected void btnVerVenta_Click(object sender, EventArgs e)
        {
            // Recupera el botón que disparó el evento
            var btn = (LinkButton)sender;

            // Obtiene el ID de la venta desde CommandArgument
            int idVenta = Convert.ToInt32(btn.CommandArgument);

            // Redirige a la página VerVentaResumen.aspx con el ID
            Response.Redirect($"~/VerVentaResumen.aspx?id={idVenta}");
        }
        protected void btnIrARegistrarVenta_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/RegistarVentas.aspx");
        }

    }
}