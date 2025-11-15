using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using WearDropWA.PackagePrendas;

namespace WearDropWA
{
    public enum Estado { Nuevo, Modificar, Ver }

    public partial class RegistrarPrenda : System.Web.UI.Page
    {
        private Estado estado;
        private string Tipo => (Request["tipo"] ?? "Polos").Trim();
        private string IdQS => (Request["id"] ?? "").Trim();
        private int Id => int.TryParse(IdQS, out var n) ? n : 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            string accion = (Request.QueryString["accion"] ?? "").Trim().ToLower();

            if (accion == "ver") estado = Estado.Ver;
            else if (accion == "modificar") estado = Estado.Modificar;
            else estado = Estado.Nuevo;

            if (IsPostBack) return;

            ConfigurarCabecera();
            MostrarPanelPorTipo();
            CargarCombosGenerales();
            CargarCombosEspecificosPorTipo();

            if (estado == Estado.Modificar || estado == Estado.Ver)
            {
                AsignarValores();
                txtId.Enabled = false;
            }
            if (estado == Estado.Ver) BloquearEdicion();
        }

        // ========= UI helpers =========
        private void SetVisible(Control c, bool visible) { if (c != null) c.Visible = visible; }

        private void SetSelected(DropDownList ddl, string value)
        {
            if (ddl == null) return;
            var v = (value ?? "").Trim();
            var item = ddl.Items.FindByValue(v);
            if (item != null) ddl.SelectedValue = v;
        }

        private void ConfigurarCabecera()
        {
            string singular = ObtenerNombreSingular();
            string titulo = estado == Estado.Nuevo ? "Registrar" :
                            estado == Estado.Modificar ? "Modificar" : "Ver";

            litTitulo.Text = $"{titulo} {singular}";
            litHeader.Text = $"{titulo} {singular}";
            themeWrap.Attributes["class"] = "container theme-" + Tipo.ToLower();

            btnGuardar.Text = estado == Estado.Nuevo ? "Registrar" :
                              estado == Estado.Modificar ? "Guardar" : "Aceptar";

            SetVisible(divId, estado != Estado.Nuevo);
            if (estado != Estado.Nuevo && txtId != null) txtId.Text = IdQS;

            OcultarAsteriscos(estado != Estado.Nuevo);
        }

        private void OcultarAsteriscos(bool ocultar)
        {
            SetVisible(spanReq, !ocultar);
            SetVisible(spanReqMaterial, !ocultar);
            SetVisible(spanReqColor, !ocultar);
            SetVisible(spanReqStock, !ocultar);
            SetVisible(spanReqPU, !ocultar);
            SetVisible(spanReqPM, !ocultar);
            SetVisible(spanReqPD, !ocultar);
            SetVisible(spanReqManga, !ocultar);
            SetVisible(spanReqCuello, !ocultar);
            SetVisible(spanReqTipoBlusa, !ocultar);
            SetVisible(spanReqMangaB, !ocultar);
            SetVisible(spanReqTipoVestido, !ocultar);
            SetVisible(spanReqLargoVestido, !ocultar);
            SetVisible(spanReqTipoFalda, !ocultar);
            SetVisible(spanReqLargoFalda, !ocultar);
            SetVisible(spanReqVolantes, !ocultar);
            SetVisible(spanReqTipoPantalon, !ocultar);
            SetVisible(spanReqLargoPierna, !ocultar);
            SetVisible(spanReqTipoCasaca, !ocultar);
            SetVisible(spanReqCapucha, !ocultar);
            SetVisible(spanReqTipoGorra, !ocultar);
            SetVisible(spanReqTallaAjustable, !ocultar);
            SetVisible(spanReqImpermeable, !ocultar);
            SetVisible(spanReqMangaV, !ocultar);
            SetVisible(spanReqCintura, !ocultar);
        }

        private void MostrarPanelPorTipo()
        {
            pnlPOLO.Visible = pnlBLUSA.Visible = pnlVESTIDO.Visible =
            pnlFALDA.Visible = pnlPANTALON.Visible = pnlCASACA.Visible =
            pnlGORRO.Visible = false;

            switch (Tipo.ToLower())
            {
                case "polo":
                case "polos": pnlPOLO.Visible = true; break;
                case "blusa":
                case "blusas": pnlBLUSA.Visible = true; break;
                case "vestido":
                case "vestidos": pnlVESTIDO.Visible = true; break;
                case "falda":
                case "faldas": pnlFALDA.Visible = true; break;
                case "pantalon":
                case "pantalones": pnlPANTALON.Visible = true; break;
                case "casaca":
                case "casacas": pnlCASACA.Visible = true; break;
                case "gorro":
                case "gorros": pnlGORRO.Visible = true; break;
            }
        }

        private void BloquearEdicion()
        {
            txtNombre.Enabled = false;
            ddlMaterial.Enabled = false;
            txtColor.Enabled = false;
            txtStock.Enabled = false;
            txtPU.Enabled = false;
            txtPM.Enabled = false;
            txtPD.Enabled = false;

            ddlTipoManga.Enabled = false;
            ddlTipoCuello.Enabled = false;
            txtEstampado.Enabled = false;

            ddlTipoBlusa.Enabled = false;
            ddlTipoMangaB.Enabled = false;

            ddlTipoVestido.Enabled = false;
            txtLargoVestido.Enabled = false;
            ddlTipoMangaV.Enabled = false;

            ddlTipoFalda.Enabled = false;
            txtLargoFalda.Enabled = false;
            ddlConVolantes.Enabled = false;

            ddlTipoPantalon.Enabled = false;
            txtLargoPierna.Enabled = false;
            txtCintura.Enabled = false;

            ddlTipoCasaca.Enabled = false;
            ddlConCapucha.Enabled = false;

            ddlTipoGorra.Enabled = false;
            ddlTallaAjustable.Enabled = false;
            ddlImpermeable.Enabled = false;

            btnGuardar.Visible = false;
        }

        // ========= COMBOS =========
        private void CargarCombosGenerales()
        {
            ddlMaterial.Items.Clear();
            ddlMaterial.Items.Add(new ListItem("-- Seleccione --", ""));

            // ✅ Usar material del PackagePrendas
            foreach (material it in Enum.GetValues(typeof(material)))
            {
                string name = Enum.GetName(typeof(material), it);
                ddlMaterial.Items.Add(new ListItem(name.Replace('_', ' '), name));
            }
        }

        private void CargarCombosEspecificosPorTipo()
        {
            // Polo
            ddlTipoManga.Items.Clear();
            ddlTipoManga.Items.Add(new ListItem("-- Seleccione --", ""));
            foreach (tipoManga it in Enum.GetValues(typeof(tipoManga)))
            {
                string name = Enum.GetName(typeof(tipoManga), it);
                ddlTipoManga.Items.Add(new ListItem(name.Replace('_', ' '), name));
            }

            ddlTipoCuello.Items.Clear();
            ddlTipoCuello.Items.Add(new ListItem("-- Seleccione --", ""));
            foreach (tipoCuello it in Enum.GetValues(typeof(tipoCuello)))
            {
                string name = Enum.GetName(typeof(tipoCuello), it);
                ddlTipoCuello.Items.Add(new ListItem(name.Replace('_', ' '), name));
            }

            // Blusa
            ddlTipoBlusa.Items.Clear();
            ddlTipoBlusa.Items.Add(new ListItem("-- Seleccione --", ""));
            foreach (tipoBlusa it in Enum.GetValues(typeof(tipoBlusa)))
            {
                string name = Enum.GetName(typeof(tipoBlusa), it);
                ddlTipoBlusa.Items.Add(new ListItem(name.Replace('_', ' '), name));
            }

            ddlTipoMangaB.Items.Clear();
            ddlTipoMangaB.Items.Add(new ListItem("-- Seleccione --", ""));
            foreach (tipoManga it in Enum.GetValues(typeof(tipoManga)))
            {
                string name = Enum.GetName(typeof(tipoManga), it);
                ddlTipoMangaB.Items.Add(new ListItem(name.Replace('_', ' '), name));
            }

            // Vestido
            ddlTipoVestido.Items.Clear();
            ddlTipoVestido.Items.Add(new ListItem("-- Seleccione --", ""));
            foreach (tipoVestido it in Enum.GetValues(typeof(tipoVestido)))
            {
                string name = Enum.GetName(typeof(tipoVestido), it);
                ddlTipoVestido.Items.Add(new ListItem(name.Replace('_', ' '), name));
            }

            ddlTipoMangaV.Items.Clear();
            ddlTipoMangaV.Items.Add(new ListItem("-- Seleccione --", ""));
            foreach (tipoManga it in Enum.GetValues(typeof(tipoManga)))
            {
                string name = Enum.GetName(typeof(tipoManga), it);
                ddlTipoMangaV.Items.Add(new ListItem(name.Replace('_', ' '), name));
            }

            // Falda
            ddlTipoFalda.Items.Clear();
            ddlTipoFalda.Items.Add(new ListItem("-- Seleccione --", ""));
            foreach (tipoFalda it in Enum.GetValues(typeof(tipoFalda)))
            {
                string name = Enum.GetName(typeof(tipoFalda), it);
                ddlTipoFalda.Items.Add(new ListItem(name.Replace('_', ' '), name));
            }

            ddlConVolantes.Items.Clear();
            ddlConVolantes.Items.Add(new ListItem("-- Seleccione --", ""));
            ddlConVolantes.Items.Add(new ListItem("No", "0"));
            ddlConVolantes.Items.Add(new ListItem("Sí", "1"));

            // Pantalón
            ddlTipoPantalon.Items.Clear();
            ddlTipoPantalon.Items.Add(new ListItem("-- Seleccione --", ""));
            foreach (tipoPantalon it in Enum.GetValues(typeof(tipoPantalon)))
            {
                string name = Enum.GetName(typeof(tipoPantalon), it);
                ddlTipoPantalon.Items.Add(new ListItem(name.Replace('_', ' '), name));
            }

            // Casaca
            ddlTipoCasaca.Items.Clear();
            ddlTipoCasaca.Items.Add(new ListItem("-- Seleccione --", ""));
            foreach (tipoCasaca it in Enum.GetValues(typeof(tipoCasaca)))
            {
                string name = Enum.GetName(typeof(tipoCasaca), it);
                ddlTipoCasaca.Items.Add(new ListItem(name.Replace('_', ' '), name));
            }

            ddlConCapucha.Items.Clear();
            ddlConCapucha.Items.Add(new ListItem("-- Seleccione --", ""));
            ddlConCapucha.Items.Add(new ListItem("No", "0"));
            ddlConCapucha.Items.Add(new ListItem("Sí", "1"));

            // Gorro
            ddlTipoGorra.Items.Clear();
            ddlTipoGorra.Items.Add(new ListItem("-- Seleccione --", ""));
            foreach (tipoGorra it in Enum.GetValues(typeof(tipoGorra)))
            {
                string name = Enum.GetName(typeof(tipoGorra), it);
                ddlTipoGorra.Items.Add(new ListItem(name.Replace('_', ' '), name));
            }

            ddlTallaAjustable.Items.Clear();
            ddlTallaAjustable.Items.Add(new ListItem("-- Seleccione --", ""));
            ddlTallaAjustable.Items.Add(new ListItem("No", "0"));
            ddlTallaAjustable.Items.Add(new ListItem("Sí", "1"));

            ddlImpermeable.Items.Clear();
            ddlImpermeable.Items.Add(new ListItem("-- Seleccione --", ""));
            ddlImpermeable.Items.Add(new ListItem("No", "0"));
            ddlImpermeable.Items.Add(new ListItem("Sí", "1"));
        }

        // ========= CARGA PARA MODIFICAR/VER =========
        private void AsignarValores()
        {
            if (Id <= 0) { MostrarError("Id inválido."); return; }

            switch (Tipo.ToLower())
            {
                case "polo":
                case "polos":
                    {
                        var ws = new PoloWSClient();
                        var p = ws.obtenerPoloPorId(Id);
                        if (p == null) throw new Exception("No se encontró el Polo.");
                        MapGeneralFromEntity(p.nombre, p.color, p.alertaMinStock, p.precioUnidad, p.precioMayor, p.precioDocena);
                        SetSelected(ddlMaterial, p.material.ToString());
                        SetSelected(ddlTipoManga, p.tipoManga.ToString());
                        SetSelected(ddlTipoCuello, p.tipoCuello.ToString());
                        txtEstampado.Text = p.estampado;
                        break;
                    }
                case "blusa":
                case "blusas":
                    {
                        var ws = new BlusaWSClient();
                        var p = ws.obtenerBlusaPorId(Id);
                        if (p == null) throw new Exception("No se encontró la Blusa.");
                        MapGeneralFromEntity(p.nombre, p.color, p.alertaMinStock, p.precioUnidad, p.precioMayor, p.precioDocena);
                        SetSelected(ddlMaterial, p.material.ToString());
                        SetSelected(ddlTipoBlusa, p.tipoBlusa.ToString());
                        SetSelected(ddlTipoMangaB, p.tipoManga.ToString());
                        break;
                    }
                case "vestido":
                case "vestidos":
                    {
                        var ws = new VestidoWSClient();
                        var p = ws.obtenerVestidoPorId(Id);
                        if (p == null) throw new Exception("No se encontró el Vestido.");
                        MapGeneralFromEntity(p.nombre, p.color, p.alertaMinStock, p.precioUnidad, p.precioMayor, p.precioDocena);
                        SetSelected(ddlMaterial, p.material.ToString());
                        SetSelected(ddlTipoVestido, p.tipoVestido.ToString());
                        SetSelected(ddlTipoMangaV, p.tipoManga.ToString());
                        txtLargoVestido.Text = p.largo.ToString("0.##");
                        break;
                    }
                case "falda":
                case "faldas":
                    {
                        var ws = new FaldaWSClient();
                        var p = ws.obtenerFaldaPorId(Id);
                        if (p == null) throw new Exception("No se encontró la Falda.");
                        MapGeneralFromEntity(p.nombre, p.color, p.alertaMinStock, p.precioUnidad, p.precioMayor, p.precioDocena);
                        SetSelected(ddlMaterial, p.material.ToString());
                        SetSelected(ddlTipoFalda, p.tipoFalda.ToString());
                        txtLargoFalda.Text = p.largo.ToString("0.##");
                        SetSelected(ddlConVolantes, BoolTo10(p.conVolantes));
                        break;
                    }
                case "pantalon":
                case "pantalones":
                    {
                        var ws = new PantalonWSClient();
                        var p = ws.obtenerPantalonPorId(Id);
                        if (p == null) throw new Exception("No se encontró el Pantalón.");
                        MapGeneralFromEntity(p.nombre, p.color, p.alertaMinStock, p.precioUnidad, p.precioMayor, p.precioDocena);
                        SetSelected(ddlMaterial, p.material.ToString());
                        SetSelected(ddlTipoPantalon, p.tipoPantalon.ToString());
                        txtLargoPierna.Text = p.largoPierna.ToString("0.##");
                        txtCintura.Text = p.cintura.ToString("0.##");
                        break;
                    }
                case "casaca":
                case "casacas":
                    {
                        var ws = new CasacaWSClient();
                        var p = ws.obtenerCasacaPorId(Id);
                        if (p == null) throw new Exception("No se encontró la Casaca.");
                        MapGeneralFromEntity(p.nombre, p.color, p.alertaMinStock, p.precioUnidad, p.precioMayor, p.precioDocena);
                        SetSelected(ddlMaterial, p.material.ToString());
                        SetSelected(ddlTipoCasaca, p.tipoCasaca.ToString());
                        SetSelected(ddlConCapucha, BoolTo10(p.conCapucha));
                        break;
                    }
                case "gorro":
                case "gorros":
                    {
                        var ws = new GorroWSClient();
                        var p = ws.obtenerGorroPorId(Id);
                        if (p == null) throw new Exception("No se encontró el Gorro.");
                        MapGeneralFromEntity(p.nombre, p.color, p.alertaMinStock, p.precioUnidad, p.precioMayor, p.precioDocena);
                        SetSelected(ddlMaterial, p.material.ToString());
                        SetSelected(ddlTipoGorra, p.tipoGorra.ToString());
                        SetSelected(ddlTallaAjustable, BoolTo10(p.tallaAjustable));
                        SetSelected(ddlImpermeable, BoolTo10(p.impermeable));
                        break;
                    }
            }
        }

        private void MapGeneralFromEntity(string nombre, string color, int alertaMinStock,
                                          double pu, double pm, double pd)
        {
            txtNombre.Text = nombre;
            txtColor.Text = color;
            txtStock.Text = alertaMinStock.ToString();
            txtPU.Text = pu.ToString("0.##");
            txtPM.Text = pm.ToString("0.##");
            txtPD.Text = pd.ToString("0.##");
        }

        // ========= GUARDAR =========
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                switch (Tipo.ToLower())
                {
                    case "polo":
                    case "polos": GuardarPolo(); break;
                    case "blusa":
                    case "blusas": GuardarBlusa(); break;
                    case "vestido":
                    case "vestidos": GuardarVestido(); break;
                    case "falda":
                    case "faldas": GuardarFalda(); break;
                    case "pantalon":
                    case "pantalones": GuardarPantalon(); break;
                    case "casaca":
                    case "casacas": GuardarCasaca(); break;
                    case "gorro":
                    case "gorros": GuardarGorro(); break;
                }
            }
            catch (Exception ex)
            {
                MostrarError(ex.Message);
                return;
            }

            Response.Redirect($"ListarPrendas.aspx?tipo={Tipo}");
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect($"ListarPrendas.aspx?tipo={Tipo}");
        }

        // ========= GUARDAR POR TIPO =========
        private void GuardarPolo()
        {
            var ws = new PoloWSClient();
            var p = new polo
            {
                nombre = txtNombre.Text,
                color = txtColor.Text,
                alertaMinStock = ParseInt(txtStock.Text, "Stock"),
                precioUnidad = ParseDouble(txtPU.Text, "Precio Unidad"),
                precioMayor = ParseDouble(txtPM.Text, "Precio Mayor"),
                precioDocena = ParseDouble(txtPD.Text, "Precio Docena"),
                material = (material)Enum.Parse(typeof(material), ddlMaterial.SelectedValue, true),
                tipoManga = (tipoManga)Enum.Parse(typeof(tipoManga), ddlTipoManga.SelectedValue, true),
                tipoCuello = (tipoCuello)Enum.Parse(typeof(tipoCuello), ddlTipoCuello.SelectedValue, true),
                estampado = txtEstampado.Text
            };

            if (estado == Estado.Modificar) { p.idPrenda = Id; ws.modificarPolo(p); }
            else ws.insertarPolo(p);
        }

        private void GuardarBlusa()
        {
            var ws = new BlusaWSClient();
            var p = new blusa
            {
                nombre = txtNombre.Text,
                color = txtColor.Text,
                alertaMinStock = ParseInt(txtStock.Text, "Stock"),
                precioUnidad = ParseDouble(txtPU.Text, "Precio Unidad"),
                precioMayor = ParseDouble(txtPM.Text, "Precio Mayor"),
                precioDocena = ParseDouble(txtPD.Text, "Precio Docena"),
                material = (material)Enum.Parse(typeof(material), ddlMaterial.SelectedValue, true),
                tipoBlusa = (tipoBlusa)Enum.Parse(typeof(tipoBlusa), ddlTipoBlusa.SelectedValue, true),
                tipoManga = (tipoManga)Enum.Parse(typeof(tipoManga), ddlTipoMangaB.SelectedValue, true)
            };

            if (estado == Estado.Modificar) { p.idPrenda = Id; ws.modificarBlusa(p); }
            else ws.insertarBlusa(p);
        }

        private void GuardarVestido()
        {
            var ws = new VestidoWSClient();
            var p = new vestido
            {
                nombre = txtNombre.Text,
                color = txtColor.Text,
                alertaMinStock = ParseInt(txtStock.Text, "Stock"),
                precioUnidad = ParseDouble(txtPU.Text, "Precio Unidad"),
                precioMayor = ParseDouble(txtPM.Text, "Precio Mayor"),
                precioDocena = ParseDouble(txtPD.Text, "Precio Docena"),
                material = (material)Enum.Parse(typeof(material), ddlMaterial.SelectedValue, true),
                tipoVestido = (tipoVestido)Enum.Parse(typeof(tipoVestido), ddlTipoVestido.SelectedValue, true),
                tipoManga = (tipoManga)Enum.Parse(typeof(tipoManga), ddlTipoMangaV.SelectedValue, true),
                largo = ParseInt(txtLargoVestido.Text, "Largo (cm)")
            };

            if (estado == Estado.Modificar) { p.idPrenda = Id; ws.modificarVestido(p); }
            else ws.insertarVestido(p);
        }

        private void GuardarFalda()
        {
            var ws = new FaldaWSClient();
            var p = new falda
            {
                nombre = txtNombre.Text,
                color = txtColor.Text,
                alertaMinStock = ParseInt(txtStock.Text, "Stock"),
                precioUnidad = ParseDouble(txtPU.Text, "Precio Unidad"),
                precioMayor = ParseDouble(txtPM.Text, "Precio Mayor"),
                precioDocena = ParseDouble(txtPD.Text, "Precio Docena"),
                material = (material)Enum.Parse(typeof(material), ddlMaterial.SelectedValue, true),
                tipoFalda = (tipoFalda)Enum.Parse(typeof(tipoFalda), ddlTipoFalda.SelectedValue, true),
                largo = ParseDouble(txtLargoFalda.Text, "Largo (cm)"),
                conVolantes = IsTrue10(ddlConVolantes.SelectedValue)
            };

            if (estado == Estado.Modificar) { p.idPrenda = Id; ws.modificarFalda(p); }
            else ws.insertarFalda(p);
        }

        private void GuardarPantalon()
        {
            var ws = new PantalonWSClient();
            var p = new pantalon
            {
                nombre = txtNombre.Text,
                color = txtColor.Text,
                alertaMinStock = ParseInt(txtStock.Text, "Stock"),
                precioUnidad = ParseDouble(txtPU.Text, "Precio Unidad"),
                precioMayor = ParseDouble(txtPM.Text, "Precio Mayor"),
                precioDocena = ParseDouble(txtPD.Text, "Precio Docena"),
                material = (material)Enum.Parse(typeof(material), ddlMaterial.SelectedValue, true),
                tipoPantalon = (tipoPantalon)Enum.Parse(typeof(tipoPantalon), ddlTipoPantalon.SelectedValue, true),
                largoPierna = ParseDouble(txtLargoPierna.Text, "Largo pierna (cm)"),
                cintura = ParseDouble(txtCintura.Text, "Cintura (cm)")
            };

            if (estado == Estado.Modificar) { p.idPrenda = Id; ws.modificarPantalon(p); }
            else ws.insertarPantalon(p);
        }

        private void GuardarCasaca()
        {
            var ws = new CasacaWSClient();
            var p = new casaca
            {
                nombre = txtNombre.Text,
                color = txtColor.Text,
                alertaMinStock = ParseInt(txtStock.Text, "Stock"),
                precioUnidad = ParseDouble(txtPU.Text, "Precio Unidad"),
                precioMayor = ParseDouble(txtPM.Text, "Precio Mayor"),
                precioDocena = ParseDouble(txtPD.Text, "Precio Docena"),
                material = (material)Enum.Parse(typeof(material), ddlMaterial.SelectedValue, true),
                tipoCasaca = (tipoCasaca)Enum.Parse(typeof(tipoCasaca), ddlTipoCasaca.SelectedValue, true),
                conCapucha = IsTrue10(ddlConCapucha.SelectedValue)
            };

            if (estado == Estado.Modificar) { p.idPrenda = Id; ws.modificarCasaca(p); }
            else ws.insertarCasaca(p);
        }

        private void GuardarGorro()
        {
            var ws = new GorroWSClient();
            var p = new gorro
            {
                nombre = txtNombre.Text,
                color = txtColor.Text,
                alertaMinStock = ParseInt(txtStock.Text, "Stock"),
                precioUnidad = ParseDouble(txtPU.Text, "Precio Unidad"),
                precioMayor = ParseDouble(txtPM.Text, "Precio Mayor"),
                precioDocena = ParseDouble(txtPD.Text, "Precio Docena"),
                material = (material)Enum.Parse(typeof(material), ddlMaterial.SelectedValue, true),
                tipoGorra = (tipoGorra)Enum.Parse(typeof(tipoGorra), ddlTipoGorra.SelectedValue, true),
                tallaAjustable = IsTrue10(ddlTallaAjustable.SelectedValue),
                impermeable = IsTrue10(ddlImpermeable.SelectedValue)
            };

            if (estado == Estado.Modificar) { p.idPrenda = Id; ws.modificarGorro(p); }
            else ws.insertarGorro(p);
        }

        // ========= HELPERS =========
        private static string BoolTo10(bool b) => b ? "1" : "0";
        private static bool IsTrue10(string v) => (v ?? "").Trim() == "1";

        private static int ParseInt(string txt, string campo)
        {
            if (!int.TryParse((txt ?? "").Trim(), out var n))
                throw new ArgumentException($"Valor inválido para {campo}.");
            return n;
        }

        private static double ParseDouble(string txt, string campo)
        {
            if (!double.TryParse((txt ?? "").Trim(), out var d))
                throw new ArgumentException($"Valor inválido para {campo}.");
            return d;
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

        private void MostrarError(string mensaje)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "error", $"alert('{mensaje}');", true);
        }
    }
}
