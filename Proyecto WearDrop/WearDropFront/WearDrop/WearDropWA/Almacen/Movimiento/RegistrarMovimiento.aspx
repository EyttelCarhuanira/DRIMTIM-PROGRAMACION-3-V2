<%@ Page Title="" Language="C#" MasterPageFile="~/WearDrop1.Master" AutoEventWireup="true" CodeBehind="RegistrarMovimiento.aspx.cs" Inherits="WearDropWA.RegistrarMovimiento" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Registrar Movimiento
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

        /* Estilos para formulario */
        .form-label {
            font-weight: 500;
            color: #333;
            margin-bottom: 8px;
            font-size: 15px;
        }
        

        .required {
            color: #dc3545;
        }

        .form-control, .form-select {
            padding: 10px 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }
        .form-control-short {
            max-width: 250px;
        }

            .form-control:focus, .form-select:focus {
                border-color: #95B88F;
                box-shadow: 0 0 0 0.2rem rgba(149, 184, 143, 0.25);
                outline: none;
            }

        /* Botones */
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
            margin-top: 40px;
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
                        <h2>Registrar Movimiento</h2>
                    </div>
                    <div class="color-bar bar-1"></div>
                    <div class="color-bar bar-2"></div>
                </div>
            </div>
        </div>

        <!-- Formulario -->
        <div class="row">
            <div class="col-md-12">
                <!-- Fila 1: Lugar Destino y Lugar Origen -->
                <div class="row mb-4">
                    <div class="col-md-6">
                        <label class="form-label">
                            Lugar de Destino <span class="required">(*)</span>
                        </label>
                        <asp:TextBox ID="txtLugarDestino" runat="server"
                            CssClass="form-control"
                            placeholder="Placeholder text"
                            MaxLength="100">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvLugarDestino" runat="server"
                            ControlToValidate="txtLugarDestino"
                            ErrorMessage="El lugar de destino es obligatorio"
                            CssClass="text-danger"
                            Display="Dynamic">
                        </asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">
                            Lugar de Origen <span class="required">(*)</span>
                        </label>
                        <asp:TextBox ID="txtLugarOrigen" runat="server"
                            CssClass="form-control"
                            placeholder="Placeholder text"
                            MaxLength="100">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvLugarOrigen" runat="server"
                            ControlToValidate="txtLugarOrigen"
                            ErrorMessage="El lugar de origen es obligatorio"
                            CssClass="text-danger"
                            Display="Dynamic">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>

                <!-- Fila 2: Fecha del Traslado y Tipo -->
                <div class="row mb-4">
                    <div class="col-md-6">
                        <label class="form-label">
                            Fecha del Traslado <span class="required">(*)</span>
                        </label>
                        <asp:TextBox ID="txtFechaTraslado" runat="server"
                            CssClass="form-control form-control-short"
                            TextMode="Date"
                            placeholder="Placeholder text">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvFechaTraslado" runat="server"
                            ControlToValidate="txtFechaTraslado"
                            ErrorMessage="La fecha es obligatoria"
                            CssClass="text-danger"
                            Display="Dynamic">
                        </asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">
                            Tipo <span class="required">(*)</span>
                        </label>
                        <asp:DropDownList ID="ddlTipo" runat="server" CssClass="form-select">
                            <asp:ListItem Value="">Value</asp:ListItem>
                            <asp:ListItem Value="Entrada">Entrada</asp:ListItem>
                            <asp:ListItem Value="Salida">Salida</asp:ListItem>
                            <asp:ListItem Value="Mov.Interno">Mov.Interno</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvTipo" runat="server"
                            ControlToValidate="ddlTipo"
                            InitialValue=""
                            ErrorMessage="Debe seleccionar un tipo"
                            CssClass="text-danger"
                            Display="Dynamic">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>

                <!-- Botones -->
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
                        <asp:LinkButton ID="lkRegistrar" runat="server"
                            CssClass="btn btn-custom"
                            OnClick="lkRegistrar_Click"
                            Text="Registrar">
                        </asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
