<%@ Page Title="" Language="C#" MasterPageFile="~/WearDrop1.Master" AutoEventWireup="true" CodeBehind="ListarAlmacenes.aspx.cs" Inherits="WearDropWA.ListarAlmacenes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Listar Almacenes
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .header-title {
            display: flex;
            align-items: stretch;
            height: 60px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .title-section {
            background-color: #FFFFFF;
            padding: 0 25px;
            display: flex;
            align-items: center;
            flex: 0 0 250px;
        }

            .title-section h2 {
                margin: 0;
                font-size: 20px;
                font-weight: 500;
                color: #333;
                white-space: nowrap;
            }

        .color-bar {
            height: 100%;
        }

        .bar-1 {
            background-color: #C5D9C0;
            flex: 1.5;
        }

        .bar-2 {
            background-color: #95B88F;
            flex: 1.5;
        }

        .custom-grid {
            border-collapse: collapse;
            width: 100%;
        }

            .custom-grid th {
                background-color: #C5D9C0 !important;
                color: #333333;
                font-weight: 500;
                padding: 15px 20px;
                text-align: left;
                border: none;
            }

            .custom-grid td {
                padding: 12px 20px;
                border-bottom: 1px solid #E8E8E8;
            }

            .custom-grid tr:nth-child(even) {
                background-color: #F5F5F5;
            }

            .custom-grid tr:hover {
                background-color: #E8F4E5;
            }

            .custom-grid a {
                color: #333;
                text-decoration: none;
                margin: 0 5px;
            }

        /* Estilos del Modal */
        .modal-overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 1000;
            justify-content: center;
            align-items: center;
        }

        .modal-content {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
            max-width: 500px;
            width: 90%;
        }

        .modal-title {
            font-size: 20px;
            font-weight: 600;
            margin-bottom: 20px;
            color: #333;
            text-align: center;
        }

        .modal-body {
            margin-bottom: 25px;
        }

        .info-field {
            margin-bottom: 15px;
        }

        .info-label {
            font-weight: 500;
            color: #666;
            font-size: 14px;
            margin-bottom: 5px;
        }

        .info-value {
            background-color: #f0f0f0;
            padding: 10px;
            border-radius: 4px;
            color: #333;
        }

        .modal-buttons {
            display: flex;
            justify-content: center;
            gap: 15px;
        }

        .btn-eliminar {
            background-color: #dc3545;
            color: white;
            border: none;
            padding: 10px 30px;
            border-radius: 4px;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

            .btn-eliminar:hover {
                background-color: #c82333;
            }

        .btn-secondary-custom {
            background-color: #FFFFFF;
            color: #333;
            border: 2px solid #ddd;
            padding: 10px 30px;
            border-radius: 4px;
            font-weight: 500;
            transition: all 0.3s ease;
        }

            .btn-secondary-custom:hover {
                background-color: #f8f9fa;
                border-color: #95B88F;
                color: #73866D;
              
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .btn-secondary-custom:active {
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);        
            }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="container row">
            <div class="row align-items-center">
                <div class="col-md-6 p-0">
                    <div class="header-title">
                        <div class="title-section">
                            <h2>Gestionar Almacenes</h2>
                        </div>
                        <div class="color-bar bar-1"></div>
                        <div class="color-bar bar-2"></div>
                    </div>
                </div>
                <div class="col text-end p-3">
                    <asp:LinkButton ID="lkRegistrar" CssClass="btn" Style="background-color: #73866D; color: #FFFFFF; border-color: #73866D; margin-right: 20px" runat="server" OnClick="lkRegistrar_Click" Text="Registrar Almacen" />
                </div>
            </div>
        </div>

        <div class="container row mt-4">
            <asp:GridView ID="gvAlmacenes" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="True"
                CssClass="table table-hover table-striped custom-grid" HeaderStyle-BackColor="#C5D9C0"
                HeaderStyle-ForeColor="#333333"
                HeaderStyle-Font-Bold="false"
                HeaderStyle-Height="40px"
                RowStyle-BackColor="#FFFFFF"
                AlternatingRowStyle-BackColor="#F5F5F5"
                GridLines="None">

                <Columns>
                    <asp:BoundField HeaderText="Id" DataField="IdAlmacen" />
                    <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                    <asp:BoundField HeaderText="Ubicacion" DataField="Ubicacion" />
                    <asp:BoundField HeaderText="Stock" DataField="Stock" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="btnModificar" runat="server" Style="margin-right: 25px;" OnClick="btnModificar_Click" CommandArgument='<%# Eval("IdAlmacen") %>'>
                                <i class='fa-solid fa-pencil'></i>
                            </asp:LinkButton>

                            <asp:LinkButton ID="btnEliminar" runat="server" Style="margin-right: 25px;"
                                CommandArgument='<%# Eval("IdAlmacen") %>'
                                OnClientClick='<%# "mostrarModal(" + Eval("IdAlmacen") + ", \"" + Eval("Nombre") + "\"); return false;" %>'>
                                <i class='fa-solid fa-trash'></i>
                            </asp:LinkButton>

                            <asp:LinkButton ID="btnVisualizar" runat="server" OnClick="btnVisualizar_Click"
                                CommandArgument='<%# Eval("IdAlmacen") %>'>
                                <i class='fa-solid fa-eye'></i>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>

    <!-- Modal de Confirmación -->
    <div id="modalEliminar" class="modal-overlay">
        <div class="modal-content">
            <h3 class="modal-title">¿Está seguro de eliminar este registro?</h3>
            <div class="modal-body">
                <div class="info-field">
                    <div class="info-label">Nombre:</div>
                    <div class="info-value" id="modalNombre"></div>
                </div>
            </div>
            <div class="modal-buttons">
                <asp:Button ID="btnConfirmarEliminar" runat="server" 
                    CssClass="btn-eliminar" 
                    Text="Eliminar" 
                    OnClick="btnConfirmarEliminar_Click" />
                <button type="button" class="btn btn-secondary-custom" onclick="cerrarModal()">Cancelar</button>
            </div>
            <asp:HiddenField ID="hfIdAlmacenEliminar" runat="server" />
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script type="text/javascript">
        function mostrarModal(idAlmacen, nombre) {
            document.getElementById('modalNombre').innerText = nombre;
            document.getElementById('<%= hfIdAlmacenEliminar.ClientID %>').value = idAlmacen;
            document.getElementById('modalEliminar').style.display = 'flex';
        }

        function cerrarModal() {
            document.getElementById('modalEliminar').style.display = 'none';
        }

        // Cerrar modal si se hace clic fuera de él
        window.onclick = function (event) {
            var modal = document.getElementById('modalEliminar');
            if (event.target == modal) {
                cerrarModal();
            }
        }
    </script>
</asp:Content>
