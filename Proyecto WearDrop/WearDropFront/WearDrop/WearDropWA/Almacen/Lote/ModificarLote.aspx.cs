using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using WearDropWA.PackageAlmacen;
using WearDropWA.PackagePrendas;

namespace WearDropWA
{
    public partial class ModificarLote : System.Web.UI.Page
    {
        private int idAlmacen;
        private int idLote;
        private LoteWSClient boLote;
        private AlmacenWSClient boAlmacen;
        private PrendaLoteWSClient wsPrendaLote;
        private PackageAlmacen.lote datLote;

        protected void Page_Load(object sender, EventArgs e)
        {
            boLote = new LoteWSClient();
            boAlmacen = new AlmacenWSClient();
            wsPrendaLote = new PrendaLoteWSClient();

            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null && Request.QueryString["idAlmacen"] != null)
                {
                    idLote = Convert.ToInt32(Request.QueryString["id"]);
                    idAlmacen = Convert.ToInt32(Request.QueryString["idAlmacen"]);

                    ViewState["IdLote"] = idLote;
                    ViewState["IdAlmacen"] = idAlmacen;

                    CargarDatosAlmacen();
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

        private void CargarDatosAlmacen()
        {
            try
            {
                PackageAlmacen.almacen datAlmacen = boAlmacen.obtenerPorId(idAlmacen);

                if (datAlmacen != null)
                {
                    lblNombreAlmacen.Text = datAlmacen.nombre ?? "Almacén no encontrado";
                }
                else
                {
                    lblNombreAlmacen.Text = "Almacén no encontrado";
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert",
                    $"alert('Error al cargar datos del almacén: {ex.Message}');", true);
                lblNombreAlmacen.Text = "Error al cargar";
            }
        }

        private void CargarDatosLote()
        {
            try
            {
                datLote = boLote.obtenerLotePorID(idLote);

                if (datLote != null)
                {
                    txtDescripcionLote.Text = datLote.descripcion ?? "";
                    ViewState["DatLote"] = datLote;
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert",
                        "alert('Lote no encontrado');", true);
                    Response.Redirect($"~/Almacen/MostrarAlmacen.aspx?id={idAlmacen}");
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert",
                    $"alert('Error al cargar datos del lote: {ex.Message}');", true);
            }
        }

        private void CargarPrendas()
        {
            try
            {
                if (idLote == 0)
                {
                    return;
                }

                prendaLote[] prendasLote = wsPrendaLote.listarPrendasPorLote(idLote);

                if (prendasLote != null && prendasLote.Length > 0)
                {
                    var prendasFormateadas = new List<dynamic>();

                    foreach (var pl in prendasLote)
                    {
                        polo prendaCompleta = BuscarPrendaPorId(pl.idPrenda);

                        if (prendaCompleta != null)
                        {
                            prendasFormateadas.Add(new
                            {
                                IdPrendaLote = pl.idPrendaLote,
                                IdPrenda = pl.idPrenda,
                                NombrePrenda = prendaCompleta.nombre,
                                Color = prendaCompleta.color,
                                Material = prendaCompleta.material.ToString(),
                                Talla = pl.talla.ToString() ?? "-",
                                Stock = pl.stock
                            });
                        }
                    }

                    gvPrendas.DataSource = prendasFormateadas;
                    gvPrendas.DataBind();
                }
                else
                {
                    gvPrendas.DataSource = null;
                    gvPrendas.DataBind();
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert",
                    $"alert('Error al cargar prendas: {ex.Message}');", true);
                gvPrendas.DataSource = null;
                gvPrendas.DataBind();
            }
        }

        private polo BuscarPrendaPorId(int idPrenda)
        {
            // 1. Intentar Polo
            try
            {
                PoloWSClient poloWS = new PoloWSClient();
                polo p = poloWS.obtenerPoloPorId(idPrenda);
                poloWS.Close();
                if (p != null) return p;
            }
            catch { }

            // 2. Intentar Blusa
            try
            {
                BlusaWSClient blusaWS = new BlusaWSClient();
                blusa b = blusaWS.obtenerBlusaPorId(idPrenda);
                blusaWS.Close();

                if (b != null)
                {
                    return new polo
                    {
                        idPrenda = b.idPrenda,
                        nombre = b.nombre,
                        color = b.color,
                        material = b.material,
                        precioUnidad = b.precioUnidad,
                        precioMayor = b.precioMayor,
                        precioDocena = b.precioDocena,
                        stockPrenda = b.stockPrenda,
                        alertaMinStock = b.alertaMinStock,
                        activo = b.activo
                    };
                }
            }
            catch { }

            // 3. Intentar Vestido
            try
            {
                VestidoWSClient vestidoWS = new VestidoWSClient();
                vestido v = vestidoWS.obtenerVestidoPorId(idPrenda);
                vestidoWS.Close();

                if (v != null)
                {
                    return new polo
                    {
                        idPrenda = v.idPrenda,
                        nombre = v.nombre,
                        color = v.color,
                        material = v.material,
                        precioUnidad = v.precioUnidad,
                        precioMayor = v.precioMayor,
                        precioDocena = v.precioDocena,
                        stockPrenda = v.stockPrenda,
                        alertaMinStock = v.alertaMinStock,
                        activo = v.activo
                    };
                }
            }
            catch { }

            // 4. Intentar Falda
            try
            {
                FaldaWSClient faldaWS = new FaldaWSClient();
                falda f = faldaWS.obtenerFaldaPorId(idPrenda);
                faldaWS.Close();

                if (f != null)
                {
                    return new polo
                    {
                        idPrenda = f.idPrenda,
                        nombre = f.nombre,
                        color = f.color,
                        material = f.material,
                        precioUnidad = f.precioUnidad,
                        precioMayor = f.precioMayor,
                        precioDocena = f.precioDocena,
                        stockPrenda = f.stockPrenda,
                        alertaMinStock = f.alertaMinStock,
                        activo = f.activo
                    };
                }
            }
            catch { }

            // 5. Intentar Pantalon
            try
            {
                PantalonWSClient pantalonWS = new PantalonWSClient();
                pantalon p = pantalonWS.obtenerPantalonPorId(idPrenda);
                pantalonWS.Close();

                if (p != null)
                {
                    return new polo
                    {
                        idPrenda = p.idPrenda,
                        nombre = p.nombre,
                        color = p.color,
                        material = p.material,
                        precioUnidad = p.precioUnidad,
                        precioMayor = p.precioMayor,
                        precioDocena = p.precioDocena,
                        stockPrenda = p.stockPrenda,
                        alertaMinStock = p.alertaMinStock,
                        activo = p.activo
                    };
                }
            }
            catch { }

            // 6. Intentar Casaca
            try
            {
                CasacaWSClient casacaWS = new CasacaWSClient();
                casaca c = casacaWS.obtenerCasacaPorId(idPrenda);
                casacaWS.Close();

                if (c != null)
                {
                    return new polo
                    {
                        idPrenda = c.idPrenda,
                        nombre = c.nombre,
                        color = c.color,
                        material = c.material,
                        precioUnidad = c.precioUnidad,
                        precioMayor = c.precioMayor,
                        precioDocena = c.precioDocena,
                        stockPrenda = c.stockPrenda,
                        alertaMinStock = c.alertaMinStock,
                        activo = c.activo
                    };
                }
            }
            catch { }

            // 7. Intentar Gorro
            try
            {
                GorroWSClient gorroWS = new GorroWSClient();
                gorro g = gorroWS.obtenerGorroPorId(idPrenda);
                gorroWS.Close();

                if (g != null)
                {
                    return new polo
                    {
                        idPrenda = g.idPrenda,
                        nombre = g.nombre,
                        color = g.color,
                        material = g.material,
                        precioUnidad = g.precioUnidad,
                        precioMayor = g.precioMayor,
                        precioDocena = g.precioDocena,
                        stockPrenda = g.stockPrenda,
                        alertaMinStock = g.alertaMinStock,
                        activo = g.activo
                    };
                }
            }
            catch { }

            return null;
        }

        protected string GenerarPaginacion(int currentPage, int totalPages)
        {
            StringBuilder sb = new StringBuilder();

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
            Response.Redirect($"~/Almacen/PrendaLote/RegistrarPrendaLote.aspx?idAlmacen={idAlmacen}&idLote={idLote}");
        }

        protected void btnFiltrarPrenda_Click(object sender, EventArgs e)
        {
            // Implementar filtro si es necesario
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int idPrendaLote = int.Parse(btn.CommandArgument);

            Response.Redirect($"~/Almacen/PrendaLote/ModificarPrendaLote.aspx?id={idPrendaLote}&idLote={idLote}&idAlmacen={idAlmacen}");
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton btn = (LinkButton)sender;
                int idPrendaLote = int.Parse(btn.CommandArgument);

                int resultado = wsPrendaLote.eliminarPrendaLote(idPrendaLote);

                if (resultado > 0)
                {
                    CargarPrendas();
                    ScriptManager.RegisterStartupScript(this, GetType(), "info",
                        "alert('Prenda removida del lote');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert",
                        "alert('Error al eliminar prenda');", true);
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert",
                    $"alert('Error: {ex.Message}');", true);
            }
        }

        protected void lkGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                string descripcion = txtDescripcionLote.Text.Trim();

                if (string.IsNullOrEmpty(descripcion))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert",
                        "alert('La descripción del lote es obligatoria');", true);
                    return;
                }

                datLote = (PackageAlmacen.lote)ViewState["DatLote"];

                if (datLote == null)
                {
                    datLote = new PackageAlmacen.lote();
                    datLote.datAlmacen = new PackageAlmacen.almacen();
                    datLote.datAlmacen.id = idAlmacen;
                }

                datLote.idLote = idLote;
                datLote.descripcion = descripcion;

                int resultado = boLote.modificarLote(datLote);

                if (resultado > 0)
                {
                    Response.Redirect($"~/Almacen/MostrarAlmacen.aspx?id={idAlmacen}&msg=loteModificado");
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert",
                        "alert('Error al modificar el lote. Intente nuevamente.');", true);
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
