using System;
using System.Collections.Generic;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WearDropWA
{
    public partial class ModificarLote : System.Web.UI.Page
    {
        private int idAlmacen;
        private int idLote;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null && Request.QueryString["idAlmacen"] != null)
                {
                    idLote = Convert.ToInt32(Request.QueryString["id"]);
                    idAlmacen = Convert.ToInt32(Request.QueryString["idAlmacen"]);

                    ViewState["IdLote"] = idLote;
                    ViewState["IdAlmacen"] = idAlmacen;

                    CargarDatosLote();
                    CargarPrendas();
                }
                else
                {
                    Response.Redirect("~/Almacen/ListarAlmacenes.aspx");
                }
            }
            else
            {
                idLote = (int)ViewState["IdLote"];
                idAlmacen = (int)ViewState["IdAlmacen"];
            }
        }

        private void CargarDatosLote()
        {
            // Datos de prueba
            lblNombreAlmacen.Text = "Almacén Central";
            txtDescripcionLote.Text = "Lote Camisetas Verano 2024";
        }

        private void CargarPrendas()
        {
            // Datos de prueba - prendas del lote
            var prendasTest = new List<dynamic>
            {
                new { IdPrenda = 1, NombrePrenda = "Camiseta Básica Blanca", Color = "Blanco", Material = "Algodón", Stock = 50, Talla = "M" },
                new { IdPrenda = 2, NombrePrenda = "Camiseta Básica Negra", Color = "Negro", Material = "Algodón", Stock = 45, Talla = "M" },
                new { IdPrenda = 3, NombrePrenda = "Camiseta Básica Azul", Color = "Azul", Material = "Algodón", Stock = 40, Talla = "L" },
                new { IdPrenda = 4, NombrePrenda = "Camiseta Básica Roja", Color = "Rojo", Material = "Algodón", Stock = 35, Talla = "S" },
                new { IdPrenda = 5, NombrePrenda = "Camiseta Básica Verde", Color = "Verde", Material = "Algodón", Stock = 30, Talla = "M" },
                new { IdPrenda = 6, NombrePrenda = "Camiseta Básica Gris", Color = "Gris", Material = "Algodón", Stock = 25, Talla = "L" },
                new { IdPrenda = 7, NombrePrenda = "Camiseta Básica Amarilla", Color = "Amarillo", Material = "Algodón", Stock = 20, Talla = "XL" }
            };

            gvPrendas.DataSource = prendasTest;
            gvPrendas.DataBind();
        }

        // Método para generar la paginación personalizada
        protected string GenerarPaginacion(int currentPage, int totalPages)
        {
            StringBuilder sb = new StringBuilder();

            // Mostrar solo 3 páginas alrededor de la actual
            int startPage = Math.Max(2, currentPage);
            int endPage = Math.Min(totalPages - 1, currentPage + 2);

            for (int i = startPage; i <= endPage; i++)
            {
                string activeClass = i == currentPage + 1 ? "active" : "";
                sb.AppendFormat(@"
                    <li class='page-item {0}'>
                        <a class='page-link' href='javascript:void(0)' 
                           onclick=""__doPostBack('ctl00${1}$gvPrendas','Page${2}')"">{2}</a>
                    </li>",
                    activeClass,
                    this.Master.GetType().Name == "WearDrop1_Master" ? "MainContent" : "ContentPlaceHolder1",
                    i);
            }

            return sb.ToString();
        }

        protected void gvPrendas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvPrendas.PageIndex = e.NewPageIndex;
            CargarPrendas();
        }

        protected void btnAñadirPrenda_Click(object sender, EventArgs e)
        {
            // Redirigir a página para añadir prenda al lote (Todavia no implementado)
            //Response.Redirect($"~/Almacen/Lote/AgregarPrenda.aspx?idLote={idLote}&idAlmacen={idAlmacen}");
        }

        protected void btnFiltrarPrenda_Click(object sender, EventArgs e)
        {
            // Implementar lógica de filtro
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int idPrenda = int.Parse(btn.CommandArgument);

            // Redirigir a modificar prenda (Todavia no Implementado)
            Response.Redirect($"~/Prenda/ModificarPrenda.aspx?id={idPrenda}&idLote={idLote}");
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int idPrenda = int.Parse(btn.CommandArgument);


            CargarPrendas();
        }

        protected void lkGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                string descripcion = txtDescripcionLote.Text.Trim();

                // LoteBO loteBO = new LoteBO();
                // bool resultado = loteBO.Modificar(idLote, descripcion);

                bool resultado = true;

                if (resultado)
                {
                    Response.Redirect($"~/Almacen/MostrarAlmacen.aspx?id={idAlmacen}&msg=updated");
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert",
                        "alert('Error al modificar el lote');", true);
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert",
                    $"alert('Error: {ex.Message}');", true);
            }
        }

        protected void lkCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect($"~/Almacen/MostrarAlmacen.aspx?id={idAlmacen}");
        }
    }
}