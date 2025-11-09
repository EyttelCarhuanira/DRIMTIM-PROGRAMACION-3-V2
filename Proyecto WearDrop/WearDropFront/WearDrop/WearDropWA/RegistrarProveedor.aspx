<%@ Page Title="" Language="C#" MasterPageFile="~/WearDrop1.Master" AutoEventWireup="true" CodeBehind="RegistrarProveedor.aspx.cs" Inherits="WearDropWA.RegistrarProveedor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">

    Registrar Proveedor

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
.block-green-dark {
    background-color: #198754; /* verde oscuro */
}
.block-green-light {
    background-color: #A4E6A4; /* verde claro */
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

/* 🔹 Una sola columna */
.one-column {
    display: flex;
    flex-direction: column;
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

/* 🔹 TextBox */
.form-control {
    width: 250px;
    text-align: left;
}

/* -------------------- Botones inferiores -------------------- */
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
    background-color: #198754; /* verde oscuro */
    border: none;
    color: white;
    transition: all 0.2s ease-in-out;
}

.buttons-bottom-container .btn:hover {
    background-color: #146c43; /* tono más oscuro al pasar el mouse */
}

.buttons-bottom-container .btn i {
    margin-right: 6px;
}

/* -------------------- Botón de añadir condiciones -------------------- */
.btn-add {
    background-color: #198754;
    color: white;
    border-radius: 8px;
    border: none;
    padding: 8px 18px;
    transition: all 0.2s ease-in-out;
}

.btn-add:hover {
    background-color: #146c43;
}
</style>

<!-- -------------------- ENCABEZADO -------------------- -->
<div class="header-box">
    <h2 id="lblTitulo" runat="server">Registrar Proveedor</h2>
    <div class="color-container">
        <div class="color-block block-green-light"></div>
        <div class="color-block block-green-dark"></div>
    </div>
</div>

<!-- -------------------- CONTENIDO PRINCIPAL -------------------- -->
<div class="section-container">

    <!-- 🔹 FILA 1 -->
    <div class="subsection">
        <div class="two-columns">
            <div class="field-block">
                <h3>ID</h3>
                <asp:TextBox ID="txtIDProveedor" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="field-block">
                <h3>Nombre (*)</h3>
                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
    </div>

    <!-- 🔹 FILA 2 -->
    <div class="subsection">
        <div class="two-columns">
            <div class="field-block">
                <h3>Dirección (*)</h3>
                <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="field-block">
                <h3>RUC (*)</h3>
                <asp:TextBox ID="txtRUC" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
    </div>

    <!-- 🔹 FILA 3 -->
    <div class="subsection">
        <div class="one-column">
            <div class="field-block">
                <h3>Teléfono (*)</h3>
                <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
    </div>

    <!-- 🔹 CONDICIONES DE PAGO -->
    <div class="subsection">
        <div class="two-columns">
            <div class="field-block">
                <h3>Condiciones de pago:</h3>
            </div>
            <div class="field-block" style="display:flex; align-items:center; justify-content:flex-end;">
                <asp:Button 
                    ID="btnAñadirCondiciones" 
                    runat="server"
                    Text="Añadir condiciones de pago"
                    CssClass="btn-add shadow-sm"
                    OnClick="btnAñadirCondiciones_Click" />
            </div>
        </div>
    </div>

</div>

<!-- -------------------- BOTONES INFERIORES -------------------- -->
<div class="container buttons-bottom-container">

    <asp:LinkButton 
        ID="btnRegresar" 
        runat="server" 
        CssClass="btn rounded shadow-sm"
        OnClick="btnRegresar_Click">
        <i class="fa-solid fa-circle-left"></i> Regresar
    </asp:LinkButton>

    <asp:Button 
        ID="btnRegistrarProveedor" 
        runat="server" 
        Text="Registrar"
        CssClass="btn rounded shadow-sm"
        OnClick="btnRegistrarProveedor_Click" />
</div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
