<%@ Page Title="" Language="C#" MasterPageFile="~/WearDrop1.Master" AutoEventWireup="true" CodeBehind="RegistrarPrenda.aspx.cs" Inherits="WearDropWA.RegistrarPrenda" %>

<asp:Content ID="cTitle" ContentPlaceHolderID="TitleContent" runat="server">
    <asp:Literal ID="litTitulo" runat="server"></asp:Literal>
</asp:Content>

<asp:Content ID="cHead" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .header-title{display:flex;align-items:stretch;height:60px;box-shadow:0 2px 4px rgba(0,0,0,.1);margin-top:14px}
        .title-section{background:#fff;padding:0 25px;display:flex;align-items:center;flex:0 0 250px}
        .title-section h2{margin:0;font-size:20px;font-weight:500;color:#333;white-space:nowrap}
        .color-bar{height:100%}.bar-1{background:#C5D9C0;flex:1.5}.bar-2{background:#95B88F;flex:1.5}

        .form-label{font-size:14px;color:#333;margin-bottom:8px;display:block}
        .form-control{background:#F5F5F5;border:1px solid #E0E0E0;border-radius:4px;padding:10px 15px;width:100%}
        .btn{color:#fff;border:none;padding:10px 30px;border-radius:4px;font-size:14px;cursor:pointer;background:#73866D}
        .btn:hover{background:#5f6f5a}
        .field-note{color:#999;font-size:12px}
        
        
        /* Temas por tipo de prenda */
        .theme-polos .bar-1{background:#CFE1CC}.theme-polos .bar-2{background:#9DBD9B}
        .theme-polos .btn{background:#9DBD9B}.theme-polos .btn:hover{background:#8aab89}
        
        .theme-vestidos .bar-1{background:#CCD8E1}.theme-vestidos .bar-2{background:#9FB6C8}
        .theme-vestidos .btn{background:#9FB6C8}.theme-vestidos .btn:hover{background:#8da4b5}
        
        .theme-faldas .bar-1{background:#E4C3CC}.theme-faldas .bar-2{background:#C5A0B0}
        .theme-faldas .btn{background:#C5A0B0}.theme-faldas .btn:hover{background:#b38f9e}
        
        .theme-gorros .bar-1{background:#E4B9BD}.theme-gorros .bar-2{background:#C99298}
        .theme-gorros .btn{background:#C99298}.theme-gorros .btn:hover{background:#b78188}
        
        .theme-pantalones .bar-1{background:#D8D1EC}.theme-pantalones .bar-2{background:#B4A6D6}
        .theme-pantalones .btn{background:#B4A6D6}.theme-pantalones .btn:hover{background:#a295c3}
        
        .theme-casacas .bar-1{background:#CFE6E1}.theme-casacas .bar-2{background:#9AC5BE}
        .theme-casacas .btn{background:#9AC5BE}.theme-casacas .btn:hover{background:#89b3ac}
        
        .theme-blusas .bar-1{background:#F6F1B8}.theme-blusas .bar-2{background:#EDE28A}
        .theme-blusas .btn{background:#EDE28A}.theme-blusas .btn:hover{background:#e3d878}
    </style>
</asp:Content>

<asp:Content ID="cMain" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" id="themeWrap" runat="server">
        <div class="row">
            <div class="col-md-6 p-0">
                <div class="header-title">
                    <div class="title-section">
                        <h2><asp:Literal ID="litHeader" runat="server"></asp:Literal></h2>
                    </div>
                    <div class="color-bar bar-1"></div>
                    <div class="color-bar bar-2"></div>
                </div>
            </div>
        </div>

        <!-- ID (solo visible en modo modificación) -->
        <div class="row mt-4" id="divId" runat="server" visible="false">
            <div class="col-md-2">
                <label class="form-label" for="txtId">ID</label>
                <asp:TextBox ID="txtId" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
            </div>
        </div>

        <!-- CAMPOS COMUNES -->
        <div class="row mt-4 g-4">
            <div class="col-md-6">
                <label class="form-label" for="txtNombre">Nombre <span id="spanReq" runat="server">(*)</span></label>
                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" placeholder="Nombre de la prenda"></asp:TextBox>
            </div>
            <div class="col-md-3">
                <label class="form-label" for="ddlTalla">Talla <span id="spanReqTalla" runat="server">(*)</span></label>
                <asp:DropDownList ID="ddlTalla" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>
            <div class="col-md-3">
                <label class="form-label" for="ddlMaterial">Material <span id="spanReqMaterial" runat="server">(*)</span></label>
                <asp:DropDownList ID="ddlMaterial" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>
            <div class="col-md-3">
                <label class="form-label" for="txtColor">Color <span id="spanReqColor" runat="server">(*)</span></label>
                <asp:TextBox ID="txtColor" runat="server" CssClass="form-control" placeholder="Ej: Blanco"></asp:TextBox>
            </div>
            <div class="col-md-3">
                <label class="form-label" for="txtStock">Stock <span id="spanReqStock" runat="server">(*)</span></label>
                <asp:TextBox ID="txtStock" runat="server" CssClass="form-control" placeholder="0"></asp:TextBox>
            </div>
            <div class="col-md-2">
                <label class="form-label" for="txtPU">Precio Unidad <span id="spanReqPU" runat="server">(*)</span></label>
                <asp:TextBox ID="txtPU" runat="server" CssClass="form-control" placeholder="0.00"></asp:TextBox>
            </div>
            <div class="col-md-2">
                <label class="form-label" for="txtPM">Precio Mayor <span id="spanReqPM" runat="server">(*)</span></label>
                <asp:TextBox ID="txtPM" runat="server" CssClass="form-control" placeholder="0.00"></asp:TextBox>
            </div>
            <div class="col-md-2">
                <label class="form-label" for="txtPD">Precio Docena <span id="spanReqPD" runat="server">(*)</span></label>
                <asp:TextBox ID="txtPD" runat="server" CssClass="form-control" placeholder="0.00"></asp:TextBox>
            </div>

            <!-- PANEL POLO -->
            <asp:Panel ID="pnlPOLO" runat="server" CssClass="col-12" Visible="false">
                <div class="row g-4">
                    <div class="col-md-4">
                        <label class="form-label" for="ddlTipoManga">Tipo de Manga <span id="spanReqManga" runat="server">(*)</span></label>
                        <asp:DropDownList ID="ddlTipoManga" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label" for="txtEstampado">Estampado</label>
                        <asp:TextBox ID="txtEstampado" runat="server" CssClass="form-control" placeholder="Descripción del estampado (opcional)"></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label" for="ddlTipoCuello">Tipo de Cuello <span id="spanReqCuello" runat="server">(*)</span></label>
                        <asp:DropDownList ID="ddlTipoCuello" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                </div>
            </asp:Panel>

            <!-- PANEL BLUSA -->
            <asp:Panel ID="pnlBLUSA" runat="server" CssClass="col-12" Visible="false">
                <div class="row g-4">
                    <div class="col-md-6">
                        <label class="form-label" for="ddlTipoBlusa">Tipo de Blusa <span id="spanReqTipoBlusa" runat="server">(*)</span></label>
                        <asp:DropDownList ID="ddlTipoBlusa" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label" for="ddlTipoMangaB">Tipo de Manga <span id="spanReqMangaB" runat="server">(*)</span></label>
                        <asp:DropDownList ID="ddlTipoMangaB" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                </div>
            </asp:Panel>

            <!-- PANEL VESTIDO -->
            <asp:Panel ID="pnlVESTIDO" runat="server" CssClass="col-12" Visible="false">
                <div class="row g-4">
                    <div class="col-md-6">
                        <label class="form-label" for="ddlTipoVestido">Tipo de Vestido <span id="spanReqTipoVestido" runat="server">(*)</span></label>
                        <asp:DropDownList ID="ddlTipoVestido" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label" for="txtLargoVestido">Largo (cm) <span id="spanReqLargoVestido" runat="server">(*)</span></label>
                        <asp:TextBox ID="txtLargoVestido" runat="server" CssClass="form-control" placeholder="Ej: 90"></asp:TextBox>
                    </div>
                </div>
            </asp:Panel>

            <!-- PANEL FALDA -->
            <asp:Panel ID="pnlFALDA" runat="server" CssClass="col-12" Visible="false">
                <div class="row g-4">
                    <div class="col-md-4">
                        <label class="form-label" for="ddlTipoFalda">Tipo de Falda <span id="spanReqTipoFalda" runat="server">(*)</span></label>
                        <asp:DropDownList ID="ddlTipoFalda" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label" for="txtLargoFalda">Largo (cm) <span id="spanReqLargoFalda" runat="server">(*)</span></label>
                        <asp:TextBox ID="txtLargoFalda" runat="server" CssClass="form-control" placeholder="Ej: 60"></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label" for="ddlConVolantes">Con Volantes <span id="spanReqVolantes" runat="server">(*)</span></label>
                        <asp:DropDownList ID="ddlConVolantes" runat="server" CssClass="form-control">
                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                            <asp:ListItem Value="1">Sí</asp:ListItem>
                            <asp:ListItem Value="0">No</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </asp:Panel>

            <!-- PANEL PANTALON -->
            <asp:Panel ID="pnlPANTALON" runat="server" CssClass="col-12" Visible="false">
                <div class="row g-4">
                    <div class="col-md-6">
                        <label class="form-label" for="ddlTipoPantalon">Tipo de Pantalón <span id="spanReqTipoPantalon" runat="server">(*)</span></label>
                        <asp:DropDownList ID="ddlTipoPantalon" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label" for="txtLargoPierna">Largo pierna (cm) <span id="spanReqLargoPierna" runat="server">(*)</span></label>
                        <asp:TextBox ID="txtLargoPierna" runat="server" CssClass="form-control" placeholder="Ej: 100"></asp:TextBox>
                    </div>
                </div>
            </asp:Panel>

            <!-- PANEL CASACA -->
            <asp:Panel ID="pnlCASACA" runat="server" CssClass="col-12" Visible="false">
                <div class="row g-4">
                    <div class="col-md-6">
                        <label class="form-label" for="ddlTipoCasaca">Tipo de Casaca <span id="spanReqTipoCasaca" runat="server">(*)</span></label>
                        <asp:DropDownList ID="ddlTipoCasaca" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label" for="ddlConCapucha">Con Capucha <span id="spanReqCapucha" runat="server">(*)</span></label>
                        <asp:DropDownList ID="ddlConCapucha" runat="server" CssClass="form-control">
                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                            <asp:ListItem Value="1">Sí</asp:ListItem>
                            <asp:ListItem Value="0">No</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </asp:Panel>

            <!-- PANEL GORRO -->
            <asp:Panel ID="pnlGORRO" runat="server" CssClass="col-12" Visible="false">
                <div class="row g-4">
                    <div class="col-md-4">
                        <label class="form-label" for="ddlTipoGorra">Tipo de Gorro <span id="spanReqTipoGorra" runat="server">(*)</span></label>
                        <asp:DropDownList ID="ddlTipoGorra" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label" for="ddlTallaAjustable">Talla Ajustable <span id="spanReqTallaAjustable" runat="server">(*)</span></label>
                        <asp:DropDownList ID="ddlTallaAjustable" runat="server" CssClass="form-control">
                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                            <asp:ListItem Value="1">Sí</asp:ListItem>
                            <asp:ListItem Value="0">No</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label" for="ddlImpermeable">Impermeable <span id="spanReqImpermeable" runat="server">(*)</span></label>
                        <asp:DropDownList ID="ddlImpermeable" runat="server" CssClass="form-control">
                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                            <asp:ListItem Value="1">Sí</asp:ListItem>
                            <asp:ListItem Value="0">No</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </asp:Panel>
        </div>

        <div class="mt-5 d-flex justify-content-between">
            <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn" OnClick="btnCancelar_Click" />
            <asp:Button ID="btnGuardar" runat="server" CssClass="btn" OnClick="btnGuardar_Click" />
        </div>
    </div>
</asp:Content>

<asp:Content ID="cScripts" ContentPlaceHolderID="ScriptsContent" runat="server" />