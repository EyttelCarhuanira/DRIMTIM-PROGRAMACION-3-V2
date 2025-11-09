<%@ Page Title="" Language="C#" MasterPageFile="~/WearDrop1.Master" AutoEventWireup="true" CodeBehind="RegistroVentaResumenVenta.aspx.cs" Inherits="WearDropWA.RegistroVentaResumenVenta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Registrar Venta


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <style>
/* -------------------- Caja del título -------------------- */
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
    margin-right: 20px;
}

/* -------------------- Bloques de color -------------------- */
.color-container {
    display: flex;
    align-items: stretch;
    gap: 0;
}
.color-block {
    width: 100px;
    flex: none;
}
.block-red {
    background-color: #ff6b6b;
}
.block-lred {
    background-color: #FFA2A2;
}

/* -------------------- Contenedor principal -------------------- */
.section-container {
    width: 60%;
    margin-left: 0;
    display: flex;
    flex-direction: column;
    gap: 30px;
}

/* -------------------- Subdivisiones generales -------------------- */
.subsection {
    background-color: #fff;
    border: 1px solid #dee2e6;
    border-radius: 8px;
    padding: 25px 30px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.05);
    width: 100%;
}

/* 🔹 Filas con dos columnas */
.two-columns {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    gap: 60px;
    width: 100%;
}

.field-block {
    display: flex;
    flex-direction: column;
    flex: 1;
}

.field-block h3 {
    font-size: 1rem;
    font-weight: 500;
    color: #333;
    margin-bottom: 10px;
}

/* 🔹 TextBox y Dropdown */
.form-control {
    width: 250px;
    text-align: left;
}

/* 🔹 Botones inferiores */
.buttons-bottom-container {
    width: 100%;
    max-width: 100%;
    border: 1px #dee2e6;
    border-radius: 6px;
    margin-top: 20px;
    padding: 15px 30px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.buttons-bottom-container .btn {
    font-weight: 400;
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

.buttons-bottom-container .btn i {
    margin-right: 6px;
}
</style>

<!-- -------------------- ENCABEZADO -------------------- -->
<div class="header-box">
    <h2 id="lblTitulo" runat="server">Registrar Venta</h2>
    <div class="color-container">
        <div class="color-block block-red"></div>
        <div class="color-block block-lred"></div>
    </div>
</div>

<!-- -------------------- CONTENIDO PRINCIPAL -------------------- -->
<div class="section-container">

    <!-- 🔹 FILA 1 -->
    <div class="subsection">
        <div class="two-columns">
            <div class="field-block">
                <h3>ID Venta</h3>
                <asp:TextBox ID="txtIDVenta" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="field-block">
                <h3>DNI del Cliente (*)</h3>
                <asp:TextBox ID="txtDNICliente" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
    </div>

    <!-- 🔹 FILA 2 -->
    <div class="subsection">
        <div class="two-columns">
            <div class="field-block">
                <h3>ID Empleado</h3>
                <asp:TextBox ID="txtIDEmpleado" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="field-block">
                <h3>Usuario del Empleado</h3>
                <asp:TextBox ID="txtUsuarioEmpleado" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
    </div>

    <!-- 🔹 FILA 3 -->
    <div class="subsection">
        <div class="two-columns">
            <div class="field-block">
                <h3>Fecha</h3>
                <asp:TextBox ID="txtFecha" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
            </div>
            <div class="field-block">
                <h3>Monto Total</h3>
                <asp:TextBox ID="txtMontoTotal" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
    </div>

    <!-- 🔹 Tipo de comprobante -->
    <div class="subsection">
        <h3>Tipo de Comprobante (*)</h3>
        <asp:DropDownList ID="ddlTipoComprobante" runat="server" CssClass="form-select form-control">
            <asp:ListItem Text="Boleta" Value="Boleta"></asp:ListItem>
            <asp:ListItem Text="Factura" Value="Factura"></asp:ListItem>
        </asp:DropDownList>
    </div>

</div>

<!-- -------------------- BOTONES INFERIORES -------------------- -->
<div class="container buttons-bottom-container">

    <asp:LinkButton 
        ID="btnRegresarVenta" 
        runat="server" 
        CssClass="btn btn-danger rounded shadow-sm"
        OnClick="btnRegresarVenta_Click">
        <i class="fa-solid fa-circle-left"></i> Regresar
    </asp:LinkButton>


    <asp:Button 
        ID="btnRegistrarComprobante" 
        runat="server" 
        Text="Registrar Comprobante"
        CssClass="btn btn-danger rounded shadow-sm"
        OnClick="btnRegistrarComprobante_Click" />
</div>


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
