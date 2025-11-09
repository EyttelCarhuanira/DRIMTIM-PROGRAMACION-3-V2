<%@ Page Title="" Language="C#" MasterPageFile="~/WearDrop1.Master" AutoEventWireup="true" CodeBehind="ListarEmpleados.aspx.cs" Inherits="WearDropWA.ListarEmpleados" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Gestionar Empleados
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        /* ======== ENCABEZADO CON BARRAS ======== */
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

        /* ======== TABLA ======== */
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

        /* ======== BOTONES ======== */
        .btn-custom {
            background-color: #73866D;
            color: #FFFFFF;
            border-color: #73866D;
        }

        .btn-custom:hover {
            filter: brightness(0.95);
            color: #FFFFFF;
        }

        .pagination-container {
            text-align: center;
            margin-top: 15px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="container row">
            <div class="row align-items-center">
                <!-- Columna del título -->
                <div class="col-md-6 p-0">
                    <div class="header-title">
                        <div class="title-section">
                            <h2>Gestionar Empleados</h2>
                        </div>
                        <div class="color-bar bar-1"></div>
                        <div class="color-bar bar-2"></div>
                    </div>
                </div>

                <!-- Botones de acción -->
                <div class="col text-end p-3">
                    <asp:LinkButton ID="lkRegistrarEmpleado" runat="server" CssClass="btn btn-custom me-3"
                        OnClick="lkRegistrarEmpleado_Click" Text="Registrar" />
                    <asp:LinkButton ID="lkFiltrarEmpleado" runat="server" CssClass="btn btn-custom"
                        OnClick="lkFiltrarEmpleado_Click" Text="Filtrar" />
                </div>
            </div>
        </div>

        <!-- Tabla de empleados -->
        <div class="container row mt-4">
            <asp:GridView ID="gvEmpleados" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="True"
                CssClass="table table-hover table-striped custom-grid"
                HeaderStyle-BackColor="#C5D9C0"
                HeaderStyle-ForeColor="#333333"
                HeaderStyle-Font-Bold="False"
                HeaderStyle-Height="40px"
                RowStyle-BackColor="#FFFFFF"
                AlternatingRowStyle-BackColor="#F5F5F5"
                GridLines="None">

                <Columns>
                    <asp:BoundField HeaderText="ID" DataField="IdEmpleado" />
                    <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                    <asp:BoundField HeaderText="Apellidos" DataField="Apellidos" />
                    <asp:BoundField HeaderText="DNI" DataField="Dni" />
                    <asp:BoundField HeaderText="Sueldo" DataField="Sueldo" DataFormatString="{0:C}" />

                    <asp:TemplateField HeaderText="Acciones">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnEditar" runat="server"
                                CssClass="me-2"
                                CommandName="Editar"
                                CommandArgument='<%# Eval("IdEmpleado") %>'
                                OnClick="btnEditar_Click">
                                <i class="fa-solid fa-pen"></i>
                            </asp:LinkButton>

                            <asp:LinkButton ID="btnEliminar" runat="server"
                                CssClass="me-2"
                                CommandName="Eliminar"
                                CommandArgument='<%# Eval("IdEmpleado") %>'
                                OnClientClick="return confirm('¿Está seguro de eliminar este registro?');">
                                <i class="fa-solid fa-trash"></i>
                            </asp:LinkButton>

                            <asp:LinkButton ID="btnVer" runat="server"
                                CommandName="Ver"
                                CommandArgument='<%# Eval("IdEmpleado") %>'
                                OnClick="btnVer_Click">
                                <i class="fa-solid fa-eye"></i>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

                <PagerStyle CssClass="pagination-container" />
            </asp:GridView>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
