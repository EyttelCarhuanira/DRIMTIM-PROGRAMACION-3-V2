<%@ Page Title="Registrar Comprobante" Language="C#" MasterPageFile="~/WearDrop1.Master" AutoEventWireup="true" CodeBehind="RegistrarComprobantes.aspx.cs" Inherits="WearDropWA.RegistrarComprobantes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Registrar Comprobante
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        /* (Tus estilos existentes) */
        .comprobante-header { background-color: #e6f0e6; padding: 15px; font-size: 1.5em; margin-bottom: 20px; }
        .comprobante-tabs { margin-bottom: 20px; }
        .tab-link { padding: 10px 20px; text-decoration: none; border: 1px solid #ccc; background-color: #f0f0f0; color: #555; margin-right: 5px; border-radius: 5px 5px 0 0; }
        .tab-link.active { background-color: #d9e9d9; border-bottom: 1px solid #d9e9d9; font-weight: bold; }
        .form-container { border: 1px solid #ddd; border-radius: 8px; padding: 25px; }
        .igv-container { text-align: right; margin-top: 15px; }
        .igv-textbox { width: 80px; display: inline-block; margin-left: 10px; }
        .resumen-header { margin-top: 30px; }
        .footer-actions { display: flex; justify-content: space-between; align-items: center; margin-top: 30px; border-top: 1px solid #eee; padding-top: 20px; }
        .total-display { font-size: 1.2em; font-weight: bold; }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    
    <%-- Título con flecha de "Volver" --%>
    <div class="comprobante-header d-flex align-items-center">
        <asp:HyperLink ID="hlVolver" runat="server" 
            NavigateUrl="~/GestionarComprobantes.aspx"
            CssClass="text-dark" 
            Style="text-decoration: none; margin-right: 15px; font-size: 1.2em;">
            <i class="fa-solid fa-arrow-left fa-fw"></i>
        </asp:HyperLink>
        <span style="flex-grow: 1;">Comprobantes de pago</span>
    </div>

    <asp:UpdatePanel ID="upRegistrar" runat="server">
        <ContentTemplate>
            
            <%-- PESTAÑAS (LinkButton) --%>
            <div class="comprobante-tabs">
                <asp:LinkButton ID="btnTabBoleta" runat="server" CssClass="tab-link active" OnClick="btnTabBoleta_Click">Boleta</asp:LinkButton>
                <asp:LinkButton ID="btnTabFactura" runat="server" CssClass="tab-link" OnClick="btnTabFactura_Click">Factura</asp:LinkButton>
                <asp:LinkButton ID="btnTabNotaCredito" runat="server" CssClass="tab-link" OnClick="btnTabNotaCredito_Click">Nota de Crédito</asp:LinkButton>
                <asp:LinkButton ID="btnTabNotaDebito" runat="server" CssClass="tab-link" OnClick="btnTabNotaDebito_Click">Nota de Débito</asp:LinkButton>
            </div>

            <asp:Panel ID="pnlBoleta" runat="server" Visible="true">
                <div class="form-container">
                    <div class="form-group"><asp:Label ID="lblDNI" runat="server" AssociatedControlID="txtDNI">Documento Nacional de Identidad</asp:Label><asp:TextBox ID="txtDNI" runat="server" CssClass="form-control"></asp:TextBox></div>
                    <div class="form-group"><asp:Label ID="lblNombres" runat="server" AssociatedControlID="txtNombres">Nombres y Apellidos</asp:Label><asp:TextBox ID="txtNombres" runat="server" CssClass="form-control"></asp:TextBox></div>
                    <div class="form-group"><asp:Label ID="lblEmail" runat="server" AssociatedControlID="txtEmail">Email</asp:Label><asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox></div>
                    <div class="igv-container"><asp:Label ID="lblIGV" runat="server" AssociatedControlID="txtIGV">IGV (%):</asp:Label><asp:TextBox ID="txtIGV" runat="server" CssClass="form-control igv-textbox"></asp:TextBox></div>
                </div>
                <h3 class="resumen-header">Resumen</h3>
                <div class="footer-actions">
                    <div class="total-display"><strong>Total: S/. </strong><asp:Label ID="lblTotalBoleta" runat="server" Text="0.00"></asp:Label></div>
                    <div class="action-buttons">
                        <asp:LinkButton ID="btnCancelarBoleta" runat="server" 
                                CssClass="btn btn-light"
                                PostBackUrl="~/GestionarComprobantes.aspx"> <i class="fa fa-times"></i> Cancelar
                            </asp:LinkButton>
                        <asp:Button ID="btnEmitirBoleta" runat="server" Text="Emitir" CssClass="btn btn-success" OnClick="btnEmitirBoleta_Click" />
                    </div>
                </div>
            </asp:Panel>

            <asp:Panel ID="pnlFactura" runat="server" Visible="false">
                <div class="form-container">
                    <div class="form-group"><asp:Label ID="lblRUCFactura" runat="server" AssociatedControlID="txtRUCFactura">Registro Único de Contribuyentes</asp:Label><asp:TextBox ID="txtRUCFactura" runat="server" CssClass="form-control"></asp:TextBox></div>
                    <div class="form-group"><asp:Label ID="lblRazonSocial" runat="server" AssociatedControlID="txtRazonSocial">Razón Social</asp:Label><asp:TextBox ID="txtRazonSocial" runat="server" CssClass="form-control"></asp:TextBox></div>
                    <div class="form-group"><asp:Label ID="lblMetodoPago" runat="server" AssociatedControlID="txtMetodoPago">Método de Pago</asp:Label><asp:TextBox ID="txtMetodoPago" runat="server" CssClass="form-control"></asp:TextBox></div>
                    <div class="form-group"><asp:Label ID="lblDireccion" runat="server" AssociatedControlID="txtDireccion">Dirección</asp:Label><asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control"></asp:TextBox></div>
                    <div class="form-group"><asp:Label ID="lblNombresFactura" runat="server" AssociatedControlID="txtNombresFactura">Nombres y Apellidos</asp:Label><asp:TextBox ID="txtNombresFactura" runat="server" CssClass="form-control"></asp:TextBox></div>
                    <div class="igv-container"><asp:Label ID="lblIGVFactura" runat="server" AssociatedControlID="txtIGVFactura">IGV (%):</asp:Label><asp:TextBox ID="txtIGVFactura" runat="server" CssClass="form-control igv-textbox"></asp:TextBox></div>
                </div>
                <h3 class="resumen-header">Resumen</h3>
                <div class="footer-actions">
                    <div class="total-display"><strong>Total: S/. </strong><asp:Label ID="lblTotalFactura" runat="server" Text="0.00"></asp:Label></div>
                    <div class="action-buttons">

                        <asp:LinkButton ID="btnCancelarFactura" runat="server" 
                                CssClass="btn btn-light"
                                PostBackUrl="~/GestionarComprobantes.aspx"> <i class="fa fa-times"></i> Cancelar
                            </asp:LinkButton>

                        <asp:Button ID="btnEmitirFactura" runat="server" Text="Emitir" CssClass="btn btn-success" OnClick="btnEmitirFactura_Click" />
                    </div>
                </div>
            </asp:Panel>

            <asp:Panel ID="pnlNotaCredito" runat="server" Visible="false">
                <div class="form-container">
                    <div class="form-group"><asp:Label ID="lblDNINC" runat="server" AssociatedControlID="txtDNINC">Documento Nacional de Identidad</asp:Label><asp:TextBox ID="txtDNINC" runat="server" CssClass="form-control"></asp:TextBox></div>
                    <div class="form-group"><asp:Label ID="lblRUCNC" runat="server" AssociatedControlID="txtRUCNC">Registro Único de Contribuyentes</asp:Label><asp:TextBox ID="txtRUCNC" runat="server" CssClass="form-control"></asp:TextBox></div>
                    <div class="form-group"><asp:Label ID="lblMotivoNC" runat="server" AssociatedControlID="txtMotivoNC">Motivo Específico</asp:Label><asp:TextBox ID="txtMotivoNC" runat="server" CssClass="form-control"></asp:TextBox></div>
                    <div class="form-group"><asp:Label ID="lblDetalleNC" runat="server" AssociatedControlID="txtDetalleNC">Detalle Modificación</asp:Label><asp:TextBox ID="txtDetalleNC" runat="server" CssClass="form-control"></asp:TextBox></div>
                    <div class="form-group"><asp:Label ID="lblTotalNC" runat="server" AssociatedControlID="txtTotalNC">Total</asp:Label><asp:TextBox ID="txtTotalNC" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox></div>
                    <div class="form-group"><asp:Label ID="lblValorAumentarNC" runat="server" AssociatedControlID="txtValorAumentarNC">Valor a aumentar</asp:Label><asp:TextBox ID="txtValorAumentarNC" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox></div>
                    <div class="igv-container"><asp:Label ID="lblIGVNC" runat="server" AssociatedControlID="txtIGVNC">IGV (%):</asp:Label><asp:TextBox ID="txtIGVNC" runat="server" CssClass="form-control igv-textbox"></asp:TextBox></div>
                </div>
                <h3 class="resumen-header">Resumen</h3>
                <div class="footer-actions">
                    <div class="total-display"><strong>Nuevo Monto: S/. </strong><asp:Label ID="lblNuevoMontoNC" runat="server" Text="0.00"></asp:Label></div>
                    <div class="action-buttons">

                        <asp:LinkButton ID="btnCancelarNC" runat="server" 
                                CssClass="btn btn-light"
                                PostBackUrl="~/GestionarComprobantes.aspx"> <i class="fa fa-times"></i> Cancelar
                            </asp:LinkButton>
                        <asp:Button ID="btnEmitirNC" runat="server" Text="Emitir" CssClass="btn btn-success" OnClick="btnEmitirNC_Click" />
                    </div>
                </div>
            </asp:Panel>

            <asp:Panel ID="pnlNotaDebito" runat="server" Visible="false">
                <div class="form-container">
                    <div class="form-group"><asp:Label ID="lblRUCND" runat="server" AssociatedControlID="txtRUCND">Registro Único de Contribuyentes</asp:Label><asp:TextBox ID="txtRUCND" runat="server" CssClass="form-control"></asp:TextBox></div>
                    <div class="form-group"><asp:Label ID="lblRazonSocialND" runat="server" AssociatedControlID="txtRazonSocialND">Razón Social</asp:Label><asp:TextBox ID="txtRazonSocialND" runat="server" CssClass="form-control"></asp:TextBox></div>
                    <div class="form-group"><asp:Label ID="lblMotivoND" runat="server" AssociatedControlID="txtMotivoND">Motivo específico</asp:Label><asp:TextBox ID="txtMotivoND" runat="server" CssClass="form-control"></asp:TextBox></div>
                    <div class="form-group"><asp:Label ID="lblDetalleND" runat="server" AssociatedControlID="txtDetalleND">Detalle Modificación</asp:Label><asp:TextBox ID="txtDetalleND" runat="server" CssClass="form-control"></asp:TextBox></div>
                    <div class="form-group"><asp:Label ID="lblTotalND" runat="server" AssociatedControlID="txtTotalND">Total</asp:Label><asp:TextBox ID="txtTotalND" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox></div>
                    <div class="form-group"><asp:Label ID="lblValorAumentarND" runat="server" AssociatedControlID="txtValorAumentarND">Valor a aumentar</asp:Label><asp:TextBox ID="txtValorAumentarND" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox></div>
                    <div class="igv-container"><asp:Label ID="lblIGVND" runat="server" AssociatedControlID="txtIGVND">IGV (%):</asp:Label><asp:TextBox ID="txtIGVND" runat="server" CssClass="form-control igv-textbox"></asp:TextBox></div>
                </div>
                <h3 class="resumen-header">Resumen</h3>
                <div class="footer-actions">
                    <div class="total-display"><strong>Nuevo Monto: S/. </strong><asp:Label ID="lblNuevoMontoND" runat="server" Text="0.00"></asp:Label></div>
                    <div class="action-buttons">

                            <asp:LinkButton ID="btnCancelarND" runat="server" 
                                CssClass="btn btn-light"
                                PostBackUrl="~/GestionarComprobantes.aspx"> <i class="fa fa-times"></i> Cancelar
                            </asp:LinkButton>

                        <asp:Button ID="btnEmitirND" runat="server" Text="Emitir" CssClass="btn btn-success" OnClick="btnEmitirND_Click" />
                    </div>
                </div>
            </asp:Panel>
            
        </ContentTemplate>
    </asp:UpdatePanel> <div class="modal fade" id="successModal" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="successModalLabel">Registro Exitoso</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="redirectToManager()"></button>
                </div>
                <div class="modal-body">
                    El comprobante se registró correctamente.
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal" onclick="redirectToManager()">Aceptar</button>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsContent" runat="server">
    
    <script type="text/javascript">
        // 1. Función para MOSTRAR el modal (llamada desde C#)
        function showSuccessModal() {
            var myModal = new bootstrap.Modal(document.getElementById('successModal'));
            myModal.show();
        }

        // 2. Función para REDIRIGIR después de cerrar el modal
        function redirectToManager() {
            // Regresa a la página de la lista
            window.location.href = "GestionarComprobantes.aspx";
        }
    </script>
    
</asp:Content>