using System;
using System.Web.UI;

namespace WearDropWA
{
    public partial class ModificarMovimiento : System.Web.UI.Page
    {
        private int idAlmacen;
        private int idMovimiento;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["idAlmacen"] != null && Request.QueryString["id"] != null)
                {
                    idAlmacen = Convert.ToInt32(Request.QueryString["idAlmacen"]);
                    idMovimiento = Convert.ToInt32(Request.QueryString["id"]);

                    ViewState["IdAlmacen"] = idAlmacen;
                    ViewState["IdMovimiento"] = idMovimiento;

                    // Cargar los datos del movimiento existente
                    CargarDatosMovimiento();
                }
                else
                {
                    Response.Redirect("ListarAlmacenes.aspx");
                }
            }
            else
            {
                idAlmacen = (int)ViewState["IdAlmacen"];
                idMovimiento = (int)ViewState["IdMovimiento"];
            }
        }

        private void CargarDatosMovimiento()
        {
            // Aquí se llamaría a la lógica de negocio para obtener el movimiento
            // var movimiento = movimientoBO.ObtenerPorId(idMovimiento);

            // if (movimiento != null)
            // {
            //     txtLugarDestino.Text = movimiento.LugarDestino;
            //     txtLugarOrigen.Text = movimiento.LugarOrigen;
            //     txtFechaTraslado.Text = movimiento.FechaTraslado.ToString("yyyy-MM-dd");
            //     ddlTipo.SelectedValue = movimiento.Tipo;
            // }

            // Datos de prueba según el ID
            switch (idMovimiento)
            {
                case 1:
                    txtLugarDestino.Text = "Almacén Lima Sur";
                    txtLugarOrigen.Text = "Almacén Central";
                    txtFechaTraslado.Text = "2024-10-15";
                    ddlTipo.SelectedValue = "Salida";
                    break;
                case 2:
                    txtLugarDestino.Text = "Tienda Miraflores";
                    txtLugarOrigen.Text = "Almacén Central";
                    txtFechaTraslado.Text = "2024-10-18";
                    ddlTipo.SelectedValue = "Salida";
                    break;
                case 3:
                    txtLugarDestino.Text = "Almacén Central";
                    txtLugarOrigen.Text = "Proveedor ABC";
                    txtFechaTraslado.Text = "2024-10-20";
                    ddlTipo.SelectedValue = "Entrada";
                    break;
                case 4:
                    txtLugarDestino.Text = "Almacén Norte";
                    txtLugarOrigen.Text = "Almacén Central";
                    txtFechaTraslado.Text = "2024-10-22";
                    ddlTipo.SelectedValue = "Salida";
                    break;
                case 5:
                    txtLugarDestino.Text = "Tienda San Isidro";
                    txtLugarOrigen.Text = "Almacén Central";
                    txtFechaTraslado.Text = "2024-10-25";
                    ddlTipo.SelectedValue = "Salida";
                    break;
                default:
                    txtLugarDestino.Text = "Almacén Desconocido";
                    txtLugarOrigen.Text = "Almacén Desconocido";
                    txtFechaTraslado.Text = DateTime.Now.ToString("yyyy-MM-dd");
                    ddlTipo.SelectedValue = "Mov.Interno";
                    break;
            }
        }

        protected void lkModificar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    // Obtener los valores del formulario
                    string lugarDestino = txtLugarDestino.Text.Trim();
                    string lugarOrigen = txtLugarOrigen.Text.Trim();
                    DateTime fechaTraslado = Convert.ToDateTime(txtFechaTraslado.Text);
                    string tipo = ddlTipo.SelectedValue;

                    // Aquí se llamaría a la lógica de negocio para actualizar el movimiento
                    // var movimiento = new Movimiento
                    // {
                    //     IdMovimiento = idMovimiento,
                    //     LugarDestino = lugarDestino,
                    //     LugarOrigen = lugarOrigen,
                    //     FechaTraslado = fechaTraslado,
                    //     Tipo = tipo,
                    //     IdAlmacen = idAlmacen
                    // };
                    //
                    // bool resultado = movimientoBO.Actualizar(movimiento);

                    // Por ahora, simulamos éxito
                    bool resultado = true;

                    if (resultado)
                    {
                        // Redirigir de vuelta a MostrarAlmacen con mensaje de éxito
                        Response.Redirect($"../MostrarAlmacen.aspx?id={idAlmacen}&msg=updated&tab=Movimientos");
                    }
                    else
                    {
                        // Mostrar mensaje de error
                        ClientScript.RegisterStartupScript(this.GetType(), "alert",
                            "alert('Error al modificar el movimiento');", true);
                    }
                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert",
                        $"alert('Error: {ex.Message}');", true);
                }
            }
        }

        protected void lkCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect($"../MostrarAlmacen.aspx?id={idAlmacen}&tab=Movimientos");
        }
    }
}
