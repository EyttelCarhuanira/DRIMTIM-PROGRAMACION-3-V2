<%@ Page Title="" Language="C#" MasterPageFile="~/WearDrop1.Master" AutoEventWireup="true" CodeBehind="MostrarAlmacen.aspx.cs" Inherits="WearDropWA.MostrarAlmacen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Mostrar Almacen
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .header-title {
            display: flex;
            align-items: stretch;
            height: 60px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            margin-bottom: 20px;
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

        /* Estilos de información del almacén */
        .info-section {
            margin-bottom: 20px;
        }

        .info-label {
            font-weight: 500;
            color: #666;
            font-size: 14px;
            margin-bottom: 5px;
            display: block;
        }

        .info-input {
            width: 100%;
            padding: 10px 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 15px;
            color: #333;
            background-color: #f8f9fa;
            cursor: default;
        }

        .info-input:focus {
            outline: none;
            border-color: #C5D9C0;
            background-color: #fff;
        }

        /* Botones de acción */
        .action-buttons {
            margin-bottom: 20px;
        }

        .btn-action {
            background-color: #73866D;
            color: #FFFFFF;
            border: none;
            padding: 8px 20px;
            border-radius: 4px;
            font-size: 14px;
            margin-right: 10px;
            text-decoration: none;
            display: inline-block;
        }

            .btn-action:hover {
                background-color: #5d6b58;
                color: #FFFFFF;
            }

        /* Pestañas */
        .nav-tabs {
            border-bottom: 2px solid #C5D9C0;
            margin-bottom: 20px;
        }

        .nav-link {
            color: #73866D;
            border: none;
            padding: 10px 20px;
            margin-right: 5px;
            background-color: transparent;
            text-decoration: none;
        }

            .nav-link:hover {
                color: #5d6b58;
                background-color: #f8f9fa;
            }

            .nav-link.active {
                color: #333;
                background-color: #C5D9C0;
                border-radius: 4px 4px 0 0;
                font-weight: 500;
            }

        /* Estilos de tabla */
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

        /* Paginación */
        .pagination {
            margin-top: 20px;
            justify-content: center;
        }

            .pagination .page-link {
                color: #73866D;
                border: 1px solid #C5D9C0;
            }

            .pagination .page-item.active .page-link {
                background-color: #73866D;
                border-color: #73866D;
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
            max-width: 600px;
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

        .info-row {
            display: flex;
            gap: 15px;
            margin-bottom: 15px;
        }

        .info-field {
            flex: 1;
        }

        .info-field-full {
            width: 100%;
            margin-bottom: 15px;
        }

        .modal-body .info-label {
            font-weight: 500;
            color: #666;
            font-size: 14px;
            margin-bottom: 5px;
        }

        .modal-body .info-value {
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

        /* Botón Retroceder */
        .btn-retroceder {
            background-color: #FFFFFF;
            color: #333;
            border: 2px solid #ddd;
            padding: 10px 30px;
            border-radius: 4px;
            font-weight: 500;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
        }

            .btn-retroceder:hover {
                background-color: #f8f9fa;
                border-color: #95B88F;
                color: #73866D;
                transform: translateY(-2px);
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                text-decoration: none;
            }

            .btn-retroceder:active {
                transform: translateY(0);
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            .btn-retroceder:focus {
                text-decoration: none;
            }

        .button-retroceder-container {
            margin-top: 30px;
            margin-bottom: 30px;
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
                        <h2>Gestionar Almacenes</h2>
                    </div>
                    <div class="color-bar bar-1"></div>
                    <div class="color-bar bar-2"></div>
                </div>
            </div>
        </div>

        <!-- Información del Almacén -->
        <div class="row mb-2">
            <div class="col-md-2">
                <div class="info-section">
                    <label class="info-label">Id</label>
                    <asp:TextBox ID="txtId" runat="server" CssClass="info-input" ReadOnly="true"></asp:TextBox>
                </div>
            </div>
            <div class="col-md-5">
                <div class="info-section">
                    <label class="info-label">Nombre</label>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="info-input" ReadOnly="true"></asp:TextBox>
                </div>
            </div>
            <div class="col-md-5">
                <div class="info-section">
                    <label class="info-label">Ubicación</label>
                    <asp:TextBox ID="txtUbicacion" runat="server" CssClass="info-input" ReadOnly="true"></asp:TextBox>
                </div>
            </div>
        </div>

        <!-- Botones de acción -->
        <div class="row action-buttons">
            <div class="col-md-6">
                <asp:LinkButton ID="lkRegistrar" runat="server" CssClass="btn-action" OnClick="lkRegistrar_Click" Text="Registrar" />
                <asp:LinkButton ID="lkFiltrar" runat="server" CssClass="btn-action" OnClick="lkFiltrar_Click" Text="Filtrar" />
            </div>
        </div>

        <!-- Pestañas de navegación -->
        <ul class="nav nav-tabs">
            <li class="nav-item">
                <asp:LinkButton ID="tabLotes" runat="server" CssClass="nav-link active" OnClick="tabLotes_Click" Text="Lotes" />
            </li>
            <li class="nav-item">
                <asp:LinkButton ID="tabMovimientos" runat="server" CssClass="nav-link" OnClick="tabMovimientos_Click" Text="Movimientos" />
            </li>
            <li class="nav-item">
                <asp:LinkButton ID="tabMovimientosXLotes" runat="server" CssClass="nav-link" OnClick="tabMovimientosXLotes_Click" Text="Movimientos X Lotes" />
            </li>
        </ul>

        <!-- Panel de Lotes -->
        <asp:Panel ID="panelLotes" runat="server" Visible="true">
            <asp:GridView ID="gvLotes" runat="server" 
                AutoGenerateColumns="false" 
                ShowHeaderWhenEmpty="True"
                EmptyDataText="No hay lotes disponibles"
                CssClass="table table-hover custom-grid"
                AllowPaging="true" 
                PageSize="5" 
                OnPageIndexChanging="gvLotes_PageIndexChanging"
                GridLines="None">
                <Columns>
                    <asp:BoundField HeaderText="ID Lote" DataField="IdLote" />
                    <asp:BoundField HeaderText="Descripción" DataField="Descripcion" />
                    <asp:TemplateField HeaderText="Acciones">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnModificarLote" runat="server" 
                                Style="margin-right: 25px;" 
                                OnClick="btnModificarLote_Click" 
                                CommandArgument='<%# Eval("IdLote") %>'>
                                <i class='fa-solid fa-pencil'></i>
                            </asp:LinkButton>

                            <asp:LinkButton ID="btnEliminarLote" runat="server" 
                                Style="margin-right: 25px;"
                                CommandArgument='<%# Eval("IdLote") %>'
                                OnClientClick='<%# "mostrarModalLote(" + Eval("IdLote") + ", \"" + Eval("Descripcion") + "\"); return false;" %>'>
                                <i class='fa-solid fa-trash'></i>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerSettings Mode="NumericFirstLast" FirstPageText="Primera" LastPageText="Última" />
                <PagerStyle CssClass="pagination" HorizontalAlign="Center" />
            </asp:GridView>
        </asp:Panel>

        <!-- Panel de Movimientos -->
        <asp:Panel ID="panelMovimientos" runat="server" Visible="false">
            <asp:GridView ID="gvMovimientos" runat="server" 
                AutoGenerateColumns="false" 
                ShowHeaderWhenEmpty="True"
                EmptyDataText="No hay movimientos disponibles"
                CssClass="table table-hover custom-grid"
                AllowPaging="true" 
                PageSize="5" 
                OnPageIndexChanging="gvMovimientos_PageIndexChanging"
                GridLines="None">
                <Columns>
                    <asp:BoundField HeaderText="ID" DataField="IdMovimiento" />
                    <asp:BoundField HeaderText="Destino" DataField="Destino" />
                    <asp:BoundField HeaderText="Origen" DataField="Origen" />
                    <asp:BoundField HeaderText="Tipo" DataField="Tipo" />
                    <asp:BoundField HeaderText="Fecha" DataField="Fecha" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:TemplateField HeaderText="Acciones">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnModificarMovimiento" runat="server" 
                                Style="margin-right: 25px;" 
                                OnClick="btnModificarMovimiento_Click" 
                                CommandArgument='<%# Eval("IdMovimiento") %>'>
                                <i class='fa-solid fa-pencil'></i>
                            </asp:LinkButton>

                            <asp:LinkButton ID="btnEliminarMovimiento" runat="server" 
                                Style="margin-right: 25px;"
                                CommandArgument='<%# Eval("IdMovimiento") %>'
                                OnClientClick='<%# "mostrarModalMovimiento(" + Eval("IdMovimiento") + ", \"" + Eval("Origen") + "\", \"" + Eval("Destino") + "\", \"" + Eval("Tipo") + "\", \"" + Eval("Fecha", "{0:dd/MM/yyyy}") + "\"); return false;" %>'>
                                <i class='fa-solid fa-trash'></i>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerSettings Mode="NumericFirstLast" FirstPageText="Primera" LastPageText="Última" />
                <PagerStyle CssClass="pagination" HorizontalAlign="Center" />
            </asp:GridView>
        </asp:Panel>

        <!-- Panel de Movimientos X Lotes -->
        <asp:Panel ID="panelMovimientosXLotes" runat="server" Visible="false">
            <asp:GridView ID="gvMovimientosXLotes" runat="server" 
                AutoGenerateColumns="false" 
                ShowHeaderWhenEmpty="True"
                EmptyDataText="No hay movimientos por lotes disponibles"
                CssClass="table table-hover custom-grid"
                AllowPaging="true" 
                PageSize="5" 
                OnPageIndexChanging="gvMovimientosXLotes_PageIndexChanging"
                GridLines="None">
                <Columns>
                    <asp:BoundField HeaderText="ID Mov" DataField="IdMovimiento" />
                    <asp:BoundField HeaderText="Tipo" DataField="TipoMovimiento" />
                    <asp:BoundField HeaderText="Destino" DataField="LugarDestino" />
                    <asp:BoundField HeaderText="Origen" DataField="LugarOrigen" />
                    <asp:BoundField HeaderText="ID Lote" DataField="IdLote" />
                    <asp:BoundField HeaderText="Descripción Lote" DataField="DescripcionLote" />
                    <asp:TemplateField HeaderText="Acciones">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnModificarMovimientoXLote" runat="server" 
                                Style="margin-right: 25px;" 
                                OnClick="btnModificarMovimientoXLote_Click" 
                                CommandArgument='<%# Eval("IdMovimiento") %>'>
                                <i class='fa-solid fa-pencil'></i>
                            </asp:LinkButton>

                            <asp:LinkButton ID="btnEliminarMovimientoXLote" runat="server" 
                                Style="margin-right: 25px;"
                                CommandArgument='<%# Eval("IdMovimiento") %>'
                                OnClientClick='<%# "mostrarModalMovimientoXLote(" + Eval("IdMovimiento") + ", \"" + Eval("LugarOrigen") + "\", \"" + Eval("LugarDestino") + "\", \"" + Eval("TipoMovimiento") + "\", \"Fecha\", \"" + Eval("DescripcionLote") + "\"); return false;" %>'>
                                <i class='fa-solid fa-trash'></i>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerSettings Mode="NumericFirstLast" FirstPageText="Primera" LastPageText="Última" />
                <PagerStyle CssClass="pagination" HorizontalAlign="Center" />
            </asp:GridView>
        </asp:Panel>

        <!-- Botón Retroceder -->
        <div class="row button-retroceder-container">
            <div class="col-md-12">
                <asp:LinkButton ID="lkRetroceder" runat="server" 
                    CssClass="btn-retroceder" 
                    OnClick="lkRetroceder_Click" 
                    Text="Retroceder">
                </asp:LinkButton>
            </div>
        </div>
    </div>

    <!-- Modal de Confirmación de Eliminación -->
    <div id="modalEliminar" class="modal-overlay">
        <div class="modal-content">
            <h3 class="modal-title">¿Está seguro de eliminar este registro?</h3>
            <div class="modal-body" id="modalBodyContent">
                <!-- El contenido se generará dinámicamente según la pestaña -->
            </div>
            <div class="modal-buttons">
                <asp:Button ID="btnConfirmarEliminar" runat="server" 
                    CssClass="btn-eliminar" 
                    Text="Eliminar" 
                    OnClick="btnConfirmarEliminar_Click" />
                <button type="button" class="btn btn-secondary-custom" onclick="cerrarModal()">Cancelar</button>
            </div>
            <asp:HiddenField ID="hfIdEliminar" runat="server" />
            <asp:HiddenField ID="hfTipoEliminar" runat="server" />
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script type="text/javascript">
        function mostrarModalLote(idLote, descripcion) {
            var modalBody = document.getElementById('modalBodyContent');
            modalBody.innerHTML = `
                <div class="info-field-full">
                    <div class="info-label">Descripción:</div>
                    <div class="info-value">${descripcion}</div>
                </div>
            `;
            
            document.getElementById('<%= hfIdEliminar.ClientID %>').value = idLote;
            document.getElementById('<%= hfTipoEliminar.ClientID %>').value = 'Lote';
            document.getElementById('modalEliminar').style.display = 'flex';
        }

        function mostrarModalMovimiento(idMovimiento, lugarOrigen, lugarDestino, tipo, fecha) {
            var modalBody = document.getElementById('modalBodyContent');
            modalBody.innerHTML = `
                <div class="info-row">
                    <div class="info-field">
                        <div class="info-label">Lugar Origen:</div>
                        <div class="info-value">${lugarOrigen}</div>
                    </div>
                    <div class="info-field">
                        <div class="info-label">Tipo:</div>
                        <div class="info-value">${tipo}</div>
                    </div>
                </div>
                <div class="info-row">
                    <div class="info-field">
                        <div class="info-label">Lugar Destino:</div>
                        <div class="info-value">${lugarDestino}</div>
                    </div>
                    <div class="info-field">
                        <div class="info-label">Fecha:</div>
                        <div class="info-value">${fecha}</div>
                    </div>
                </div>
            `;
            
            document.getElementById('<%= hfIdEliminar.ClientID %>').value = idMovimiento;
            document.getElementById('<%= hfTipoEliminar.ClientID %>').value = 'Movimiento';
            document.getElementById('modalEliminar').style.display = 'flex';
        }

        function mostrarModalMovimientoXLote(idMovimiento, lugarOrigen, lugarDestino, tipo, fecha, descripcionLote) {
            var modalBody = document.getElementById('modalBodyContent');
            modalBody.innerHTML = `
                <div class="info-row">
                    <div class="info-field">
                        <div class="info-label">Lugar Origen:</div>
                        <div class="info-value">${lugarOrigen}</div>
                    </div>
                    <div class="info-field">
                        <div class="info-label">Lugar Destino:</div>
                        <div class="info-value">${lugarDestino}</div>
                    </div>
                </div>
                <div class="info-row">
                    <div class="info-field">
                        <div class="info-label">Fecha:</div>
                        <div class="info-value">${fecha}</div>
                    </div>
                    <div class="info-field">
                        <div class="info-label">Tipo:</div>
                        <div class="info-value">${tipo}</div>
                    </div>
                </div>
                <div class="info-field-full">
                    <div class="info-label">Descripción del Lote:</div>
                    <div class="info-value">${descripcionLote}</div>
                </div>
            `;
            
            document.getElementById('<%= hfIdEliminar.ClientID %>').value = idMovimiento;
            document.getElementById('<%= hfTipoEliminar.ClientID %>').value = 'MovimientoXLote';
            document.getElementById('modalEliminar').style.display = 'flex';
        }

        function cerrarModal() {
            document.getElementById('modalEliminar').style.display = 'none';
        }
    </script>
</asp:Content>
