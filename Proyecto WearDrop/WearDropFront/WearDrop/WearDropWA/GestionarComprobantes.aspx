<%@ Page Title="Gestionar Comprobantes" Language="C#" MasterPageFile="~/WearDrop1.Master" AutoEventWireup="true" CodeBehind="GestionarComprobantes.aspx.cs" Inherits="WearDropWA.GestionarComprobantes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Gestionar Comprobantes
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .header-comprobantes {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .header-comprobantes h2 {
            margin: 0;
            font-size: 1.5em;
            color: #333;
        }
        .pagination-container {
            text-align: right;
            margin-top: 15px;
        }
    </style>
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="header-comprobantes">
        <h2>Gestionar Comprobantes</h2>
        
        <asp:Button 
            ID="btnIrARegistrar" 
            runat="server" 
            Text="Registrar" 
            CssClass="btn btn-success"
            OnClick="btnIrARegistrar_Click" />
    </div>

                <asp:GridView 
                    ID="gvComprobantes" 
                    runat="server"
                    CssClass="table table-striped table-hover"
                    AutoGenerateColumns="False"
                    AllowPaging="True" 
                    PageSize="10"
                    OnPageIndexChanging="gvComprobantes_PageIndexChanging"
                    ShowHeaderWhenEmpty="true"
                    OnRowCommand="gvComprobantes_RowCommand">  <Columns> <asp:BoundField DataField="ID" HeaderText="ID" />
                        <asp:BoundField DataField="Fecha" HeaderText="Fecha" DataFormatString="{0:d}" />
                        <asp:BoundField DataField="Tipo" HeaderText="Tipo" />
                        <asp:BoundField DataField="Correlativo" HeaderText="Correlativo" />
                        <asp:BoundField DataField="Total" HeaderText="Total" DataFormatString="{0:C}" />
        
                        <asp:TemplateField HeaderText="Acciones">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnEditar" runat="server" 
                                    CssClass="btn btn-sm btn-outline-primary" 
                                    CommandArgument='<%# Eval("ID") %>'
                                    CommandName="Editar">
                                    <i class="fa fa-pencil"></i>
                                </asp:LinkButton>
                
                                <asp:LinkButton ID="btnEliminar" runat="server" 
                                    CssClass="btn btn-sm btn-outline-danger" 
                                    CommandArgument='<%# Eval("ID") %>'
                                    CommandName="Eliminar"
                                    OnClientClick="return showConfirm(this);"> <i class="fa fa-trash"></i>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
    
                    <PagerStyle CssClass="pagination-container" />

                </asp:GridView>

                <div class="modal fade" id="confirmDeleteModal" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="modalLabel">Confirmar Eliminación</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            ¿Estás seguro de borrar este comprobante? Esta acción no se puede deshacer.
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn-secondary-custom" data-bs-dismiss="modal">Cancelar</button>
                
                            <button type="button" id="btnConfirmDelete" class="btn btn-danger" onclick="executeDelete()">Eliminar</button>
                        </div>
                    </div>
                </div>
            </div>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsContent" runat="server">
    
    <script type="text/javascript">
        var _deleteButtonToClick; // Variable global para guardar el botón que se presionó

        // 1. Esta función se llama desde el tachito de basura
        function showConfirm(btn) {
            _deleteButtonToClick = btn; // Guarda el botón

            // Muestra el modal de Bootstrap
            var myModal = new bootstrap.Modal(document.getElementById('confirmDeleteModal'));
            myModal.show();

            // ¡IMPORTANTE! Cancela el postback (el viaje al servidor)
            return false;
        }

        // 2. Esta función se llama desde el botón ROJO "Eliminar" del modal
        function executeDelete() {
            // Ahora sí, hacemos clic "programáticamente" en el botón de basura original
            _deleteButtonToClick.click();
            
            // (El postback se ejecutará y la página se recargará)
        }
    </script>
</asp:Content>