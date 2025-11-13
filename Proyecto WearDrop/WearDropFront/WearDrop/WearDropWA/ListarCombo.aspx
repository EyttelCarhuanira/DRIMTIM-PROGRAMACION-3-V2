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
                a, a:visited, a:hover, a:active, .btn-wd { text-decoration:none !important; color:inherit }

.btn-wd {
    background:var(--btn); color:#fff; border:none; padding:8px 18px;
    border-radius:8px; cursor:pointer; display:inline-block; transition:.15s;
    box-shadow:0 1px 2px rgba(0,0,0,.08)
}
.btn-outline-success i {
    color: #28a745; /* Verde */
}

.btn-outline-primary i {
    color: #007bff; /* Azul */
}

.btn-outline-danger i {
    color: #dc3545; /* Rojo */
}
.btn-wd:hover { filter:brightness(.95) }
.btn-wd:active { transform:translateY(1px) }

/* ===== Tonos ===== */


.theme-scope .bar-1 { background:var(--tone-1); }
.theme-scope .bar-2 { background:var(--tone-2); }
.theme-scope .custom-grid th { background:var(--tone-2) !important; color:#333; }
.theme-scope .btn-wd { background:var(--tone-3); color:#fff; }
.theme-scope .btn-wd:hover { filter:brightness(.95); }
.theme-scope .top-accent { background:linear-gradient(90deg,var(--tone-1),var(--tone-2),var(--tone-3)); }

/* ===== Botones de acción estilo Bootstrap ===== */
.action-btns i { font-size:1.1em; }
.btn-sm { padding:4px 8px !important; margin-right:4px; }
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
                    <asp:BoundField HeaderText="IdPromocion" DataField="IdPromocion"/>
                    <asp:BoundField HeaderText="Nombre" DataField="Nombre"/>
                    <asp:BoundField HeaderText="Cantidad Gratis" DataField="Cantidad Gratis"/>
                    <asp:BoundField HeaderText="Cantidad Requerida" DataField="Cantidad Requerida"/>
                    <asp:TemplateField HeaderText="Acciones">
                        <ItemTemplate>
                           <%-- <asp:LinkButton ID="btnModificar" runat="server" Style="margin-right: 25px;" OnClick="btnModificar_Click" CommandArgument='<%# Eval("ID") %>'>
                                <i class='fa-solid fa-pencil'></i>
                            </asp:LinkButton>

                            <asp:LinkButton ID="btnEliminar" runat="server" Style="margin-right: 25px;"
                                OnClick="btnEliminar_Click"
                                CommandArgument='<%# Eval("IdPromocion") %>'
                                OnClientClick="return confirm('¿Está seguro de eliminar este registro?');">
                                <i class='fa-solid fa-trash'></i>
                            </asp:LinkButton>

                            <asp:LinkButton ID="btnVisualizar" runat="server" OnClick="btnVisualizar_Click" CommandArgument='<%# Eval("Id") %>'>
                                <i class='fa-solid fa-eye'></i>
                            </asp:LinkButton>--%>
                                                                                                                <div class="action-btns">
    <asp:LinkButton ID="btnVisualizar" runat="server"
        CssClass="btn btn-sm btn-outline-success"
        CommandArgument='<%# Eval("IdPromocion") %>'
        OnClick="btnVisualizar_Click"
        ToolTip="Visualizar">
        <i class="fa fa-eye"></i>
    </asp:LinkButton>

    <asp:LinkButton ID="btnModificar" runat="server"
        CssClass="btn btn-sm btn-outline-primary"
        CommandArgument='<%# Eval("IdPromocion") %>'
        OnClick="btnModificar_Click"
        ToolTip="Editar">
        <i class="fa fa-pencil"></i>
    </asp:LinkButton>

    <asp:LinkButton ID="btnEliminar" runat="server"
        CssClass="btn btn-sm btn-outline-danger"
        CommandArgument='<%# Eval("IdPromocion") %>'
        OnClick="btnEliminar_Click"
        OnClientClick="return showConfirm(this);"
        ToolTip="Eliminar">
        <i class="fa fa-trash"></i>
    </asp:LinkButton>
</div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
