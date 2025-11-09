<%@ Page Title="" Language="C#" MasterPageFile="~/WearDrop1.Master" AutoEventWireup="true" CodeBehind="RegistrarVentaFactura.aspx.cs" Inherits="WearDropWA.RegistrarVentaFactura" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">

    Registrar Factura

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        /* 🔹 Caja del título */
        .header-box {
            border: 1px solid #ddd;
            background-color: #f8f9fa;
            height: 75px;
            display: flex;
            justify-content: space-between;
            align-items: stretch;
            width: 60%;
            padding-left: 20px;
            border-radius: 10px;
            margin-bottom: 30px;
        }

        .header-box h2 {
            margin: 0;
            color: #333;
            font-size: 1.5rem;
            display: flex;
            align-items: center;
        }

        .color-container {
            display: flex;
            align-items: stretch;
        }

        /* 🔹 Mantener colores rojos */
        .color-block {
            width: 100px;
            flex: none;
        }
        .block-red { background-color: #ff6b6b; }
        .block-lred { background-color: #FFA2A2; }

        /* 🔹 Panel de formulario */
        .form-container {
            width: 60%;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 25px 35px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
        }

        .form-group { margin-bottom: 1.25rem; }

        .form-container h4 {
            font-size: 1.2rem;
            font-weight: 600;
            color: #808080;
            border-bottom: 1px solid #eee;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }

        /* 🔹 Bloque de resumen */
        .summary-box {
            width: 60%;
            background-color: #fff;
            border: 1px solid #dee2e6;
            border-radius: 10px;
            padding: 25px 35px;
            margin-top: 25px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
        }

        .summary-box h4 {
            font-size: 1.1rem;
            font-weight: 600;
            color: #333;
            margin-bottom: 20px;
        }

        .summary-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 1rem;
        }

        /* 🔹 Botones inferiores */
        .buttons-bottom-container {
            width: 60%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 30px;
            padding: 15px 25px;
            border-radius: 12px;
        }

        .buttons-bottom-container .btn {
            font-weight: 500;
            padding: 10px 25px;
            border-radius: 12px;
            background-color: #dc3545;
            border: none;
            color: white;
            transition: all 0.2s ease-in-out;
        }

        .buttons-bottom-container .btn:hover {
            background-color: #bb2d3b;
        }

        .igv-row {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .igv-row label {
            margin-bottom: 0;
            font-weight: 500;
        }
    </style>

    <!-- 🔹 TÍTULO PRINCIPAL -->
    <div class="header-box">
        <h2>Registrar Factura</h2>
        <div class="color-container">
            <div class="color-block block-red"></div>
            <div class="color-block block-lred"></div>
        </div>
    </div>

    <!-- 🔹 PANEL DE FACTURA -->
    <div class="form-container">
        <h4>Datos de Factura</h4>

        <div class="form-group">
            <label>Registro Único de Contribuyentes (RUC)</label>
            <asp:TextBox ID="txtRUC" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Razón Social</label>
            <asp:TextBox ID="txtRazonSocial" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Método de Pago</label>
            <asp:DropDownList ID="ddlMetodoPago" runat="server" CssClass="form-control">
                <asp:ListItem Text="Efectivo" Value="Efectivo"></asp:ListItem>
                <asp:ListItem Text="Tarjeta" Value="Tarjeta"></asp:ListItem>
                <asp:ListItem Text="Transferencia" Value="Transferencia"></asp:ListItem>
            </asp:DropDownList>
        </div>

        <div class="form-group">
            <label>Dirección</label>
            <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Nombres y Apellidos</label>
            <asp:TextBox ID="txtNombresApellidos" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="form-group igv-row">
            <label>IGV (%):</label>
            <asp:TextBox ID="txtIGV" runat="server" CssClass="form-control" Style="width:100px;"></asp:TextBox>
        </div>
    </div>

    <!-- 🔹 BLOQUE DE RESUMEN -->
    <div class="summary-box">
        <h4>Resumen</h4>
        <div class="summary-row">
            <span>Total:</span>
            <strong>S/ <asp:Label ID="lblTotal" runat="server" Text="0.00"></asp:Label></strong>
        </div>
    </div>

    <!-- 🔹 BOTONES INFERIORES -->
    <div class="buttons-bottom-container">
        <asp:LinkButton ID="btnRegresar" runat="server" CssClass="btn" OnClick="btnRegresar_Click">
            <i class="fa-solid fa-circle-left"></i> Regresar
        </asp:LinkButton>

        <asp:Button ID="btnRegistrarFactura" runat="server" Text="Registrar Venta" CssClass="btn" OnClick="btnRegistrarVenta_Click" />
    </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
