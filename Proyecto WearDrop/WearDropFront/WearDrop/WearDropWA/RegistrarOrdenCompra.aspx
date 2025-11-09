<%@ Page Title="" Language="C#" MasterPageFile="~/WearDrop1.Master" AutoEventWireup="true" CodeBehind="RegistrarOrdenCompra.aspx.cs" Inherits="WearDropWA.RegistrarOrdenCompra" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">

    Registrar Orden de Compra

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
    background-color: #0d3b66; /* azul oscuro */
}
.block-blue-light {
    background-color: #a7c7e7; /* azul claro */
}

/* -------------------- Contenedores superiores -------------------- */
.section-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 40px;
}

/* -------------------- Botón añadir línea -------------------- */
.btn-add {
    background-color: #0d3b66; /* azul oscuro */
    color: white;
    border-radius: 8px;
    border: none;
    padding: 8px 18px;
    transition: all 0.2s ease-in-out;
}
.btn-add:hover {
    background-color: #0b3155; /* azul más oscuro */
}

/* -------------------- Estilos de la grilla -------------------- */
.grid-border {
    border: 1px solid #dee2e6;
    border-radius: 6px;
    overflow: hidden;
}

.grid-header th {
    background-color: #a7c7e7 !important; /* azul claro */
    color: #0d3b66 !important;
    text-align: center;
}

.grid-border td {
    vertical-align: middle;
    text-align: center;
}

/* -------------------- Paginador -------------------- */
.custom-pager {
    display: flex !important;
    justify-content: center;
    align-items: center;
    gap: 10px;
    border: none !important;
    background: none !important;
    margin-top: 25px;
    margin-bottom: 40px;
}
.custom-pager a,
.custom-pager span {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 36px;
    height: 36px;
    border-radius: 50%;
    border: 1px solid #ccc;
    color: #000;
    background-color: #fff;
    text-decoration: none;
    transition: all 0.2s ease-in-out;
}
.custom-pager a:hover {
    background-color: #e0f0ff;
    border-color: #0d3b66;
}
.custom-pager span {
    background-color: #0d3b66;
    color: #fff;
    border-color: #0d3b66;
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
    background-color: #0d3b66; /* azul oscuro */
    border: none;
    color: white;
    transition: all 0.2s ease-in-out;
}

.buttons-bottom-container .btn:hover {
    background-color: #0b3155; /* tono más oscuro */
}

.buttons-bottom-container .btn i {
    margin-right: 6px;
}
</style>

<!-- -------------------- SECCIÓN SUPERIOR -------------------- -->
<div class="section-container">
    <div class="header-box">
        <h2>Registrar Orden</h2>
        <div class="color-container">
            <div class="color-block block-blue-light"></div>
            <div class="color-block block-blue-dark"></div>
        </div>
    </div>

    <div class="buttons-container" style="padding-right: 50px;">
        <asp:Button
            ID="btnAgregarLinea"
            runat="server"
            Text="Añadir línea"
            CssClass="btn-add shadow-sm"
            OnClick="btnAgregarLinea_Click" />
    </div>
</div>

<!-- -------------------- GRIDVIEW -------------------- -->
<div class="container mt-4">
    <asp:GridView 
        ID="dgvOrdenDetalle"
        runat="server"
        AutoGenerateColumns="false"
        AllowPaging="true"
        PageSize="8"
        CssClass="table table-hover table-striped align-middle grid-border"
        HeaderStyle-CssClass="grid-header"
        PagerStyle-CssClass="custom-pager"
        OnPageIndexChanging="dgvOrdenDetalle_PageIndexChanging">

        <Columns>
            <asp:BoundField DataField="Numero" HeaderText="N.º" />
            <asp:BoundField DataField="Prenda" HeaderText="Prenda" />
            <asp:BoundField DataField="Talla" HeaderText="Talla" />
            <asp:BoundField DataField="Lote" HeaderText="Lote" />
            <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" />
            <asp:BoundField DataField="PrecioLote" HeaderText="Precio Lote" />

            <asp:TemplateField HeaderText="Acciones">
                <ItemTemplate>
                    <div class="d-flex justify-content-center gap-2">
                        <asp:LinkButton
                            ID="btnEditarLinea"
                            runat="server"
                            CssClass="btn btn-sm btn-outline-primary"
                            CommandArgument='<%# Eval("Numero") %>'
                            OnClick="btnEditarLinea_Click">
                            <i class="fa-solid fa-pen"></i>
                        </asp:LinkButton>

                        <asp:LinkButton 
                            ID="btnEliminarLinea" 
                            runat="server"
                            CssClass="btn btn-sm btn-outline-danger"
                            CommandArgument='<%# Eval("Numero") %>'
                            OnClick="btnEliminarLinea_Click">
                            <i class="fa-solid fa-trash"></i>
                        </asp:LinkButton>
                    </div>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
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
        ID="btnRegistrarOrden"
        runat="server"
        Text="Registrar Orden"
        CssClass="btn rounded shadow-sm"
        OnClick="btnRegistrarOrden_Click" />
</div>


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
