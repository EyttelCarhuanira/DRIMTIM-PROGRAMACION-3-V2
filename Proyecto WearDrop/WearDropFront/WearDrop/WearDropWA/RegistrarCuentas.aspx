<%@ Page Title="" Language="C#" MasterPageFile="~/WearDrop1.Master" AutoEventWireup="true" CodeBehind="RegistrarCuentas.aspx.cs" Inherits="WearDropWA.RegistrarCuentas" %>
<asp:Content ID="TitleC" ContentPlaceHolderID="TitleContent" runat="server">
    Registrar Cuenta
</asp:Content>

<asp:Content ID="HeadC" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        /* Encabezado con barras rosadas */
        .header-title{display:flex;align-items:stretch;height:60px;box-shadow:0 2px 4px rgba(0,0,0,.1);}
        .title-section{background:#fff;padding:0 25px;display:flex;align-items:center;flex:0 0 250px;}
        .title-section h2{margin:0;font-size:20px;font-weight:500;color:#333;white-space:nowrap;}
        .color-bar{height:100%;}
        .bar-1{background:#D9B7B7;flex:1.5;}  /* claro */
        .bar-2{background:#B98888;flex:1.5;}  /* oscuro */

        /* Campos */
        .form-label{font-size:14px;color:#333;margin-bottom:6px;display:block;}
        .form-control{background:#F5F5F5;border:1px solid #E0E0E0;border-radius:4px;padding:10px 15px;font-size:14px;}
        .form-select{background:#F5F5F5;border:1px solid #E0E0E0;border-radius:4px;padding:10px 15px;font-size:14px;}

        /* Botones */
        .btn-rose{background:#A67B7B;color:#fff;border:none;padding:10px 26px;border-radius:6px;font-size:14px;}
        .btn-rose:hover{background:#946c6c;color:#fff;}
        .btn-ghost{background:#E6D0D0;color:#5b4a4a;border:none;padding:10px 26px;border-radius:6px;font-size:14px;}
        .btn-ghost:hover{background:#d8c1c1;color:#4a3b3b;}

        /* Tarjeta blanca del formulario */
        .form-card{background:#fff;border-radius:8px;box-shadow:0 2px 8px rgba(0,0,0,.06);padding:22px;}
    </style>
</asp:Content>

<asp:Content ID="MainC" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <!-- Header -->
        <div class="row align-items-center">
            <div class="col-md-6 p-0">
                <div class="header-title">
                    <div class="title-section"><h2>Registrar Cuenta</h2></div>
                    <div class="color-bar bar-1"></div>
                    <div class="color-bar bar-2"></div>
                </div>
            </div>
        </div>

        <!-- Formulario -->
        <div class="row mt-4">
            <div class="col-12 form-card">
                <div class="row g-4">
                    <!-- ID -->
                    <div class="col-12 col-md-3">
                        <asp:Label ID="lblId" runat="server" Text="ID" CssClass="form-label"></asp:Label>
                        <asp:TextBox ID="txtId" runat="server" CssClass="form-control" Enabled="false" placeholder="X"></asp:TextBox>
                    </div>

                    <!-- User y Password -->
                    <div class="col-12 col-md-6">
                        <asp:Label ID="lblUser" runat="server" Text="User Name (*)" CssClass="form-label"></asp:Label>
                        <asp:TextBox ID="txtUser" runat="server" CssClass="form-control" placeholder="Placeholder text"></asp:TextBox>
                    </div>
                    <div class="col-12 col-md-6">
                        <asp:Label ID="lblPass" runat="server" Text="Contraseña (*)" CssClass="form-label"></asp:Label>
                        <asp:TextBox ID="txtPass" runat="server" TextMode="Password" CssClass="form-control" placeholder="Placeholder text"></asp:TextBox>
                    </div>

                    <!-- Email y TipoCuenta -->
                    <div class="col-12 col-md-6">
                        <asp:Label ID="lblEmail" runat="server" Text="Email (*)" CssClass="form-label"></asp:Label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Placeholder text"></asp:TextBox>
                    </div>
                    <div class="col-12 col-md-6">
                        <asp:Label ID="lblTipo" runat="server" Text="TipoCuenta (*)" CssClass="form-label"></asp:Label>
                        <asp:DropDownList ID="ddlTipoCuenta" runat="server" CssClass="form-select">
                        </asp:DropDownList>
                    </div>
                </div>

                <!-- Botones -->
                <div class="mt-5 d-flex justify-content-between">
                    <asp:Button ID="btnRegresar" runat="server" Text="Regresar" CssClass="btn-ghost" OnClick="btnRegresar_Click" />
                    <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" CssClass="btn-rose" OnClick="btnRegistrar_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="ScriptsC" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
