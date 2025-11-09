<%@ Page Title="" Language="C#" MasterPageFile="~/WearDrop1.Master" AutoEventWireup="true" CodeBehind="RegistrarRelacionMovimientoLote.aspx.cs" Inherits="WearDropWA.RegistrarRelacionMovimientoLote" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Registrar Movimiento X Lote
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
            flex: 0 0 350px;
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

        .form-container {
            background-color: #FFFFFF;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            margin-top: 30px;
        }

        .form-row-custom {
            display: flex;
            gap: 30px;
            margin-bottom: 25px;
        }

        .form-group-custom {
            flex: 1;
        }

        .form-label-required {
            font-weight: 500;
            color: #333;
            font-size: 14px;
            margin-bottom: 8px;
            display: block;
        }

        .form-label-required::after {
            content: " (*)";
            color: #dc3545;
        }

        .form-control-custom {
            width: 100%;
            padding: 10px 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
            color: #333;
            background-color: #fff;
            transition: border-color 0.3s ease;
        }

        .form-control-custom:focus {
            outline: none;
            border-color: #95B88F;
            box-shadow: 0 0 0 3px rgba(149, 184, 143, 0.1);
        }

        .form-control-custom::placeholder {
            color: #999;
        }

        .form-control-readonly {
            background-color: #F0F0F0;
            cursor: not-allowed;
        }

        .form-group-full {
            width: 100%;
            margin-bottom: 25px;
        }

        .form-textarea-custom {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
            color: #333;
            resize: vertical;
            min-height: 120px;
            font-family: inherit;
        }

        .form-textarea-custom:focus {
            outline: none;
            border-color: #95B88F;
            box-shadow: 0 0 0 3px rgba(149, 184, 143, 0.1);
        }

        .form-textarea-custom::placeholder {
            color: #999;
        }

        .button-container {
            display: flex;
            justify-content: space-between;
            margin-top: 40px;
            padding-top: 20px;
            border-top: 1px solid #E8E8E8;
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

        .btn-custom {
            background-color: #73866D;
            color: #FFFFFF;
            border-color: #73866D;
            padding: 10px 30px;
            border-radius: 4px;
            font-weight: 500;
        }

        .btn-custom-hover {
            background-color: #5f6f5a;
            border-color: #5f6f5a;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
        }

        
        input[type="date"].form-control-custom {
            cursor: pointer;
        }

        input[type="date"].form-control-custom::-webkit-calendar-picker-indicator {
            cursor: pointer;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="container row">
            <div class="row align-items-center">
                <div class="col-md-8 p-0">
                    <div class="header-title">
                        <div class="title-section">
                            <h2>Registrar Relación Movimiento X Lote</h2>
                        </div>
                        <div class="color-bar bar-1"></div>
                        <div class="color-bar bar-2"></div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container row">
            <div class="form-container">
                <!-- Primera fila: ID del Movimiento -->
                <div class="form-row-custom">
                    <div class="form-group-custom">
                        <label class="form-label-required">ID del Movimiento</label>
                        <asp:TextBox ID="txtIdMovimiento" runat="server" CssClass="form-control-custom" placeholder="Ingrese ID"></asp:TextBox>
                    </div>
                    <div class="form-group-custom">
                        <!-- Espacio vacío para mantener el diseño -->
                    </div>
                </div>

                <!-- Segunda fila: Lugar Origen y Lugar Destino -->
                <div class="form-row-custom">
                    <div class="form-group-custom">
                        <label class="form-label-required">Lugar Origen</label>
                        <asp:TextBox ID="txtLugarOrigen" runat="server" CssClass="form-control-custom form-control-readonly" 
                            placeholder="Ingrese lugar de origen" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="form-group-custom">
                        <label class="form-label-required">Lugar Destino</label>
                        <asp:TextBox ID="txtLugarDestino" runat="server" CssClass="form-control-custom form-control-readonly" 
                            placeholder="Ingrese lugar de destino" ReadOnly="true"></asp:TextBox>
                    </div>
                </div>

                <!-- Tercera fila: Fecha y Tipo -->
                <div class="form-row-custom">
                    <div class="form-group-custom">
                        <label class="form-label-required">Fecha</label>
                        <asp:TextBox ID="txtFecha" runat="server" TextMode="Date" CssClass="form-control-custom form-control-readonly" 
                            ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="form-group-custom">
                        <label class="form-label-required">Tipo</label>
                        <asp:TextBox ID="txtTipo" runat="server" CssClass="form-control-custom form-control-readonly" 
                            placeholder="Tipo de movimiento" ReadOnly="true"></asp:TextBox>
                    </div>
                </div>

                <!-- Cuarta fila: ID del Lote -->
                <div class="form-row-custom">
                    <div class="form-group-custom">
                        <label class="form-label-required">ID del Lote</label>
                        <asp:TextBox ID="txtIdLote" runat="server" CssClass="form-control-custom" placeholder="Ingrese ID"></asp:TextBox>
                    </div>
                    <div class="form-group-custom">
                        <!-- Espacio vacío para mantener el diseño -->
                    </div>
                </div>

                <!-- Quinta fila: Descripción -->
                <div class="form-group-full">
                    <label class="form-label-required">Descripción</label>
                    <asp:TextBox ID="txtDescripcion" runat="server" TextMode="MultiLine" CssClass="form-textarea-custom form-control-readonly" 
                        placeholder="Ingrese la descripción" ReadOnly="true"></asp:TextBox>
                </div>

                <!-- Botones -->
                <div class="button-container">
                    <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-secondary-custom" OnClick="btnCancelar_Click" />
                    <asp:Button ID="btnRegistrarRelacion" runat="server" Text="Registrar Relación" CssClass="btn btn-custom btn-custom-hover" OnClick="btnRegistrarRelacion_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script type="text/javascript">
        // Validación del formulario antes de enviar
        function validarFormulario() {
            var idMovimiento = document.getElementById('<%= txtIdMovimiento.ClientID %>').value.trim();
            var idLote = document.getElementById('<%= txtIdLote.ClientID %>').value.trim();

            if (idMovimiento === '') {
                alert('Por favor, ingrese el ID del Movimiento');
                return false;
            }

            if (idLote === '') {
                alert('Por favor, ingrese el ID del Lote');
                return false;
            }

            return true;
        }
    </script>
</asp:Content>
