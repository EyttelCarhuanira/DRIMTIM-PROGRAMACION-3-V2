<%@ Page Title="" Language="C#" MasterPageFile="~/WearDrop1.Master" AutoEventWireup="true" CodeBehind="ModificarLote.aspx.cs" Inherits="WearDropWA.ModificarLote" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Modificar Lote
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
   .header-title {
       display: flex;
       align-items: stretch;
       height: 60px;
       box-shadow: 0 2px 4px rgba(0,0,0,0.1);
       margin-bottom:10px;
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

        /* Estilos para campos de información */
        .info-section {
            background-color: #f8f9fa;
            padding: 15px;
            border-radius: 4px;
            margin-bottom: 20px;
        }

        .info-label {
            font-weight: 500;
            color: #666;
            font-size: 14px;
            margin-bottom: 5px;
        }

        .info-value {
            color: #333;
            font-size: 15px;
        }
        .info-value-desc {
            color: #333;
            font-size: 15px;
            max-height: 200px
        }
        .form-control {
            padding: 10px 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
            width: 100%;
        }

        .form-control-desc {
            max-height: 300px;
            width: 600px;
            resize: vertical;
        }

        .form-control:focus {
            border-color: #95B88F;
            box-shadow: 0 0 0 0.2rem rgba(149, 184, 143, 0.25);
            outline: none;
        }

        /* Botones de filtro */
        .filter-buttons {
            margin-top: 0;
            margin-bottom: 5px;
        }

        .btn-filter {
            background-color: #73866D;
            color: #FFFFFF;
            border: none;
            padding: 8px 20px;
            border-radius: 4px;
            font-size: 14px;
            margin-right: 10px;
        }

        .btn-filter:hover {
            background-color: #5d6b58;
            color: #FFFFFF;
        }

        /* Estilos para la tabla personalizada */
        .custom-grid {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
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

        /* Paginación*/
        .pagination-container {
            display: flex;
            justify-content: center;
            margin-top: 30px;
            margin-bottom: 20px;
        }

        .custom-pagination {
            display: flex;
            list-style: none;
            padding: 0;
            margin: 0;
            gap: 8px;
        }

        .custom-pagination .page-item {
            display: inline-block;
        }

        .custom-pagination .page-link {
            display: flex;
            align-items: center;
            justify-content: center;
            min-width: 40px;
            height: 40px;
            padding: 8px 12px;
            background-color: #FFFFFF;
            border: 1px solid #C5D9C0;
            border-radius: 6px;
            color: #73866D;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .custom-pagination .page-link:hover {
            background-color: #E8F4E5;
            border-color: #95B88F;
            color: #5d6b58;
            transform: translateY(-2px);
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .custom-pagination .page-item.active .page-link {
            background-color: #73866D;
            border-color: #73866D;
            color: #FFFFFF;
            font-weight: 600;
            box-shadow: 0 3px 6px rgba(115, 134, 109, 0.3);
        }

        .custom-pagination .page-item.disabled .page-link {
            background-color: #f8f9fa;
            border-color: #dee2e6;
            color: #6c757d;
            cursor: not-allowed;
            opacity: 0.5;
        }

        .custom-pagination .page-item.disabled .page-link:hover {
            transform: none;
            box-shadow: none;
        }

        /* Botones principales */
        .btn-custom {
            background-color: #73866D;
            color: #FFFFFF;
            border-color: #73866D;
            padding: 10px 30px;
            border-radius: 4px;
            font-weight: 500;
        }

        .btn-custom:hover {
            background-color: #5d6b58;
            border-color: #5d6b58;
            color: #FFFFFF;
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
                transform: translateY(-2px);
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .btn-secondary-custom:active {
                transform: translateY(0);
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

        .button-group {
            margin-top: 30px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <!-- Header con título -->
        <div class="row">
            <div class="col-md-6 p-0">
                <div class="header-title">
                    <div class="title-section">
                        <h2>Modificar Lote</h2>
                    </div>
                    <div class="color-bar bar-1"></div>
                    <div class="color-bar bar-2"></div>
                </div>
            </div>
        </div>

        <!-- Información del contexto -->
        <div class="row">
            <div class="col-md-3">
                <div class="info-section">
                    <div class="info-label">Nombre del Almacén</div>
                    <div class="info-value">
                        <asp:Label ID="lblNombreAlmacen" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="info-section">
                    <div class="info-label">Descripción Lote</div>
                    <div class="info-value">
                        <asp:TextBox ID="txtDescripcionLote" runat="server"
                            CssClass="form-control form-control-desc"
                            TextMode="MultiLine"
                            Rows="3"
                            placeholder="Ingrese la descripción del lote"
                            MaxLength="200">
                        </asp:TextBox>
                    </div>
                </div>
            </div>
        </div>

        <!-- Botones de filtro -->
        <div class="row filter-buttons">
            <div class="col-md-12">
                <asp:Button ID="btnAñadirPrenda" runat="server" 
                    CssClass="btn btn-filter" 
                    Text="Añadir Prenda" 
                    OnClick="btnAñadirPrenda_Click" />
                <asp:Button ID="btnFiltrarPrenda" runat="server" 
                    CssClass="btn btn-filter" 
                    Text="Filtrar Prenda" 
                    OnClick="btnFiltrarPrenda_Click" />
            </div>
        </div>

        <!-- GridView de Prendas -->
        <div class="row">
            <div class="col-md-12">
                <asp:GridView ID="gvPrendas" runat="server" 
                    AutoGenerateColumns="false" 
                    ShowHeaderWhenEmpty="True"
                    EmptyDataText="No hay prendas en este lote"
                    CssClass="table table-hover custom-grid"
                    AllowPaging="true" 
                    PageSize="5" 
                    OnPageIndexChanging="gvPrendas_PageIndexChanging"
                    GridLines="None"
                    PagerSettings-Mode="NumericFirstLast"
                    PagerSettings-Position="Bottom">
                    <Columns>
                        <asp:BoundField HeaderText="ID" DataField="IdPrenda" />
                        <asp:BoundField HeaderText="Nombre de la Prenda" DataField="NombrePrenda" />
                        <asp:BoundField HeaderText="Color" DataField="Color" />
                        <asp:BoundField HeaderText="Material" DataField="Material" />
                        <asp:BoundField HeaderText="Stock" DataField="Stock" />
                        <asp:BoundField HeaderText="Talla" DataField="Talla" />
                        <asp:TemplateField HeaderText="Acciones">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnModificar" runat="server" 
                                    OnClick="btnModificar_Click" 
                                    CommandArgument='<%# Eval("IdPrenda") %>'
                                    ToolTip="Modificar">
                                    <i class='fa-solid fa-pencil'></i>
                                </asp:LinkButton>
                                <asp:LinkButton ID="btnEliminar" runat="server" 
                                    OnClick="btnEliminar_Click" 
                                    CommandArgument='<%# Eval("IdPrenda") %>'
                                    OnClientClick="return confirm('¿Está seguro de eliminar esta prenda del lote?');"
                                    ToolTip="Eliminar">
                                    <i class='fa-solid fa-trash ms-3'></i>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle CssClass="pagination-container" HorizontalAlign="Center" />
                    <PagerTemplate>
                        <PagerTemplate>
                            <div class="pagination-container">
                                <ul class="custom-pagination">
                                    <!-- Primera página -->
                                    <li class="page-item">
                                        <asp:LinkButton ID="lnkFirst" runat="server"
                                            CssClass="page-link"
                                            CommandName="Page"
                                            CommandArgument="First"
                                            Text="1">
                                        </asp:LinkButton>
                                    </li>

                                    <!-- Página 2 -->
                                    <li class="page-item">
                                        <asp:LinkButton ID="lnkPage2" runat="server"
                                            CssClass="page-link"
                                            CommandName="Page"
                                            CommandArgument="2"
                                            Text="2">
                                        </asp:LinkButton>
                                    </li>

                                    <!-- Página 3 -->
                                    <li class="page-item">
                                        <asp:LinkButton ID="lnkPage3" runat="server"
                                            CssClass="page-link"
                                            CommandName="Page"
                                            CommandArgument="3"
                                            Text="3">
                                        </asp:LinkButton>
                                    </li>
                                </ul>
                            </div>
                        </pagertemplate>
                    </PagerTemplate>
                </asp:GridView>
            </div>
        </div>

        <!-- Botones principales -->
        <div class="row button-group">
            <div class="col-md-6">
                <asp:LinkButton ID="lkCancelar" runat="server" 
                    CssClass="btn btn-secondary-custom" 
                    OnClick="lkCancelar_Click"
                    CausesValidation="false"
                    Text="Cancelar">
                </asp:LinkButton>
            </div>
            <div class="col-md-6 text-end">
                <asp:LinkButton ID="lkGuardar" runat="server" 
                    CssClass="btn btn-custom" 
                    OnClick="lkGuardar_Click"
                    Text="Guardar">
                </asp:LinkButton>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>