<%@ Page Title="" Language="C#" MasterPageFile="~/WearDrop1.Master" AutoEventWireup="true" CodeBehind="RegistrarMonto.aspx.cs" Inherits="WearDropWA.RegistrarMonto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Registrar Descuento Monto
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

        .form-label {
            font-size: 14px;
            color: #333;
            margin-bottom: 8px;
            display: block;
        }

        .form-control {
            background-color: #F5F5F5;
            border: 1px solid #E0E0E0;
            border-radius: 4px;
            padding: 10px 15px;
        }

        .btn-cancelar {
            background-color: #C5A0A0;
            color: #FFFFFF;
            border: none;
            padding: 10px 30px;
            border-radius: 4px;
            font-size: 14px;
        }

        .btn-registrar {
            background-color: #C5A0A0;
            color: #FFFFFF;
            border: none;
            padding: 10px 30px;
            border-radius: 4px;
            font-size: 14px;
        }

        .btn-cancelar:hover, .btn-registrar:hover {
            background-color: #5f6f5a;
            color: #FFFFFF;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="container row">
            <!-- Header con barras decorativas -->
            <div class="row align-items-center">
                <div class="col-md-6 p-0">
                    <div class="header-title">
                        <div class="title-section">
                            <h2>Modificar Promocion</h2>
                        </div>
                        <div class="color-bar bar-1"></div>
                        <div class="color-bar bar-2"></div>
                    </div>
                </div>
            </div>
        </div>


        <!-- Formulario -->
        <div class="row mt-5">
            <div class="col-md-8">
                <!-- Nombre -->
                <div class="mb-4">
                    <asp:Label ID="lblNombre" runat="server" Text="Nombre " CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" placeholder="Placeholder text"></asp:TextBox>
                </div>

                <!-- Ubicacion -->
                <div class="mb-4">
                    <asp:Label ID="lblMontoEditable" runat="server" Text="Monto Editable" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtMontoEditable" runat="server" CssClass="form-control" placeholder="Placeholder text"></asp:TextBox>
                </div>

                <!-- Stock -->
                <div class="mb-4">
                    <div class="row">
                        <div class="col-md-4">
                            <asp:Label ID="lbMontoMáximo" runat="server" Text="Monto Máximo" CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="txtMontoMáximo" runat="server" CssClass="form-control" placeholder="Placeholder text"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <!-- Botones -->
                <div class="mt-5 d-flex justify-content-between">
                    <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn-cancelar" OnClick="btnCancelar_Click" />
                    <!--Los paramétros estan con registrar, por alguna razón corre.-->
                    <asp:Button ID="btnRegistrar" runat="server" Text="Modificar" CssClass="btn-registrar" OnClick="btnRegistrar_Click" OnClientClick="return confirm('Registro Modificado Correctamente.');"/>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
