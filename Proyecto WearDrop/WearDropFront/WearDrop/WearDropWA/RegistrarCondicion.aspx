<%@ Page Title="" Language="C#" MasterPageFile="~/WearDrop1.Master" AutoEventWireup="true" CodeBehind="RegistrarCondicion.aspx.cs" Inherits="WearDropWA.RegistrarCondicion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Registrar Condición

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
    width: 60%;
    border: 1px #dee2e6;
    border-radius: 6px;
    margin-top: 20px;
    padding: 15px 0;
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
    background-color: #146c43; /* tono más oscuro */
}

.buttons-bottom-container .btn i {
    margin-right: 6px;
}
</style>

<!-- -------------------- ENCABEZADO -------------------- -->
<div class="header-box">
    <h2 id="lblTitulo" runat="server">Registrar Condición</h2>
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
                <asp:TextBox ID="txtIDCondicion" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="field-block">
                <h3>ID Proveedor</h3>
                <asp:TextBox ID="txtIDProveedor" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
            </div>
        </div>
    </div>

    <!-- 🔹 FILA 2 -->
    <div class="subsection">
        <div class="two-columns">
            <div class="field-block">
                <h3>Número de días (*)</h3>
                <asp:TextBox ID="txtNumeroDias" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="field-block">
                <h3>Descripción (*)</h3>
                <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
    </div>
</div>

<!-- -------------------- BOTONES INFERIORES -------------------- -->
<div class="buttons-bottom-container">
    <asp:LinkButton 
        ID="btnRegresar" 
        runat="server" 
        CssClass="btn rounded shadow-sm"
        OnClick="btnRegresar_Click">
        <i class="fa-solid fa-circle-left"></i> Regresar
    </asp:LinkButton>

    <asp:Button 
        ID="btnRegistrarCondicion" 
        runat="server" 
        Text="Registrar"
        CssClass="btn rounded shadow-sm"
        OnClick="btnRegistrarCondicion_Click" />
</div>


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
