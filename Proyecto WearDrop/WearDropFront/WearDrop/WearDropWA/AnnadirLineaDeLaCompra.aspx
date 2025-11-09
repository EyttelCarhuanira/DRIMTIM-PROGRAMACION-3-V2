<%@ Page Title="" Language="C#" MasterPageFile="~/WearDrop1.Master" AutoEventWireup="true" CodeBehind="AnnadirLineaDeLaCompra.aspx.cs" Inherits="WearDropWA.AnnadirLineaDeLaCompra" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">


    Añadir Línea de la Compra

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
    color: #0d3b66; /* azul oscuro */
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
.block-blue-dark {
    background-color: #0d3b66;
}
.block-blue-light {
    background-color: #a7c7e7;
}

/* -------------------- Secciones -------------------- */
.section-container {
    width: 60%;
    margin-left: 0;
    display: flex;
    flex-direction: column;
    gap: 30px;
}

/* Subdivisiones */
.subsection {
    background-color: #fff;
    border: 1px solid #dee2e6;
    border-radius: 8px;
    padding: 25px 30px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.05);
    width: 100%;
}

/* Etiquetas */
.label-title {
    margin-bottom: 12px;
    color: #0d3b66;
    font-size: 1rem;
    font-weight: 500;
}

/* Contenedores */
.row-container {
    display: flex;
    justify-content: space-between;
    gap: 50px;
    width: 100%;
}

.col {
    flex: 1;
}

/* Botones principales */
.btn-blue {
    background-color: #0d3b66;
    color: white;
    border: none;
    border-radius: 12px;
    padding: 10px 25px;
    font-weight: 500;
    transition: all 0.2s ease-in-out;
}
.btn-blue:hover {
    background-color: #0b3155;
}

/* TextBox y DropDownList */
.form-control, .form-select {
    width: 100%;
    text-align: left;
}

/* -------------------- Botones de tallas -------------------- */
.size-section {
    display: flex;
    flex-direction: column;
}
.size-buttons {
    display: flex;
    flex-wrap: wrap;
    gap: 15px;
    margin-top: 10px;
}
.size-btn {
    width: 45px;
    height: 45px;
    border-radius: 50%;
    border: 2px solid #0d3b66;
    background-color: #fff;
    color: #0d3b66;
    font-weight: 600;
    transition: all 0.2s ease-in-out;
    cursor: pointer;
}
.size-btn:hover,
.size-btn.active {
    background-color: #0d3b66;
    color: #fff;
}

/* -------------------- Botones inferiores -------------------- */
.buttons-bottom-container {
    width: 100%;
    max-width: 100%;
    border-radius: 6px;
    margin-top: 30px;
    padding: 15px 30px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.buttons-bottom-container .btn {
    font-weight: 400;
    padding: 10px 25px;
    border-radius: 12px;
    background-color: #0d3b66;
    border: none;
    color: white;
    transition: all 0.2s ease-in-out;
}
.buttons-bottom-container .btn:hover {
    background-color: #0b3155;
}
.buttons-bottom-container .btn i {
    margin-right: 6px;
}
</style>

<!-- -------------------- TÍTULO PRINCIPAL -------------------- -->
<div class="header-box">
    <h2>Añadir Línea de la Compra</h2>
    <div class="color-container">
        <div class="color-block block-blue-light"></div>
        <div class="color-block block-blue-dark"></div>
    </div>
</div>

<!-- -------------------- TIPO DE PRENDA -------------------- -->
<div class="subsection">
    <div class="row-container">
        <div class="col">
            <h3 class="label-title">Tipo de Prenda</h3>
            <asp:DropDownList ID="ddlTipoPrenda" runat="server" CssClass="form-select">
                <asp:ListItem Text="Seleccionar tipo de prenda" Value=""></asp:ListItem>
            </asp:DropDownList>
        </div>

        <div class="col" style="display: flex; align-items: flex-end;">
            <asp:Button ID="btnSeleccionarPrenda" runat="server" Text="Seleccionar Prenda" CssClass="btn-blue" />
        </div>
    </div>
</div>

<!-- -------------------- NOMBRE DE LA PRENDA -------------------- -->
<div class="subsection">
    <div class="row-container">
        <div class="col">
            <h3 class="label-title">Nombre de la Prenda</h3>
            <asp:TextBox ID="txtNombrePrenda" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
        </div>

        <div class="col" style="display: flex; align-items: flex-end;">
            <asp:Button ID="btnVerPrenda" runat="server" Text="Ver Prenda" CssClass="btn-blue" />
        </div>
    </div>
</div>

<!-- -------------------- TALLAS -------------------- -->
<div class="subsection size-section">
    <h3 class="label-title">Talla (*)</h3>
    <div class="size-buttons">
        <button type="button" class="size-btn">XS</button>
        <button type="button" class="size-btn">S</button>
        <button type="button" class="size-btn">M</button>
        <button type="button" class="size-btn">L</button>
        <button type="button" class="size-btn">XL</button>
        <button type="button" class="size-btn">XXL</button>
    </div>
</div>

<!-- -------------------- ID LOTE Y PRECIO -------------------- -->
<div class="subsection">
    <div class="row-container">
        <div class="col">
            <h3 class="label-title">ID de Lote (*)</h3>
            <asp:TextBox ID="txtIDLote" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="col">
            <h3 class="label-title">Precio del Lote (*)</h3>
            <asp:TextBox ID="txtPrecioLote" runat="server" CssClass="form-control"></asp:TextBox>
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
        ID="btnAnadirLinea" 
        runat="server" 
        Text="Añadir Línea"
        CssClass="btn rounded shadow-sm"
        OnClick="btnAnadirLinea_Click" />
</div>

<!-- -------------------- SCRIPT ACTIVADOR DE TALLAS -------------------- -->
<script>
document.addEventListener("DOMContentLoaded", () => {
    const buttons = document.querySelectorAll(".size-btn");
    buttons.forEach(btn => {
        btn.addEventListener("click", () => {
            buttons.forEach(b => b.classList.remove("active"));
            btn.classList.add("active");
        });
    });
});
</script>



</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
