using System;
using System.Web.UI;

namespace WearDropWA
{
    public partial class RegistrarMovimiento : System.Web.UI.Page
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

        protected void lkRegistrar_Click(object sender, EventArgs e)
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

                    // Aquí se llamaria a la lógica de negocio para guardar el movimiento


                    // Por ahora, simulamos éxito
                    bool resultado = true;

                    if (resultado)
                    {
                        // Redirigir de vuelta a MostrarAlmacen con mensaje de éxito
                        Response.Redirect($"../MostrarAlmacen.aspx?id={idAlmacen}&msg=success");
                    }
                    else
                    {
                        // Mostrar mensaje de error
                        ClientScript.RegisterStartupScript(this.GetType(), "alert",
                            "alert('Error al registrar el movimiento');", true);
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
            Response.Redirect($"../MostrarAlmacen.aspx?id={idAlmacen}");
        }
    }
}