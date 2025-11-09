<%@ Page Title="" Language="C#" MasterPageFile="~/WearDrop1.Master" AutoEventWireup="true" CodeBehind="ListarCombo.aspx.cs" Inherits="WearDropWA.ListarCombo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Listar Monto
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
            background-color: #DFBCBC;
            flex: 1.5;
        }

        .bar-2 {
            background-color: #C5A0A0;
            flex: 1.5;
        }
        .custom-grid {
        border-collapse: collapse;
        width: 100%;
    }
    
    .custom-grid th {
        background-color: #DFBCBC !important;
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
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="container row">
            <div class="row align-items-center">
                <!-- Columna del título -->
                <!-- Título con barras decorativas -->
                <div class="col-md-6 p-0">
                    <div class="header-title">
                        <div class="title-section">
                            <h2>Gestionar Promociones Combo</h2>
                        </div>
                        <div class="color-bar bar-1"></div>
                        <div class="color-bar bar-2"></div>
                    </div>
                </div>
                <div class="col text-end p-3">
                    <asp:LinkButton ID="lkRegistrar" CssClass="btn" Style="background-color:  #C5A0A0; color: #FFFFFF; border-color: #73866D; margin-right: 20px" runat="server" OnClick="lkRegistrar_Click" Text="Registrar Descuento" />
                    <asp:LinkButton ID="lkFiltrar" CssClass="btn" Style="background-color:  #C5A0A0; color: #FFFFFF; border-color: #73866D" runat="server" OnClick="lkFiltrar_Click" Text="Filtrar" />
                </div>
            </div>
        </div>
        <div class="container row mt-4">
            <!--Indica que el control será procesado en el servidor y no por el cliente (navegador)
            AutoGenerateColumns sirve para colocar todos los datos de la fuente de datos, incluyendo activo.
            CssClass sirve para darle estilos (En este caso estilos de Bootstrap)-->
            <asp:GridView ID="gvMonto" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="True"
                CssClass="table table-hover table-striped custom-grid" HeaderStyle-BackColor="#C5D9C0"
                HeaderStyle-ForeColor="#333333"
                HeaderStyle-Font-Bold="false"
                HeaderStyle-Height="40px"
                RowStyle-BackColor="#FFFFFF"
                AlternatingRowStyle-BackColor="#F5F5F5"
                GridLines="None">
                
                <Columns>
                    <asp:BoundField HeaderText="ID" DataField="ID"/>
                    <asp:BoundField HeaderText="Nombre" DataField="Nombre"/>
                    <asp:BoundField HeaderText="Cantidad Gratis" DataField="Cantidad Gratis"/>
                    <asp:BoundField HeaderText="Cantidad Requerida" DataField="Cantidad Requerida"/>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="btnModificar" runat="server" Style="margin-right: 25px;" OnClick="btnModificar_Click" CommandArgument='<%# Eval("ID") %>'>
                                <i class='fa-solid fa-pencil'></i>
                            </asp:LinkButton>

                            <asp:LinkButton ID="btnEliminar" runat="server" Style="margin-right: 25px;"
                                OnClick="btnEliminar_Click"
                                CommandArgument='<%# Eval("ID") %>'
                                OnClientClick="return confirm('¿Está seguro de eliminar este registro?');">
                                <i class='fa-solid fa-trash'></i>
                            </asp:LinkButton>

                            <asp:LinkButton ID="btnVisualizar" runat="server" OnClick="btnVisualizar_Click" CommandArgument='<%# Eval("Id") %>'>
                                <i class='fa-solid fa-eye'></i>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
