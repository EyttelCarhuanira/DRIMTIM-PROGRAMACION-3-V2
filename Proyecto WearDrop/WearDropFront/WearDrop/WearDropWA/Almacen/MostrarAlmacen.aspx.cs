using System;
using System.Collections.Generic;
using System.ComponentModel.Design;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WearDropWA
{
    public partial class MostrarAlmacen : System.Web.UI.Page
    {
        private int idAlmacen;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    idAlmacen = Convert.ToInt32(Request.QueryString["id"]);
                    ViewState["IdAlmacen"] = idAlmacen;
                    ViewState["TabActiva"] = "Lotes";
                    CargarDatosAlmacen();
                    CargarLotes();
                }
                else
                {
                    Response.Redirect("ListarAlmacenes.aspx");
                }
            }
            else
            {
                idAlmacen = (int)ViewState["IdAlmacen"];
            }
        }

        private void CargarDatosAlmacen()
        {
            // Aquí implementar la lógica para cargar datos desde la base de datos
            // Ejemplo con datos de prueba:
            if (idAlmacen == 1)
            {
                txtId.Text = "1";
                txtNombre.Text = "Almacén Central";
                txtUbicacion.Text = "Lima Centro";
            }
            else if (idAlmacen == 2)
            {
                txtId.Text = "2";
                txtNombre.Text = "Almacén Norte";
                txtUbicacion.Text = "San Martín de Porres";
            }
            else if (idAlmacen == 3)
            {
                txtId.Text = "3";
                txtNombre.Text = "Almacén Sur";
                txtUbicacion.Text = "Villa El Salvador";
            }
        }

        #region Manejo de Pestañas

        protected void tabLotes_Click(object sender, EventArgs e)
        {
            MostrarPanel(panelLotes);
            ActualizarEstiloTab(tabLotes);
            ViewState["TabActiva"] = "Lotes";
            CargarLotes();
        }

        protected void tabMovimientos_Click(object sender, EventArgs e)
        {
            MostrarPanel(panelMovimientos);
            ActualizarEstiloTab(tabMovimientos);
            ViewState["TabActiva"] = "Movimientos";
            CargarMovimientos();
        }

        protected void tabMovimientosXLotes_Click(object sender, EventArgs e)
        {
            MostrarPanel(panelMovimientosXLotes);
            ActualizarEstiloTab(tabMovimientosXLotes);
            ViewState["TabActiva"] = "MovimientosXLote";
            CargarMovimientosXLotes();
        }

        private void MostrarPanel(Panel panelActivo)
        {
            panelLotes.Visible = false;
            panelMovimientos.Visible = false;
            panelMovimientosXLotes.Visible = false;
            panelActivo.Visible = true;
        }

        private void ActualizarEstiloTab(LinkButton tabActivo)
        {
            tabLotes.CssClass = "nav-link";
            tabMovimientos.CssClass = "nav-link";
            tabMovimientosXLotes.CssClass = "nav-link";
            tabActivo.CssClass = "nav-link active";
        }

        #endregion

        #region Carga de Datos

        private void CargarLotes()
        {
            // Aquí implementar la lógica para cargar lotes desde la base de datos
            // Ejemplo con datos de prueba:
            var lotesTest = new List<dynamic>
            {
                new { IdLote = 1, Descripcion = "Lote Camisetas Verano 2024" },
                new { IdLote = 2, Descripcion = "Lote Pantalones Mezclilla" },
                new { IdLote = 3, Descripcion = "Lote Zapatillas Deportivas" },
                new { IdLote = 4, Descripcion = "Lote Accesorios Invierno" },
                new { IdLote = 5, Descripcion = "Lote Chaquetas Premium" }
            };

            gvLotes.DataSource = lotesTest;
            gvLotes.DataBind();
        }

        private void CargarMovimientos()
        {
            // Aquí implementar la lógica para cargar movimientos desde la base de datos
            // Ejemplo con datos de prueba:
            var movimientosTest = new List<dynamic>
            {
                new { IdMovimiento = 1, Destino = "Almacén Lima Sur", Origen = "Almacén Central", Tipo = "Salida", Fecha = new DateTime(2024, 10, 15) },
                new { IdMovimiento = 2, Destino = "Tienda Miraflores", Origen = "Almacén Central", Tipo = "Salida", Fecha = new DateTime(2024, 10, 18) },
                new { IdMovimiento = 3, Destino = "Almacén Central", Origen = "Proveedor ABC", Tipo = "Entrada", Fecha = new DateTime(2024, 10, 20) },
                new { IdMovimiento = 4, Destino = "Almacén Norte", Origen = "Almacén Central", Tipo = "Salida", Fecha = new DateTime(2024, 10, 22) },
                new { IdMovimiento = 5, Destino = "Tienda San Isidro", Origen = "Almacén Central", Tipo = "Salida", Fecha = new DateTime(2024, 10, 25) }
            };

            gvMovimientos.DataSource = movimientosTest;
            gvMovimientos.DataBind();
        }

        private void CargarMovimientosXLotes()
        {
            // Aquí implementar la lógica para cargar movimientos por lotes desde la base de datos
            // Ejemplo con datos de prueba:
            var movimientosXLotesTest = new List<dynamic>
            {
                new { IdMovimiento = 1, TipoMovimiento = "Salida", LugarDestino = "Almacén Lima Sur", LugarOrigen = "Almacén Central", IdLote = 1, DescripcionLote = "Lote Camisetas Verano 2024" },
                new { IdMovimiento = 1, TipoMovimiento = "Salida", LugarDestino = "Almacén Lima Sur", LugarOrigen = "Almacén Central", IdLote = 3, DescripcionLote = "Lote Zapatillas Deportivas" },
                new { IdMovimiento = 2, TipoMovimiento = "Salida", LugarDestino = "Tienda Miraflores", LugarOrigen = "Almacén Central", IdLote = 2, DescripcionLote = "Lote Pantalones Mezclilla" },
                new { IdMovimiento = 3, TipoMovimiento = "Entrada", LugarDestino = "Almacén Central", LugarOrigen = "Proveedor ABC", IdLote = 5, DescripcionLote = "Lote Chaquetas Premium" },
                new { IdMovimiento = 4, TipoMovimiento = "Salida", LugarDestino = "Almacén Norte", LugarOrigen = "Almacén Central", IdLote = 4, DescripcionLote = "Lote Accesorios Invierno" },
                new { IdMovimiento = 5, TipoMovimiento = "Salida", LugarDestino = "Tienda San Isidro", LugarOrigen = "Almacén Central", IdLote = 1, DescripcionLote = "Lote Camisetas Verano 2024" }
            };

            gvMovimientosXLotes.DataSource = movimientosXLotesTest;
            gvMovimientosXLotes.DataBind();
        }

        #endregion

        #region Paginación

        protected void gvLotes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvLotes.PageIndex = e.NewPageIndex;
            CargarLotes();
        }

        protected void gvMovimientos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvMovimientos.PageIndex = e.NewPageIndex;
            CargarMovimientos();
        }

        protected void gvMovimientosXLotes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvMovimientosXLotes.PageIndex = e.NewPageIndex;
            CargarMovimientosXLotes();
        }

        #endregion

        #region Acciones de Lotes

        protected void btnModificarLote_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int idLote = int.Parse(btn.CommandArgument);
            Response.Redirect($"Lote/ModificarLote.aspx?id={idLote}&idAlmacen={idAlmacen}");
        }

        #endregion

        #region Acciones de Movimientos

        protected void btnModificarMovimiento_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int idMovimiento = int.Parse(btn.CommandArgument);
            Response.Redirect($"Movimiento/ModificarMovimiento.aspx?id={idMovimiento}&idAlmacen={idAlmacen}");
        }

        #endregion

        #region Acciones de Movimientos x Lotes

        protected void btnModificarMovimientoXLote_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int idMovimiento = int.Parse(btn.CommandArgument);
            Response.Redirect($"MovimientoXLote/ModificarMovimientoXLote.aspx?id={idMovimiento}&idAlmacen={idAlmacen}");
        }

        #endregion

        #region Eliminación con Modal

        protected void btnConfirmarEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                int idEliminar = int.Parse(hfIdEliminar.Value);
                string tipoEliminar = hfTipoEliminar.Value;

                switch (tipoEliminar)
                {
                    case "Lote":
                        // Aquí implementar la lógica de eliminación de 

                        ScriptManager.RegisterStartupScript(this, GetType(), "alert",
                            $"alert('Lote con ID {idEliminar} eliminado correctamente'); cerrarModal();", true);
                        CargarLotes();
                        break;

                    case "Movimiento":
                        // Aquí implementar la lógica de eliminación de 

                        ScriptManager.RegisterStartupScript(this, GetType(), "alert",
                            $"alert('Movimiento con ID {idEliminar} eliminado correctamente'); cerrarModal();", true);
                        CargarMovimientos();
                        break;

                    case "MovimientoXLote":
                        // Aquí implementar la lógica de eliminación de 

                        ScriptManager.RegisterStartupScript(this, GetType(), "alert",
                            $"alert('Movimiento por Lote con ID {idEliminar} eliminado correctamente'); cerrarModal();", true);
                        CargarMovimientosXLotes();
                        break;

                    default:
                        ScriptManager.RegisterStartupScript(this, GetType(), "alert",
                            "alert('Tipo de eliminación no reconocido'); cerrarModal();", true);
                        break;
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert",
                    $"alert('Error al eliminar: {ex.Message}'); cerrarModal();", true);
            }
        }

        #endregion

        #region Botones de Navegación

        protected void lkRegistrar_Click(object sender, EventArgs e)
        {
            string tabActiva = ViewState["TabActiva"]?.ToString() ?? "Lotes";

            switch (tabActiva)
            {
                case "Lotes":
                    Response.Redirect($"Lote/RegistrarLote.aspx?idAlmacen={idAlmacen}");
                    break;
                case "Movimientos":
                    Response.Redirect($"Movimiento/RegistrarMovimiento.aspx?idAlmacen={idAlmacen}");
                    break;
                case "MovimientosXLote":
                    Response.Redirect($"MovimientoXLote/RegistrarMovimientoXLote.aspx?idAlmacen={idAlmacen}");
                    break;
            }
        }

        protected void lkFiltrar_Click(object sender, EventArgs e)
        {
            // Implementar lógica de filtrado según la pestaña activa
            string tabActiva = ViewState["TabActiva"]?.ToString() ?? "Lotes";

            switch (tabActiva)
            {
                case "Lotes":
                    // Lógica de filtrado para lotes
                    break;
                case "Movimientos":
                    // Lógica de filtrado para movimientos
                    break;
                case "MovimientosXLote":
                    // Lógica de filtrado para movimientos x lote
                    break;
            }
        }

        protected void lkRetroceder_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListarAlmacenes.aspx");
        }

        #endregion
    }
}
