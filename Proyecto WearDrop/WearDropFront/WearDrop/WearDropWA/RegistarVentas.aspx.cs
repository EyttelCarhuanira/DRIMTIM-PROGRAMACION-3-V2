using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WearDropWA
{
    public partial class RegistarVentas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Detectar si se está modificando una venta
                string modo = Request.QueryString["modo"];
                string idVenta = Request.QueryString["id"];

                if (!string.IsNullOrEmpty(modo) && modo == "editar")
                {
                    lblTitulo.InnerText = "Modificar Venta";
                    tituloPagina.InnerText = "Modificar Venta";

                    // Cargar datos de la venta a modificar (ejemplo)
                    CargarProductosVenta(); // Puedes cargar datos específicos según ID
                }
                else
                {
                    lblTitulo.InnerText = "Registrar Venta";
                    tituloPagina.InnerText = "Registrar Venta";
                    CargarProductosVenta();
                }
            }
        }

        // 🔹 Carga datos de ejemplo (puedes reemplazar por la BD)
        private void CargarProductosVenta()
        {
            var productos = new List<dynamic>
            {
                new { Nº = 1, Prenda = "Polo Oversize", Talla = "M", Cantidad = 2, Promociones = "2x1", Descuentos = "0%", Subtotal = 120.00 },
                new { Nº = 2, Prenda = "Jeans Skinny", Talla = "L", Cantidad = 1, Promociones = "-", Descuentos = "10%", Subtotal = 90.50 },
                new { Nº = 3, Prenda = "Casaca Denim", Talla = "S", Cantidad = 1, Promociones = "-", Descuentos = "0%", Subtotal = 150.00 },
                new { Nº = 4, Prenda = "Short Deportivo", Talla = "M", Cantidad = 3, Promociones = "3x2", Descuentos = "0%", Subtotal = 180.00 },
                new { Nº = 5, Prenda = "Gorra Bordada", Talla = "-", Cantidad = 1, Promociones = "-", Descuentos = "0%", Subtotal = 45.00 },
                new { Nº = 6, Prenda = "Gorra Bordada", Talla = "-", Cantidad = 1, Promociones = "-", Descuentos = "0%", Subtotal = 45.00 },
                new { Nº = 7, Prenda = "Gorra Bordada", Talla = "-", Cantidad = 1, Promociones = "-", Descuentos = "0%", Subtotal = 45.00 },
                new { Nº = 8, Prenda = "Gorra Bordada", Talla = "-", Cantidad = 1, Promociones = "-", Descuentos = "0%", Subtotal = 45.00 },
                new { Nº = 9, Prenda = "Gorra Bordada", Talla = "-", Cantidad = 1, Promociones = "-", Descuentos = "0%", Subtotal = 45.00 }
            };

            dgvProductosVenta.DataSource = productos;
            dgvProductosVenta.DataBind();
        }


        protected void btnRegresarVentaProducto_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/GestionarVentas.aspx");
        }

        protected void dgvProductosVenta_PreRender(object sender, EventArgs e)
        {
            if (dgvProductosVenta.Rows.Count > 0)
            {
                // 🔹 Forzar que el encabezado esté dentro de <thead>
                dgvProductosVenta.UseAccessibleHeader = true;
                dgvProductosVenta.HeaderRow.TableSection = TableRowSection.TableHeader;

                // 🔹 Si hay un pie (footer), también lo seccionamos
                if (dgvProductosVenta.FooterRow != null)
                {
                    dgvProductosVenta.FooterRow.TableSection = TableRowSection.TableFooter;
                }
            }
        }


        protected void btnIrAnnadirProductos_Click(object sender, EventArgs e)
        {
            // Redirige a otra página, por ejemplo "RegistrarVenta.aspx"
            Response.Redirect("~/AnnadirProductoVenta.aspx");
        }


            protected void btnIniciarRegistroVenta_Click(object sender, EventArgs e)
        {
            // Detectar si estamos en modo editar o registrar
            string modo = Request.QueryString["modo"];
            string idVenta = Request.QueryString["id"];

            if (!string.IsNullOrEmpty(modo) && modo == "editar" && !string.IsNullOrEmpty(idVenta))
            {
                // Si estamos modificando, pasamos el modo y el id
                Response.Redirect($"~/RegistroVentaResumenVenta.aspx?modo=editar&id={idVenta}");
            }
            else
            {
                // Si estamos registrando
                Response.Redirect("~/RegistroVentaResumenVenta.aspx?modo=registrar");
            }
        }
    }
}