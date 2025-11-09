<%@ Page Title="" Language="C#" MasterPageFile="~/WearDrop1.Master" AutoEventWireup="true" CodeBehind="SeleccionarPrendaMonto.aspx.cs" Inherits="WearDropWA.SeleccionarPrendaMonto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Seleccionar Prendas
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        /* Estilos generales para la página de selección de prendas */
        .prenda-container {
            margin-top: 30px;
            padding: 20px;
            border: 1px solid #E0E0E0;
            border-radius: 8px;
            background-color: #FFFFFF;
            width: 70%;
        }

        .prenda-container h3 {
            margin-bottom: 20px;
            color: #333;
        }

        .form-field {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
        }

        .form-field label {
            font-size: 14px;
            color: #333;
            width: 150px;
        }

        .form-field select {
            background-color: #F5F5F5;
            border: 1px solid #E0E0E0;
            border-radius: 4px;
            padding: 10px;
            font-size: 14px;
            width: calc(100% - 160px);
        }

        .form-button-container {
            display: flex;
            justify-content: flex-end;
            gap: 20px;
            margin-top: 20px;
        }

        .btn-seleccionar-prendas {
            background-color: #C5A0A0;
            color: white;
            padding: 10px 30px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
        }

        .btn-seleccionar-prendas:hover {
            background-color: #8698a8;
        }

        /* Estilo para el contenedor de opciones */
        .form-field-options {
            margin-top: 20px;
        }

        .form-field-options label {
            font-size: 14px;
            color: #333;
        }

        .form-field-options select {
            width: 100%;
            background-color: #F5F5F5;
            border: 1px solid #E0E0E0;
            border-radius: 4px;
            padding: 10px;
        }

        /* Fondo gris semi-transparente que aparece cuando se selecciona una prenda */
        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5); /* Gris oscuro semitransparente */
            display: none; /* Inicialmente oculto */
            z-index: 999;
        }

        /* Estilo para el contenedor de opciones que aparece sobre el fondo gris */
        .options-container {
            position: relative;
            z-index: 1000; /* Se asegura de que esté por encima del fondo gris */
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <!-- Fondo gris que aparece cuando se selecciona una prenda -->
<div id="overlay" class="overlay" runat="server"></div>
        
        <div class="prenda-container">
            <h3>Seleccionar Prenda</h3>

            <div class="form-field">
                <label for="tipoPrenda">Tipo de Prenda:</label>
                <asp:DropDownList ID="tipoPrenda" runat="server" AutoPostBack="true" OnSelectedIndexChanged="tipoPrenda_SelectedIndexChanged">
                    <asp:ListItem Text="Falda" Value="falda" />
                    <asp:ListItem Text="Casaca" Value="casaca" />
                    <asp:ListItem Text="Polo" Value="polo" />
                    <asp:ListItem Text="Gorro" Value="gorro" />
                    <asp:ListItem Text="Blusa" Value="blusa" />
                    <asp:ListItem Text="Pantalón" Value="pantalon" />
                    <asp:ListItem Text="Vestido" Value="vestido" />
                </asp:DropDownList>
            </div>

            <div class="form-field-options options-container" runat="server" visible="false" id="opcionesPrendaDiv">
                <label>Selecciona la opción para <span id="prendaTitle" runat="server">Falda</span></label>
                <asp:DropDownList ID="opcionesPrenda" runat="server">
                </asp:DropDownList>
            </div>

            <div class="form-button-container">
                <asp:Button ID="btnSeleccionarPrendas" runat="server" Text="Seleccionar Prendas" CssClass="btn-seleccionar-prendas" OnClick="btnSeleccionarPrendas_Click" />
            </div>
        </div>
    </div>
</asp:Content>
