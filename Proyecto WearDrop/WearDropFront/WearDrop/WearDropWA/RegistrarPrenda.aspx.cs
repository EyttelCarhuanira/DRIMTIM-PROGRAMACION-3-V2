using System;
using System.Web.UI.WebControls;

namespace WearDropWA
{
    public partial class RegistrarPrenda : System.Web.UI.Page
    {
        // Propiedades para obtener parámetros de URL
        private string Tipo => (Request["tipo"] ?? "Polos").Trim();
        private string Id => (Request["id"] ?? "").Trim();
        private bool EsModificacion => !string.IsNullOrEmpty(Id);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ConfigurarPagina();
                CargarDatosIniciales();

                if (EsModificacion)
                {
                    CargarDatosPrenda();
                }
            }
        }

        private void ConfigurarPagina()
        {
            // Configurar títulos
            string accion = EsModificacion ? "Modificar" : "Registrar";
            litTitulo.Text = $"{accion} {ObtenerNombreSingular()}";
            litHeader.Text = $"{accion} {ObtenerNombreSingular()}";

            // Configurar tema visual
            themeWrap.Attributes["class"] = "container theme-" + Tipo.ToLower();

            // Configurar botón
            btnGuardar.Text = EsModificacion ? "Guardar" : "Registrar";

            // Mostrar ID solo en modificación
            divId.Visible = EsModificacion;
            if (EsModificacion)
            {
                txtId.Text = Id;
            }

            // Ocultar asteriscos de requerido en modo modificación
            OcultarAsteriscos(EsModificacion);

            // Mostrar panel específico según tipo de prenda
            MostrarPanelEspecifico();
        }

        private void OcultarAsteriscos(bool ocultar)
        {
            spanReq.Visible = !ocultar;
            spanReqTalla.Visible = !ocultar;
            spanReqMaterial.Visible = !ocultar;
            spanReqColor.Visible = !ocultar;
            spanReqStock.Visible = !ocultar;
            spanReqPU.Visible = !ocultar;
            spanReqPM.Visible = !ocultar;
            spanReqPD.Visible = !ocultar;

            // Asteriscos específicos por panel
            spanReqManga.Visible = !ocultar;
            spanReqCuello.Visible = !ocultar;
            spanReqTipoBlusa.Visible = !ocultar;
            spanReqMangaB.Visible = !ocultar;
            spanReqTipoVestido.Visible = !ocultar;
            spanReqLargoVestido.Visible = !ocultar;
            spanReqTipoFalda.Visible = !ocultar;
            spanReqLargoFalda.Visible = !ocultar;
            spanReqVolantes.Visible = !ocultar;
            spanReqTipoPantalon.Visible = !ocultar;
            spanReqLargoPierna.Visible = !ocultar;
            spanReqTipoCasaca.Visible = !ocultar;
            spanReqCapucha.Visible = !ocultar;
            spanReqTipoGorra.Visible = !ocultar;
            spanReqTallaAjustable.Visible = !ocultar;
            spanReqImpermeable.Visible = !ocultar;
        }

        private void MostrarPanelEspecifico()
        {
            // Ocultar todos los paneles primero
            pnlPOLO.Visible = false;
            pnlBLUSA.Visible = false;
            pnlVESTIDO.Visible = false;
            pnlFALDA.Visible = false;
            pnlPANTALON.Visible = false;
            pnlCASACA.Visible = false;
            pnlGORRO.Visible = false;

            // Mostrar panel correspondiente
            switch (Tipo.ToLower())
            {
                case "polo":
                case "polos":
                    pnlPOLO.Visible = true;
                    break;
                case "blusa":
                case "blusas":
                    pnlBLUSA.Visible = true;
                    break;
                case "vestido":
                case "vestidos":
                    pnlVESTIDO.Visible = true;
                    break;
                case "falda":
                case "faldas":
                    pnlFALDA.Visible = true;
                    break;
                case "pantalon":
                case "pantalones":
                    pnlPANTALON.Visible = true;
                    break;
                case "casaca":
                case "casacas":
                    pnlCASACA.Visible = true;
                    break;
                case "gorro":
                case "gorros":
                    pnlGORRO.Visible = true;
                    break;
            }
        }

        private void CargarDatosIniciales()
        {
            // Cargar Tallas
            ddlTalla.Items.Clear();
            ddlTalla.Items.Add(new ListItem("-- Seleccione --", ""));
            ddlTalla.Items.Add(new ListItem("XS", "1"));
            ddlTalla.Items.Add(new ListItem("S", "2"));
            ddlTalla.Items.Add(new ListItem("M", "3"));
            ddlTalla.Items.Add(new ListItem("L", "4"));
            ddlTalla.Items.Add(new ListItem("XL", "5"));
            ddlTalla.Items.Add(new ListItem("XXL", "6"));

            // Cargar Materiales
            ddlMaterial.Items.Clear();
            ddlMaterial.Items.Add(new ListItem("-- Seleccione --", ""));
            ddlMaterial.Items.Add(new ListItem("Algodón", "1"));
            ddlMaterial.Items.Add(new ListItem("Poliéster", "2"));
            ddlMaterial.Items.Add(new ListItem("Mezcla", "3"));
            ddlMaterial.Items.Add(new ListItem("Lana", "4"));
            ddlMaterial.Items.Add(new ListItem("Licra", "5"));
            ddlMaterial.Items.Add(new ListItem("Seda", "6"));
            ddlMaterial.Items.Add(new ListItem("Denim", "7"));

            // Cargar datos específicos según tipo
            switch (Tipo.ToLower())
            {
                case "polo":
                case "polos":
                    CargarDatosPolos();
                    break;
                case "blusa":
                case "blusas":
                    CargarDatosBlusas();
                    break;
                case "vestido":
                case "vestidos":
                    CargarDatosVestidos();
                    break;
                case "falda":
                case "faldas":
                    CargarDatosFaldas();
                    break;
                case "pantalon":
                case "pantalones":
                    CargarDatosPantalones();
                    break;
                case "casaca":
                case "casacas":
                    CargarDatosCasacas();
                    break;
                case "gorro":
                case "gorros":
                    CargarDatosGorros();
                    break;
            }
        }

        private void CargarDatosPolos()
        {
            // Tipo de Manga
            ddlTipoManga.Items.Clear();
            ddlTipoManga.Items.Add(new ListItem("-- Seleccione --", ""));
            ddlTipoManga.Items.Add(new ListItem("Corta", "1"));
            ddlTipoManga.Items.Add(new ListItem("Larga", "2"));
            ddlTipoManga.Items.Add(new ListItem("3/4", "3"));
            ddlTipoManga.Items.Add(new ListItem("Sin Manga", "4"));

            // Tipo de Cuello
            ddlTipoCuello.Items.Clear();
            ddlTipoCuello.Items.Add(new ListItem("-- Seleccione --", ""));
            ddlTipoCuello.Items.Add(new ListItem("Redondo", "1"));
            ddlTipoCuello.Items.Add(new ListItem("V", "2"));
            ddlTipoCuello.Items.Add(new ListItem("Polo", "3"));
            ddlTipoCuello.Items.Add(new ListItem("Alto", "4"));
        }

        private void CargarDatosBlusas()
        {
            // Tipo de Blusa
            ddlTipoBlusa.Items.Clear();
            ddlTipoBlusa.Items.Add(new ListItem("-- Seleccione --", ""));
            ddlTipoBlusa.Items.Add(new ListItem("Casual", "1"));
            ddlTipoBlusa.Items.Add(new ListItem("Formal", "2"));
            ddlTipoBlusa.Items.Add(new ListItem("Crop Top", "3"));
            ddlTipoBlusa.Items.Add(new ListItem("Oversize", "4"));

            // Tipo de Manga
            ddlTipoMangaB.Items.Clear();
            ddlTipoMangaB.Items.Add(new ListItem("-- Seleccione --", ""));
            ddlTipoMangaB.Items.Add(new ListItem("Sin Manga", "1"));
            ddlTipoMangaB.Items.Add(new ListItem("Corta", "2"));
            ddlTipoMangaB.Items.Add(new ListItem("Larga", "3"));
            ddlTipoMangaB.Items.Add(new ListItem("3/4", "4"));
        }

        private void CargarDatosVestidos()
        {
            // Tipo de Vestido
            ddlTipoVestido.Items.Clear();
            ddlTipoVestido.Items.Add(new ListItem("-- Seleccione --", ""));
            ddlTipoVestido.Items.Add(new ListItem("Casual", "1"));
            ddlTipoVestido.Items.Add(new ListItem("Formal", "2"));
            ddlTipoVestido.Items.Add(new ListItem("Cocktail", "3"));
            ddlTipoVestido.Items.Add(new ListItem("Deportivo", "4"));
            ddlTipoVestido.Items.Add(new ListItem("Noche", "5"));
        }

        private void CargarDatosFaldas()
        {
            // Tipo de Falda
            ddlTipoFalda.Items.Clear();
            ddlTipoFalda.Items.Add(new ListItem("-- Seleccione --", ""));
            ddlTipoFalda.Items.Add(new ListItem("Recta", "1"));
            ddlTipoFalda.Items.Add(new ListItem("Acampanada", "2"));
            ddlTipoFalda.Items.Add(new ListItem("Plisada", "3"));
            ddlTipoFalda.Items.Add(new ListItem("Tubo", "4"));
            ddlTipoFalda.Items.Add(new ListItem("Asimétrica", "5"));
        }

        private void CargarDatosPantalones()
        {
            // Tipo de Pantalón
            ddlTipoPantalon.Items.Clear();
            ddlTipoPantalon.Items.Add(new ListItem("-- Seleccione --", ""));
            ddlTipoPantalon.Items.Add(new ListItem("Jean", "1"));
            ddlTipoPantalon.Items.Add(new ListItem("Casual", "2"));
            ddlTipoPantalon.Items.Add(new ListItem("Formal", "3"));
            ddlTipoPantalon.Items.Add(new ListItem("Deportivo", "4"));
            ddlTipoPantalon.Items.Add(new ListItem("Cargo", "5"));
        }

        private void CargarDatosCasacas()
        {
            // Tipo de Casaca
            ddlTipoCasaca.Items.Clear();
            ddlTipoCasaca.Items.Add(new ListItem("-- Seleccione --", ""));
            ddlTipoCasaca.Items.Add(new ListItem("Bomber", "1"));
            ddlTipoCasaca.Items.Add(new ListItem("Cortaviento", "2"));
            ddlTipoCasaca.Items.Add(new ListItem("Parka", "3"));
            ddlTipoCasaca.Items.Add(new ListItem("Blazer", "4"));
            ddlTipoCasaca.Items.Add(new ListItem("Jean", "5"));
        }

        private void CargarDatosGorros()
        {
            // Tipo de Gorro
            ddlTipoGorra.Items.Clear();
            ddlTipoGorra.Items.Add(new ListItem("-- Seleccione --", ""));
            ddlTipoGorra.Items.Add(new ListItem("Beanie", "1"));
            ddlTipoGorra.Items.Add(new ListItem("Snapback", "2"));
            ddlTipoGorra.Items.Add(new ListItem("Dad Hat", "3"));
            ddlTipoGorra.Items.Add(new ListItem("Bucket", "4"));
            ddlTipoGorra.Items.Add(new ListItem("Trucker", "5"));
        }

        private void CargarDatosPrenda()
        {
            // Aquí cargarías los datos desde tu BO según el tipo de prenda
            // Ejemplo genérico:

            /*
            switch (Tipo.ToLower())
            {
                case "polos":
                    var polo = PoloBO.ObtenerPorId(int.Parse(Id));
                    txtNombre.Text = polo.Nombre;
                    ddlTalla.SelectedValue = polo.IdTalla.ToString();
                    ddlMaterial.SelectedValue = polo.IdMaterial.ToString();
                    txtColor.Text = polo.Color;
                    txtStock.Text = polo.Stock.ToString();
                    txtPU.Text = polo.PrecioUnitario.ToString("F2");
                    txtPM.Text = polo.PrecioMayor.ToString("F2");
                    txtPD.Text = polo.PrecioDocena.ToString("F2");
                    ddlTipoManga.SelectedValue = polo.IdTipoManga.ToString();
                    txtEstampado.Text = polo.Estampado;
                    ddlTipoCuello.SelectedValue = polo.IdTipoCuello.ToString();
                    break;
                    
                case "blusas":
                    var blusa = BlusaBO.ObtenerPorId(int.Parse(Id));
                    // Cargar campos comunes y específicos de blusa
                    break;
                    
                // ... etc para cada tipo de prenda
            }
            */
        }

        private string ObtenerNombreSingular()
        {
            switch (Tipo.ToLower())
            {
                case "polo":
                case "polos": return "Polo";
                case "blusa":
                case "blusas": return "Blusa";
                case "vestido":
                case "vestidos": return "Vestido";
                case "falda":
                case "faldas": return "Falda";
                case "pantalon":
                case "pantalones": return "Pantalón";
                case "casaca":
                case "casacas": return "Casaca";
                case "gorro":
                case "gorros": return "Gorro";
                default: return Tipo;
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect($"ListarPrendas.aspx?tipo={Tipo}");
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                // Validaciones básicas
                if (!ValidarCampos())
                {
                    return;
                }

                // Aquí implementarías la lógica de guardar según el tipo
                if (EsModificacion)
                {
                    ModificarPrendaBO();
                }
                else
                {
                    RegistrarPrendaBO();
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert",
                    $"alert('Error: {ex.Message}');", true);
            }
        }

        private bool ValidarCampos()
        {
            // Validaciones comunes
            if (string.IsNullOrWhiteSpace(txtNombre.Text))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert",
                    "alert('Debe ingresar un nombre.');", true);
                return false;
            }

            if (ddlTalla.SelectedValue == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert",
                    "alert('Debe seleccionar una talla.');", true);
                return false;
            }

            if (ddlMaterial.SelectedValue == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert",
                    "alert('Debe seleccionar un material.');", true);
                return false;
            }

            // Validar campos numéricos
            decimal temp;
            if (!decimal.TryParse(txtPU.Text, out temp) || temp <= 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert",
                    "alert('El precio unitario debe ser un valor numérico válido mayor a 0.');", true);
                return false;
            }

            // Agregar más validaciones según sea necesario

            return true;
        }

        private void RegistrarPrendaBO()
        {
            // Llamar al BO correspondiente según el tipo
            switch (Tipo.ToLower())
            {
                case "polo":
                case "polos":
                    // PoloBO.Registrar(ObtenerDatosPolo());
                    break;
                case "blusa":
                case "blusas":
                    // BlusaBO.Registrar(ObtenerDatosBlusa());
                    break;
                case "vestido":
                case "vestidos":
                    // VestidoBO.Registrar(ObtenerDatosVestido());
                    break;
                case "falda":
                case "faldas":
                    // FaldaBO.Registrar(ObtenerDatosFalda());
                    break;
                case "pantalon":
                case "pantalones":
                    // PantalonBO.Registrar(ObtenerDatosPantalon());
                    break;
                case "casaca":
                case "casacas":
                    // CasacaBO.Registrar(ObtenerDatosCasaca());
                    break;
                case "gorro":
                case "gorros":
                    // GorroBO.Registrar(ObtenerDatosGorro());
                    break;
            }

            ClientScript.RegisterStartupScript(this.GetType(), "alert",
                $"alert('Registro creado correctamente.'); window.location='ListarPrendas.aspx?tipo={Tipo}';", true);
        }

        private void ModificarPrendaBO()
        {
            // Llamar al BO correspondiente según el tipo
            switch (Tipo.ToLower())
            {
                case "polos":
                    // PoloBO.Modificar(int.Parse(Id), ObtenerDatosPolo());
                    break;
                case "blusas":
                    // BlusaBO.Modificar(int.Parse(Id), ObtenerDatosBlusa());
                    break;
                case "vestidos":
                    // VestidoBO.Modificar(int.Parse(Id), ObtenerDatosVestido());
                    break;
                case "faldas":
                    // FaldaBO.Modificar(int.Parse(Id), ObtenerDatosFalda());
                    break;
                case "pantalones":
                    // PantalonBO.Modificar(int.Parse(Id), ObtenerDatosPantalon());
                    break;
                case "casacas":
                    // CasacaBO.Modificar(int.Parse(Id), ObtenerDatosCasaca());
                    break;
                case "gorros":
                    // GorroBO.Modificar(int.Parse(Id), ObtenerDatosGorro());
                    break;
            }

            ClientScript.RegisterStartupScript(this.GetType(), "alert",
                $"alert('Registro modificado correctamente.'); window.location='ListarPrendas.aspx?tipo={Tipo}';", true);
        }

        // Métodos auxiliares para obtener datos de cada tipo de prenda
        // Implementar según tu modelo de datos
        /*
        private Polo ObtenerDatosPolo()
        {
            return new Polo
            {
                Nombre = txtNombre.Text.Trim(),
                IdTalla = int.Parse(ddlTalla.SelectedValue),
                IdMaterial = int.Parse(ddlMaterial.SelectedValue),
                Color = txtColor.Text.Trim(),
                Stock = int.Parse(txtStock.Text),
                PrecioUnitario = decimal.Parse(txtPU.Text),
                PrecioMayor = decimal.Parse(txtPM.Text),
                PrecioDocena = decimal.Parse(txtPD.Text),
                IdTipoManga = int.Parse(ddlTipoManga.SelectedValue),
                Estampado = txtEstampado.Text.Trim(),
                IdTipoCuello = int.Parse(ddlTipoCuello.SelectedValue)
            };
        }
        */
    }
}