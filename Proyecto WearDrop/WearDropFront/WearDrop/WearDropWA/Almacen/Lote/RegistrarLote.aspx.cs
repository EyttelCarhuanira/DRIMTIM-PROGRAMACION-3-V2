using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WearDropWA
{
    public partial class RegistrarLote : System.Web.UI.Page
    {
        private int idAlmacen;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["idAlmacen"] != null)
                {
                    idAlmacen = Convert.ToInt32(Request.QueryString["idAlmacen"]);
                    ViewState["IdAlmacen"] = idAlmacen;

                    CargarDatosContexto();
                    CargarMovimientos();

                    if (Request.QueryString["idMovimiento"] != null)
                    {
                        int idMovimiento = Convert.ToInt32(Request.QueryString["idMovimiento"]);
                        ddlIdMovimiento.SelectedValue = idMovimiento.ToString();
                        ActualizarDatosMovimiento(idMovimiento);
                    }

                    CargarPrendas();
                }
                else
                {
                    Response.Redirect("~/ListarAlmacenes.aspx");
                }
            }
            else
            {
                idAlmacen = (int)ViewState["IdAlmacen"];
            }
        }

        private void CargarDatosContexto()
        {
            // Datos de prueba - aquí llamarías a tu lógica de negocio
            lblNombreAlmacen.Text = "Almacén Central";
        }

        private void CargarMovimientos()
        {

            var movimientosTest = new List<dynamic>
            {
                new { IdMovimiento = 1, Descripcion = "Mov 1 - Salida a Lima Sur" },
                new { IdMovimiento = 2, Descripcion = "Mov 2 - Salida a Miraflores" },
                new { IdMovimiento = 3, Descripcion = "Mov 3 - Entrada Proveedor ABC" },
                new { IdMovimiento = 4, Descripcion = "Mov 4 - Salida a Almacén Norte" },
                new { IdMovimiento = 5, Descripcion = "Mov 5 - Salida a San Isidro" }
            };

            ddlIdMovimiento.DataSource = movimientosTest;
            ddlIdMovimiento.DataTextField = "Descripcion";
            ddlIdMovimiento.DataValueField = "IdMovimiento";
            ddlIdMovimiento.DataBind();

            // Agregar opción por defecto
            ddlIdMovimiento.Items.Insert(0, new ListItem("--Seleccione un movimiento--", "0"));
        }

        protected void ddlIdMovimiento_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idMovimiento = Convert.ToInt32(ddlIdMovimiento.SelectedValue);

            if (idMovimiento > 0)
            {
                ActualizarDatosMovimiento(idMovimiento);
            }
            else
            {
                lblLugarOrigen.Text = "";
                lblLugarDestino.Text = "";
            }
        }

        private void ActualizarDatosMovimiento(int idMovimiento)
        {

            switch (idMovimiento)
            {
                case 1:
                    lblLugarOrigen.Text = "Almacén Central";
                    lblLugarDestino.Text = "Almacén Lima Sur";
                    break;
                case 2:
                    lblLugarOrigen.Text = "Almacén Central";
                    lblLugarDestino.Text = "Tienda Miraflores";
                    break;
                case 3:
                    lblLugarOrigen.Text = "Proveedor ABC";
                    lblLugarDestino.Text = "Almacén Central";
                    break;
                case 4:
                    lblLugarOrigen.Text = "Almacén Central";
                    lblLugarDestino.Text = "Almacén Norte";
                    break;
                case 5:
                    lblLugarOrigen.Text = "Almacén Central";
                    lblLugarDestino.Text = "Tienda San Isidro";
                    break;
                default:
                    lblLugarOrigen.Text = "";
                    lblLugarDestino.Text = "";
                    break;
            }
        }

        private void CargarPrendas()
        {
            // Datos de prueba
            var prendasTest = new List<dynamic>
            {
                new { IdPrenda = 1, NombrePrenda = "Camiseta Básica", Color = "Blanco", Material = "Algodón", Stock = 50, Talla = "M" },
                new { IdPrenda = 2, NombrePrenda = "Pantalón Jean", Color = "Azul", Material = "Mezclilla", Stock = 30, Talla = "32" },
                new { IdPrenda = 3, NombrePrenda = "Zapatilla Deportiva", Color = "Negro", Material = "Sintético", Stock = 25, Talla = "42" },
                new { IdPrenda = 4, NombrePrenda = "Chaqueta", Color = "Gris", Material = "Poliéster", Stock = 15, Talla = "L" },
                new { IdPrenda = 5, NombrePrenda = "Gorra", Color = "Rojo", Material = "Algodón", Stock = 40, Talla = "Única" },
                new { IdPrenda = 6, NombrePrenda = "Bufanda", Color = "Beige", Material = "Lana", Stock = 20, Talla = "Única" }
            };

            gvPrendas.DataSource = prendasTest;
            gvPrendas.DataBind();
        }

        protected void gvPrendas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvPrendas.PageIndex = e.NewPageIndex;
            CargarPrendas();
        }


        protected void btnAniadirPrenda_Click(object sender, EventArgs e)
        {
            // Implementar lógica de filtro por último precio
        }

        protected void btnFiltroPrenda_Click(object sender, EventArgs e)
        {
            // Implementar lógica de filtro por tipo de prenda
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int idPrenda = int.Parse(btn.CommandArgument);

            // Lógica para agregar prenda al lote
        }

        protected void btnQuitar_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int idPrenda = int.Parse(btn.CommandArgument);

            // Lógica para quitar prenda del lote
        }

        protected void lkRegistrar_Click(object sender, EventArgs e)
        {
            try
            {
                int idMovimiento = Convert.ToInt32(ddlIdMovimiento.SelectedValue);

                if (idMovimiento == 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert",
                        "alert('Debe seleccionar un movimiento como Minimo para poder registrarlo');", true);
                    //Si esto significa que tambíén se actualiza... MovimientoXLote
                    return;
                }

                // Aquí llamarías a tu lógica de negocio para registrar el lote
                bool resultado = true;

                if (resultado)
                {
                    Response.Redirect($"../MostrarAlmacen.aspx?id={idAlmacen}&msg=success");
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert",
                        "alert('Error al registrar el lote');", true);
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
            Response.Redirect($"../MostrarAlmacen.aspx?id={idAlmacen}");
        }
    }
}