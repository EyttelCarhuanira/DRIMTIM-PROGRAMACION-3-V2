using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WearDropWA
{
    public partial class SeleccionarPrendaLiquidacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSeleccionarPrendas_Click(object sender, EventArgs e)
        {
            // Aquí puedes agregar la lógica para manejar la prenda seleccionada
            // Luego hacer algo con tipoPrenda, como guardarlo, pasar a otro proceso, etc.
            Response.Redirect("RegistrarLiquidacion.aspx");
        }
        protected void tipoPrenda_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Obtén el valor seleccionado en el DropDownList
            string seleccionada = tipoPrenda.SelectedValue;

            // Cambiar el texto dinámicamente en el span de la prenda
            prendaTitle.InnerText = tipoPrenda.SelectedItem.Text;

            // Limpiar las opciones previas del DropDownList
            opcionesPrenda.Items.Clear();

            // Mostrar el panel de opciones
            opcionesPrendaDiv.Visible = true;

            // Mostrar el fondo gris (overlay)
            overlay.Style["display"] = "block"; // Mostrar el fondo gris

            // Llenar las opciones dependiendo de la prenda seleccionada
            switch (seleccionada)
            {
                case "falda":
                    opcionesPrenda.Items.Add(new ListItem("Falda Roja XL", "Falda Roja XL"));
                    opcionesPrenda.Items.Add(new ListItem("Falda Azul M", "Falda Azul M"));
                    opcionesPrenda.Items.Add(new ListItem("Falda Blanca S", "Falda Blanca S"));
                    break;
                case "casaca":
                    opcionesPrenda.Items.Add(new ListItem("Casaca Negra L", "Casaca Negra L"));
                    opcionesPrenda.Items.Add(new ListItem("Casaca Azul M", "Casaca Azul M"));
                    opcionesPrenda.Items.Add(new ListItem("Casaca Gris S", "Casaca Gris S"));
                    break;
                case "polo":
                    opcionesPrenda.Items.Add(new ListItem("Polo Rojo L", "Polo Rojo L"));
                    opcionesPrenda.Items.Add(new ListItem("Polo Verde M", "Polo Verde M"));
                    break;
                // Otros casos según sea necesario
                default:
                    opcionesPrenda.Items.Add(new ListItem("No hay opciones disponibles", ""));
                    break;
            }
        }
    }
}