<%@ Page Title="" Language="C#" MasterPageFile="~/WearDrop1.Master" AutoEventWireup="true" CodeBehind="AnnadirProductoVenta.aspx.cs" Inherits="WearDropWA.AnnadirProductoVenta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    AñadirProducto
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

/* -------------------- Secciones de contenido -------------------- */
.section-container {
    width: 60%;
    margin-left: 0;
    display: flex;
    flex-direction: column;
    gap: 30px;
}

/* Subdivisiones generales */
.subsection {
    background-color: #fff;
    border: 1px solid #dee2e6;
    border-radius: 8px;
    padding: 25px 30px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.05);
    width: 100%;
}

/* 🔹 Etiquetas pequeñas */
.label-title {
    margin-bottom: 12px;
    color: #333;
    font-size: 1rem;
    font-weight: 500;
}

/* 🔹 Separador o subtítulo principal */
.section-title {
    font-size: 1.3rem;
    font-weight: 600;
    color: #333;
}

/* Alineaciones comunes */
.dropdown-container,
.textbox-container {
    display: flex;
    align-items: center;
    gap: 20px;
}

/* Botón rojo */
.btn-red {
    background-color: #dc3545;
    color: white;
    border: none;
    border-radius: 12px;
    padding: 10px 25px;
    font-weight: 500;
    transition: all 0.2s ease-in-out;
}
.btn-red:hover {
    background-color: #bb2d3b;
}

/* TextBox */
.form-control {
    width: 250px;
    text-align: left;
}

/* -------------------- NUEVO CONTENEDOR: Tallas y Precios -------------------- */
.final-section {
    width: 65%;
    margin-top: 15px;
    margin-left: 0;
    background-color: #fff;
    border: 1px solid #dee2e6;
    border-radius: 8px;
    padding: 25px 30px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.05);
}

.two-columns {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    gap: 60px;
    width: 100%;
}

/* 🔹 Sección Tallas */
.size-section {
    display: flex;
    flex-direction: column;
    flex: 1;
    min-width: 350px;
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
    border: 2px solid #000;
    background-color: #fff;
    color: #000;
    font-weight: 600;
    transition: all 0.2s ease-in-out;
    cursor: pointer;
}
.size-btn:hover {
    background-color: #000;
    color: #fff;
}
.size-btn.active {
    background-color: #000;
    color: #fff;
}

/* 🔹 Sección Precios */
.price-section {
    display: flex;
    flex-direction: column;
    flex: 1;
    min-width: 350px;
}

.price-section h3 {
    margin-bottom: 12px;
}

.price-row-horizontal {
    display: flex;
    align-items: center;
    gap: 25px;
    flex-wrap: nowrap;
}

.price-item {
    display: flex;
    align-items: center;
    gap: 8px;
}

.price-item label {
    font-weight: 500;
    color: #333;
}

.price-item .form-control {
    width: 200px; /* 🔹 más grandes que los anteriores */
}


/* 🔹 NUEVO BLOQUE: Cantidad y Subtotal -------------------- */
.quantity-section,
.subtotal-section {
    width: 65%;
    margin-top: 20px;
    margin-left: 0;
    background-color: #fff;
    border: 1px solid #dee2e6;
    border-radius: 8px;
    padding: 25px 30px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.05);
}

/* Contenedor de 2 columnas (Cantidad disponible / requerida) */
.two-columns-quantity {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    gap: 60px;
    width: 100%;
}

/* Subdivisiones internas */
.quantity-sub {
    display: flex;
    flex-direction: column;
    flex: 1;
}

.quantity-sub h3 {
    font-size: 1rem;
    font-weight: 500;
    color: #333;
    margin-bottom: 10px;
}

.quantity-sub .form-control {
    width: 200px;
}

/* 🔹 Subtotal */
.subtotal-section h3 {
    font-size: 1rem;
    font-weight: 500;
    color: #333;
    margin-bottom: 12px;
}

/* Contenedor horizontal de subtotal + botones */
.subtotal-row {
    display: flex;
    align-items: center;
    gap: 20px;
}

/* Botones */
.btn-red {
    background-color: #dc3545;
    color: white;
    border: none;
    border-radius: 12px;
    padding: 10px 25px;
    font-weight: 500;
    transition: all 0.2s ease-in-out;
}
.btn-red:hover {
    background-color: #bb2d3b;
}

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

/* Botones inferiores */
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

<!-- -------------------- TÍTULO PRINCIPAL -------------------- -->
<div class="header-box">
    <h2>Seleccionar Prenda</h2>
    <div class="color-container">
        <div class="color-block block-red"></div>
        <div class="color-block block-lred"></div>
    </div>
</div>

<!-- -------------------- CONTENIDO PRINCIPAL -------------------- -->
<div class="section-container">

    <!-- 🔹 Tipo de Prenda -->
    <div class="subsection">
        <h3 class="label-title">Tipo de Prenda</h3>
        <div class="dropdown-container">
            <asp:DropDownList ID="ddlTipoPrenda" runat="server" CssClass="form-select">
                <asp:ListItem Text="Tipo de prenda" Value=""></asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="btnSeleccionarPrenda" runat="server" Text="Seleccionar Prenda" CssClass="btn btn-red"
                OnClick="btnSeleccionarPrenda_Click"
                />
        </div>
    </div>

    <!-- 🔹 Separador -->
    <div class="subsection">
        <h2 class="section-title">Detalles de la Prenda:</h2>
    </div>

    <!-- 🔹 Nombre de la Prenda -->
    <div class="subsection">
        <h3 class="label-title">Nombre de la Prenda:</h3>
        <div class="textbox-container">
            <asp:TextBox ID="txtNombrePrenda" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
            <asp:Button ID="btnVerPrenda" runat="server" Text="Ver Prenda" CssClass="btn btn-red" />
        </div>
    </div>
</div>

<!-- (Tallas y Precios) -->
<div class="final-section">
    <div class="two-columns">
        <!-- 🟢 SECCIÓN 1: Tallas disponibles -->
        <div class="size-section">
            <h3 class="label-title">Tallas disponibles (*)</h3>
            <div class="size-buttons">
                <button type="button" class="size-btn">XS</button>
                <button type="button" class="size-btn">S</button>
                <button type="button" class="size-btn">M</button>
                <button type="button" class="size-btn">L</button>
                <button type="button" class="size-btn">XL</button>
                <button type="button" class="size-btn">XXL</button>
            </div>
        </div>

        <!-- 🟣 SECCIÓN 2: Precios -->
        <div class="price-section">
            <h3 class="label-title">Precio</h3>
            <div class="price-row-horizontal">
                <div class="price-item">
                    <label>P/U: S/</label>
                    <asp:TextBox ID="txtPrecioUnidad" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                </div>
                <div class="price-item">
                    <label>P/M: S/</label>
                    <asp:TextBox ID="txtPrecioMayor" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                </div>
                <div class="price-item">
                    <label>P/D: S/</label>
                    <asp:TextBox ID="txtPrecioDescuento" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                </div>
            </div>
        </div>
        
    
    
    </div>
</div>

    <!--  Cantidades -->
<div class="quantity-section">
    <div class="two-columns-quantity">
        <!-- Cantidad disponible -->
        <div class="quantity-sub">
            <h3>Cantidad disponible:</h3>
            <asp:TextBox ID="txtCantidadDisponible" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
        </div>

        <!-- Cantidad requerida -->
        <div class="quantity-sub">
            <h3>Cantidad requerida (*):</h3>
            <asp:TextBox ID="txtCantidadRequerida" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
    </div>
</div>

<!-- Subtotal -->
<div class="subtotal-section">
    <h3>Subtotal:</h3>
    <div class="subtotal-row">
        <asp:TextBox ID="txtSubtotal" runat="server" CssClass="form-control" ReadOnly="true" Width="200px"></asp:TextBox>
        <asp:Button ID="btnPromocionesAplicadas" runat="server" Text="Promociones aplicadas" CssClass="btn btn-red" />
        <asp:Button ID="btnDescuentosAplicados" runat="server" Text="Descuentos aplicados" CssClass="btn btn-red" />
    </div>
</div>


    <!-- -------------------- DIV BOTONES INFERIORES -------------------- -->
<div class="container buttons-bottom-container">
    <!-- 🔹 Botón Regresar (izquierda) -->
    <asp:LinkButton 
        ID="btnRegresarAnnadir" 
        runat="server" 
        CssClass="btn btn-danger rounded shadow-sm"
        OnClick="btnRegresarAnnadirProd_Click">
        <i class="fa-solid fa-circle-left"></i> Regresar
    </asp:LinkButton>

    <!-- 🔹 Botón Añadir producto (derecha) -->
    <asp:Button 
        ID="btnAnadirProducto" 
        runat="server" 
        Text="Añadir Producto"
        CssClass="btn btn-danger rounded shadow-sm"
        OnClick="btnAnadirProducto_Click" />
</div>

<script>
    /* Script para marcar el botón seleccionado */
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
