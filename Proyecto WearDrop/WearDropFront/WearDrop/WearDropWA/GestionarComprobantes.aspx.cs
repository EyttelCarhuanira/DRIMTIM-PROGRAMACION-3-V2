using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WearDropWA
{
    public partial class GestionarComprobantes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarComprobantes();
            }
        }

        //SOLO PARA PRUEBA Y FINES VISUALES
        private void CargarComprobantes()
        {
            // (Aquí es donde, en el futuro, llamarás a tu base de datos)
            // ComprobanteBO bo = new ComprobanteBO();
            // gvComprobantes.DataSource = bo.ListarTodos();


            // --- CÓDIGO TEMPORAL PARA MOSTRAR DATOS DE PRUEBA ---

            // 1. Creamos una lista genérica
            var listaDePrueba = new System.Collections.Generic.List<object>();

            // 2. Creamos un "objeto anónimo" con los datos de una fila
            listaDePrueba.Add(new
            {
                ID = 1,
                Fecha = DateTime.Now,
                Tipo = "Boleta",
                Correlativo = "B001-00456",
                Total = 150.00
            });

            // 3. (Opcional) Añadimos una segunda fila de prueba
            listaDePrueba.Add(new
            {
                ID = 2,
                Fecha = DateTime.Now.AddDays(-1),
                Tipo = "Factura",
                Correlativo = "F001-00123",
                Total = 320.50
            });

            // 4. Asignamos esta lista de prueba a nuestro GridView
            gvComprobantes.DataSource = listaDePrueba;
            gvComprobantes.DataBind(); // ¡Esta línea "dibuja" los datos!
        }


        // ¡ESTE ES EL MÉTODO QUE TE FALTA!
        // Se ejecuta cuando el usuario hace clic en un número de página (1, 2, 3...)
        protected void gvComprobantes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvComprobantes.PageIndex = e.NewPageIndex; // Actualiza el GridView a la nueva página
            CargarComprobantes(); // Vuelve a cargar los datos para esa página
        }

        // Este es el método del botón "Registrar"
        protected void btnIrARegistrar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/RegistrarComprobantes.aspx");
        }

        protected void gvComprobantes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            // 1. Obtenemos el ID de la fila en la que se hizo clic
            // Convertimos el CommandArgument (que es un string) a un entero
            int comprobanteID = Convert.ToInt32(e.CommandArgument);

            // 2. Vemos qué botón se presionó
            if (e.CommandName == "Editar")
            {
                // --- LÓGICA PARA EDITAR ---
                // Redirigimos a la página de registro, pero pasándole el ID
                // por la URL (QueryString)
                Response.Redirect("~/ModificarComprobantes.aspx?id=" + comprobanteID);
            }
            else if (e.CommandName == "Eliminar")
            {
                // --- LÓGICA PARA ELIMINAR ---
                // Aquí deberías llamar a tu capa de negocio para borrar

                // ComprobanteBO boComprobante = new ComprobanteBO();
                // boComprobante.Eliminar(comprobanteID);

                // Y después, refrescamos la tabla
                CargarComprobantes();
            }
        }
    }
}