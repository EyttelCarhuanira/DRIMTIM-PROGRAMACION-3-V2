<%@ Page Title="Modificar Comprobante" Language="C#" MasterPageFile="~/WearDrop1.Master" AutoEventWireup="true" CodeBehind="ModificarComprobantes.aspx.cs" Inherits="WearDropWA.ModificarComprobantes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Modificar Comprobante
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .form-container { 
            background-color: #fff;
            border: 1px solid #ddd; 
            border-radius: 8px; 
            padding: 25px; 
        }
        .form-group { margin-bottom: 1.25rem; }
        .form-container h4 {
            font-size: 1.1rem;
            font-weight: 600;
            color: #808080; /* Azul para resaltar el título del panel */
            border-bottom: 1px solid #eee;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }
        .text-end { text-align: right; }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="d-flex justify-content-between align-items-center">
        <h2 class="mb-0">
            <asp:HyperLink ID="hlVolver" runat="server" 
                NavigateUrl="~/GestionarComprobantes.aspx"
                CssClass="text-secondary" 
                Style="text-decoration: none; margin-right: 15px; vertical-align: middle;">
                
                <i class="fa-solid fa-arrow-left fa-fw"></i>
            </asp:HyperLink>
            Modificar Comprobantes
        </h2>
    </div>
    <hr />

    <asp:UpdatePanel ID="upModificar" runat="server">
        <ContentTemplate>
            
            <div class="row">
                <div class="col-md-2 form-group">
                    <label>ID:</label>
                    <asp:TextBox ID="txtID" runat="server" CssClass="form-control" ReadOnly="true" BackColor="#c8c8c8"></asp:TextBox>
                </div>
                <div class="col-md-5 form-group">
                    <label>Tipo de Comprobante</label>
                    <asp:DropDownList ID="ddlTipoComprobante" runat="server" CssClass="form-select"
                        AutoPostBack="true" OnSelectedIndexChanged="ddlTipoComprobante_SelectedIndexChanged">
                        <asp:ListItem Value="Boleta">Boleta</asp:ListItem>
                        <asp:ListItem Value="Factura">Factura</asp:ListItem>
                        <asp:ListItem Value="Nota de Crédito">Nota de Crédito</asp:ListItem>
                        <asp:ListItem Value="Nota de Débito">Nota de Débito</asp:ListItem>
                    </asp:DropDownList>
                </div>
                  <div class="col-md-5 form-group">
                    <label>Correlativo</label>
                    <asp:TextBox ID="txtCorrelativo" runat="server" CssClass="form-control"></asp:TextBox>
                </div>  
            </div>

            <div class="form-container mt-3">
                
                <asp:Panel ID="pnlBoleta" runat="server" Visible="true">
                    <h4>Datos de Boleta</h4>
                    <div class="form-group">
                        <label>Método de Pago</label>
                        <asp:TextBox ID="txtBoletaMetodoPago" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>DNI</label>
                        <asp:TextBox ID="txtBoletaDNI" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label>Fecha</label>
                            <asp:TextBox ID="txtBoletaFecha" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Total (S/.)</label>
                            <asp:TextBox ID="txtBoletaTotal" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </asp:Panel>

                <asp:Panel ID="pnlFactura" runat="server" Visible="false">
                    <h4>Datos de Factura</h4>
                    <div class="form-group">
                        <label>Método de Pago</label>
                        <asp:TextBox ID="txtFacturaMetodoPago" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>RUC</label>
                        <asp:TextBox ID="txtFacturaRUC" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Razón Social</label>
                        <asp:TextBox ID="txtFacturaRazonSocial" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label>Fecha</label>
                            <asp:TextBox ID="txtFacturaFecha" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Total (S/.)</label>
                            <asp:TextBox ID="txtFacturaTotal" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    </asp:Panel>

                <asp:Panel ID="pnlNotaCredito" runat="server" Visible="false">
                    <h4>Datos de Nota de Crédito</h4>
                    <div class="form-group">
                        <label>Método de Pago</label>
                        <asp:TextBox ID="txtNCMetodoPago" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="row">
                        <div class="col-md-6 form-group"><label>DNI</label><asp:TextBox ID="txtNCDNI" runat="server" CssClass="form-control"></asp:TextBox></div>
                        <div class="col-md-6 form-group"><label>RUC</label><asp:TextBox ID="txtNCRUC" runat="server" CssClass="form-control"></asp:TextBox></div>
                    </div>
                    <div class="form-group"><label>Razón Social</label><asp:TextBox ID="txtNCRazonSocial" runat="server" CssClass="form-control"></asp:TextBox></div>
                    <div class="form-group"><label>Motivo Específico</label><asp:TextBox ID="txtNCMotivo" runat="server" CssClass="form-control"></asp:TextBox></div>
                    <div class="row">
                        <div class="col-md-6 form-group"><label>Fecha</label><asp:TextBox ID="txtNCFecha" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox></div>
                        <div class="col-md-6 form-group"><label>Total (S/.)</label><asp:TextBox ID="txtNCTotal" runat="server" CssClass="form-control"></asp:TextBox></div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 form-group"><label>Valor a Aumentar (S/.)</label><asp:TextBox ID="txtNCValorAumentar" runat="server" CssClass="form-control"></asp:TextBox></div>
                        <div class="col-md-6 form-group"><label>Nuevo Monto (S/.)</label><asp:TextBox ID="txtNCNuevoMonto" runat="server" CssClass="form-control" ></asp:TextBox></div>
                    </div>
                </asp:Panel>

                <asp:Panel ID="pnlNotaDebito" runat="server" Visible="false">
                    <h4>Datos de Nota de Débito</h4>
                    <div class="form-group">
                        <label>Método de Pago</label>
                        <asp:TextBox ID="txtNDMetodoPago" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group"><label>RUC</label><asp:TextBox ID="txtNDRUC" runat="server" CssClass="form-control"></asp:TextBox></div>
                    <div class="form-group"><label>Razón Social</label><asp:TextBox ID="txtNDRazonSocial" runat="server" CssClass="form-control"></asp:TextBox></div>
                    <div class="form-group"><label>Motivo específico</label><asp:TextBox ID="txtNDMotivo" runat="server" CssClass="form-control"></asp:TextBox></div>
                    <div class="form-group"><label>Prenda</label><asp:TextBox ID="txtNDPrenda" runat="server" CssClass="form-control"></asp:TextBox></div>
                    <div class="row">
                        <div class="col-md-6 form-group"><label>Fecha</label><asp:TextBox ID="txtNDFecha" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox></div>
                        <div class="col-md-6 form-group"><label>Total (S/.)</label><asp:TextBox ID="txtNDTotal" runat="server" CssClass="form-control"></asp:TextBox></div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 form-group"><label>Valor a Aumentar (S/.)</label><asp:TextBox ID="txtNDValorAumentar" runat="server" CssClass="form-control"></asp:TextBox></div>
                        <div class="col-md-6 form-group"><label>Nuevo Monto (S/.)</label><asp:TextBox ID="txtNDNuevoMonto" runat="server" CssClass="form-control" ></asp:TextBox></div>
                    </div>
                </asp:Panel>
            </div>

            <div class="text-end mt-4">
                <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-success" OnClick="btnGuardar_Click" />
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>