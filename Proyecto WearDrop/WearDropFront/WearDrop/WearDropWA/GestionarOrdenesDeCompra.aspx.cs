using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WearDropWA
{
    public partial class GestionarOrdenesDeCompra : System.Web.UI.Page
    {
        public class OrdenCompra
        {
            public int ID { get; set; }
            public string FechaEmision { get; set; }
            public string FechaLlegada { get; set; }
            public string DeudaPendiente { get; set; }
            public string Empleado { get; set; }
            public string Proveedor { get; set; }
            public string MontoTotal { get; set; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarOrdenes();
            }
        }

        // 🔹 Cargar datos simulados (puedes reemplazar con tu conexión a BD)
        private void CargarOrdenes()
        {
            var listaOrdenes = new List<OrdenCompra>
            {
                new OrdenCompra { ID = 1, FechaEmision = "2025-10-01", FechaLlegada = "2025-10-05", DeudaPendiente = "S/ 150.00", Empleado = "Carlos Díaz", Proveedor = "Textiles Andinos", MontoTotal = "S/ 800.00" },
                new OrdenCompra { ID = 2, FechaEmision = "2025-10-10", FechaLlegada = "2025-10-15", DeudaPendiente = "S/ 0.00", Empleado = "María Pérez", Proveedor = "Importaciones LIMA", MontoTotal = "S/ 1200.00" },
                new OrdenCompra { ID = 3, FechaEmision = "2025-10-20", FechaLlegada = "2025-10-25", DeudaPendiente = "S/ 320.00", Empleado = "Jorge Ramírez", Proveedor = "Fabrica del Norte", MontoTotal = "S/ 1600.00" }
            };

            dgvOrdenesCompra.DataSource = listaOrdenes;
            dgvOrdenesCompra.DataBind();
        }

        // 🔹 Paginación del GridView
        protected void dgvOrdenesCompra_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvOrdenesCompra.PageIndex = e.NewPageIndex;
            CargarOrdenes();
        }

        // 🔹 Botón para registrar una nueva orden
        protected void btnRegistrarOrden_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/RegistrarOrdenCompra.aspx");
        }

        // 🔹 Botón para ver detalles de una orden específica
        protected void btnVerOrden_Click(object sender, EventArgs e)
        {
            var btn = (LinkButton)sender;
            int id = Convert.ToInt32(btn.CommandArgument);
            Response.Redirect($"~/VerOrdenCompra.aspx?id={id}");
        }

        // 🔹 Botón para modificar una orden existente
        protected void btnModificarOrden_Click(object sender, EventArgs e)
        {
            var btn = (LinkButton)sender;
            int id = Convert.ToInt32(btn.CommandArgument);
            Response.Redirect($"~/RegistrarOrdenCompra.aspx?modo=editar&id={id}");
        }

        // 🔹 Evento de eliminación (simulado)
        protected void btnEliminarOrden_Click(object sender, EventArgs e)
        {
            // Aquí colocarías la lógica real de eliminación en base de datos
            // Ejemplo:
            // int id = Convert.ToInt32(((LinkButton)sender).CommandArgument);
            // OrdenCompraDAO.Eliminar(id);

            ScriptManager.RegisterStartupScript(this, GetType(), "alert",
                "alert('Orden eliminada correctamente (simulación).');", true);

            CargarOrdenes();
        }
    }
}