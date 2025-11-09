<%@ Page Title="" Language="C#" MasterPageFile="~/WearDrop1.Master" AutoEventWireup="true" CodeBehind="ListarCuentas.aspx.cs" Inherits="WearDropWA.ListarCuentas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Gestionar Cuentas
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        /* ===== Encabezado con barras rojizas ===== */
        .header-title{display:flex;align-items:stretch;height:60px;box-shadow:0 2px 4px rgba(0,0,0,.1);}
        .title-section{background:#fff;padding:0 25px;display:flex;align-items:center;flex:0 0 250px;}
        .title-section h2{margin:0;font-size:20px;font-weight:500;color:#333;white-space:nowrap;}
        .color-bar{height:100%;}
        .bar-1{background:#D9C0C0;flex:1.5;} /* rosado claro */
        .bar-2{background:#B88F8F;flex:1.5;} /* rosado oscuro */

        /* ===== Botones superiores ===== */
        .btn-rose{background:#A67B7B;color:#fff;border-color:#A67B7B;}
        .btn-rose:hover{filter:brightness(.9);color:#fff;}

        /* ===== Tabla ===== */
        .custom-grid{width:100%;border-collapse:collapse;background:#fff;}
        .custom-grid th{
            background:#D9C0C0 !important;color:#333;font-weight:500;
            padding:14px 18px;text-align:left;border:none;
        }
        .custom-grid td{padding:12px 18px;border-bottom:1px solid #E8E8E8;}
        .custom-grid tr:nth-child(even){background:#F5F5F5;}
        .custom-grid tr:hover{background:#F8ECEC;}
        .custom-grid a{color:#333;text-decoration:none;margin:0 5px;}

        /* Acciones */
        .grid-actions a{color:#111;}
        .grid-actions i{font-size:1rem;}

        /* Paginación centrada estilo WearDrop */
        .pagination-container{text-align:center;padding:16px 0;}
        .pagination-container a,.pagination-container span{
            display:inline-block;min-width:28px;padding:4px 8px;margin:0 4px;
            border-radius:6px;background:#eee;color:#333;text-decoration:none;
        }
        .pagination-container span{background:#333;color:#fff;}
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <!-- Encabezado -->
        <div class="row align-items-center">
            <div class="col-md-6 p-0">
                <div class="header-title">
                    <div class="title-section"><h2>Gestionar Cuentas</h2></div>
                    <div class="color-bar bar-1"></div>
                    <div class="color-bar bar-2"></div>
                </div>
            </div>
            <div class="col text-end p-3">
                <asp:LinkButton ID="lkRegistrar" runat="server" CssClass="btn btn-rose me-2" OnClick="lkRegistrar_Click">
                    Registrar
                </asp:LinkButton>
                <asp:LinkButton ID="lkFiltrar" runat="server" CssClass="btn btn-rose" OnClick="lkFiltrar_Click">
                    Filtrar
                </asp:LinkButton>
            </div>
        </div>

        <!-- Tabla -->
        <div class="row mt-3">
            <div class="col-12">
                <asp:GridView ID="gvCuentas" runat="server"
                    CssClass="table table-hover table-striped custom-grid"
                    AutoGenerateColumns="False"
                    GridLines="None"
                    ShowHeaderWhenEmpty="True">

                    <Columns>
                        <asp:BoundField HeaderText="ID" DataField="IdCuenta" />
                        <asp:BoundField HeaderText="User Name" DataField="UserName" />
                        <asp:BoundField HeaderText="Email" DataField="Email" />
                        <asp:BoundField HeaderText="Empleado" DataField="Empleado" />

                        <asp:TemplateField HeaderText="Acciones">
                            <ItemTemplate>
                                <div class="grid-actions">
                                    <asp:LinkButton ID="btnEditar" runat="server" CommandName="Editar" CommandArgument='<%# Eval("IdCuenta") %>' ToolTip="Editar"
                                        OnClick="btnEditar_Click">
                                        <i class="fa-solid fa-pen"></i>
                                    </asp:LinkButton>

                                    <asp:LinkButton ID="btnEliminar" runat="server" CommandName="Eliminar" CommandArgument='<%# Eval("IdCuenta") %>'
                                        OnClientClick="return confirm('¿Está seguro de eliminar esta cuenta?');" ToolTip="Eliminar">
                                        <i class="fa-solid fa-trash"></i>
                                    </asp:LinkButton>

                                    <asp:LinkButton ID="btnVer" runat="server" CommandName="Ver" CommandArgument='<%# Eval("IdCuenta") %>' ToolTip="Ver"
                                        OnClick="btnVer_Click">
                                        <i class="fa-solid fa-eye"></i>
                                    </asp:LinkButton>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>

                    <PagerStyle CssClass="pagination-container" />
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
