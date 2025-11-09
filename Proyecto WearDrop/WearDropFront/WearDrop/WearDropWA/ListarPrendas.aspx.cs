using System;
using System.Data;

namespace WearDropWA
{
    public partial class ListarPrendas : System.Web.UI.Page
    {
        string Tipo => (Request["tipo"] ?? "Polos").Trim();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;

            // Título y header
            litTitulo.Text = "Gestionar " + Tipo;
            litHeader.Text = "Gestionar " + Tipo;

            // Tema visual por tipo
            themeWrap.Attributes["class"] = "theme-" + Tipo.ToLower();

            // (Opcional) datos dummy para ver formato
            gvPrendas.DataSource = DemoTable();
            gvPrendas.DataBind();
        }

        protected void lkRegistrar_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegistrarPrenda.aspx?tipo=" + Tipo);
        }

        protected void lkFiltrar_Click(object sender, EventArgs e)
        {
            // Aquí abrirías filtro o recargarías con parámetros
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            var id = ((System.Web.UI.WebControls.LinkButton)sender).CommandArgument;
            Response.Redirect($"RegistrarPrenda.aspx?tipo={Tipo}&id={id}");
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            var id = ((System.Web.UI.WebControls.LinkButton)sender).CommandArgument;
            // Lógica de eliminación (interfaz: nada más)
        }

        protected void btnVisualizar_Click(object sender, EventArgs e)
        {
            var id = ((System.Web.UI.WebControls.LinkButton)sender).CommandArgument;
            Response.Redirect($"VisualizarPrenda.aspx?tipo={Tipo}&id={id}");
        }

        private DataTable DemoTable()
        {
            var dt = new DataTable();
            dt.Columns.Add("IdPrenda");
            dt.Columns.Add("Nombre");
            dt.Columns.Add("Color");
            dt.Columns.Add("Material");
            dt.Columns.Add("PrecioUnitario", typeof(decimal));
            dt.Columns.Add("PrecioMediaDocena", typeof(decimal));
            dt.Columns.Add("PrecioDocena", typeof(decimal));

            dt.Rows.Add("1", $"{Tipo} A", "Negro", "Algodón", 39.90m, 34.50m, 29.90m);
            dt.Rows.Add("2", $"{Tipo} B", "Blanco", "Poliéster", 35.90m, 31.00m, 27.50m);
            dt.Rows.Add("3", $"{Tipo} C", "Azul", "Mezcla", 42.00m, 36.90m, 32.00m);
            return dt;
        }
    }
}