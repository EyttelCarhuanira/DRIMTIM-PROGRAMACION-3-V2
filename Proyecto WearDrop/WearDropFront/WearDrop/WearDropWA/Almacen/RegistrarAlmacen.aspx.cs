using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WearDropWA
{
    public partial class RegistrarAlmacen : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListarAlmacenes.aspx");
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            // Lógica para registrar el almacén
            //string nombreAlmacen = txtNombreAlmacen.Text;
            //string direccionAlmacen = txtDireccionAlmacen.Text;
            // Aquí se podría agregar la lógica para guardar el almacén en la base de datos
            // Redirigir a la página de listar almacenes después de registrar
            Response.Redirect("ListarAlmacenes.aspx");
        }
        
    }
}