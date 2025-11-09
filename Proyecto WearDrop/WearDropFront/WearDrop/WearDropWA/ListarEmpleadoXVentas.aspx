<%@ Page Title="" Language="C#" MasterPageFile="~/WearDrop1.Master" AutoEventWireup="true" CodeBehind="ListarEmpleadoXVentas.aspx.cs" Inherits="WearDropWA.ListarEmpleadoXVentas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Gestionar Empleados
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        /* ===== Encabezado con barras (coherente con ListarAlmacenes) ===== */
        .header-title{display:flex;align-items:stretch;height:60px;box-shadow:0 2px 4px rgba(0,0,0,.1);}
        .title-section{background:#fff;padding:0 25px;display:flex;align-items:center;flex:0 0 250px;}
        .title-section h2{margin:0;font-size:20px;font-weight:500;color:#333;white-space:nowrap;}
        .color-bar{height:100%;}
        .bar-1{background:#C5D9C0;flex:1.5;}
        .bar-2{background:#95B88F;flex:1.5;}

        /* ===== Caja de filtros (como la tarjeta blanca del mock) ===== */
        .filter-card{background:#fff;border-radius:8px;box-shadow:0 2px 8px rgba(0,0,0,.06);padding:18px;margin-top:16px;}
        .wd-label{font-size:14px;color:#333;margin-bottom:6px;display:block;}
        .wd-control{background:#F5F5F5;border:1px solid #E0E0E0;border-radius:4px;padding:10px 15px;width:100%;}

        /* ===== Botón verde oliva ===== */
        .btn-olive{background:#73866D;color:#fff;border-color:#73866D;}
        .btn-olive:hover{filter:brightness(.95);color:#fff;}

        /* ===== Tabla ===== */
        .custom-grid{width:100%;border-collapse:collapse;background:#fff;}
        .custom-grid th{background:#C5D9C0 !important;color:#333;font-weight:500;padding:14px 18px;text-align:left;border:none;}
        .custom-grid td{padding:12px 18px;border-bottom:1px solid #E8E8E8;}
        .custom-grid tr:nth-child(even){background:#F5F5F5;}
        .custom-grid tr:hover{background:#E8F4E5;}
        .custom-grid a{color:#333;text-decoration:none;margin:0 5px;}

        /* Acciones */
        .grid-actions a{color:#111;}
        .grid-actions i{font-size:1rem;}

        /* Paginación centrada estilo mock */
        .pagination-container{text-align:center;padding:16px 0;}
        .pagination-container a,.pagination-container span{
            display:inline-block;min-width:28px;padding:4px 8px;margin:0 4px;border-radius:6px;background:#eee;color:#333;text-decoration:none;
        }
        .pagination-container span{background:#333;color:#fff;} /* página actual */
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <!-- Título con barras -->
        <div class="row align-items-center">
            <div class="col-md-6 p-0">
                <div class="header-title">
                    <div class="title-section"><h2>Gestionar Empleados</h2></div>
                    <div class="color-bar bar-1"></div>
                    <div class="color-bar bar-2"></div>
                </div>
            </div>
            <div class="col text-end">
                <!-- Botón FILTRAR a la derecha, como en el mock -->
                <asp:LinkButton ID="lkFiltrarTop" runat="server" CssClass="btn btn-olive mt-2" OnClick="lkFiltrarTop_Click">
                    Filtrar
                </asp:LinkButton>
            </div>
        </div>

        <!-- Tarjeta de filtros -->
        <div class="filter-card">
            <div class="row g-3">
                <div class="col-12 col-md-2">
                    <label class="wd-label">ID</label>
                    <asp:TextBox ID="txtFiltroId" runat="server" CssClass="wd-control" placeholder="X"></asp:TextBox>
                </div>
                <div class="col-12 col-md-6">
                    <label class="wd-label">Nombre</label>
                    <asp:TextBox ID="txtFiltroNombre" runat="server" CssClass="wd-control" placeholder="Placeholder text"></asp:TextBox>
                </div>
                <!-- puedes añadir más filtros si lo necesitas -->
            </div>
        </div>

        <!-- Tabla -->
        <div class="row mt-3">
            <div class="col-12">
                <asp:GridView ID="gvEmpleadosDocs" runat="server"
                    CssClass="table table-hover table-striped custom-grid"
                    AutoGenerateColumns="False"
                    GridLines="None"
                    ShowHeaderWhenEmpty="True">

                    <Columns>
                        <asp:BoundField HeaderText="ID" DataField="Id" />
                        <asp:BoundField HeaderText="Fecha" DataField="Fecha" DataFormatString="{0:dd/MM/yyyy}" />
                        <asp:BoundField HeaderText="Monto" DataField="Monto" DataFormatString="{0:C}" />
                        <asp:BoundField HeaderText="Comprobante" DataField="Comprobante" />
                        <asp:BoundField HeaderText="Cliente" DataField="Cliente" />

                        <asp:TemplateField HeaderText="Acciones">
                            <ItemTemplate>
                                <div class="grid-actions">
                                    <a href="#" title="Ver">
                                        <i class="fa-solid fa-eye"></i>
                                    </a>
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
