<%@ Page Title="" Language="C#" MasterPageFile="~/WearDrop1.Master" AutoEventWireup="true" CodeBehind="GestionarOrdenesDeCompra.aspx.cs" Inherits="WearDropWA.GestionarOrdenesDeCompra" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">


     Gestionar Ordenes de Compra

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

.buttons-container {
    display: flex;
    gap: 10px;
    padding-right: 50px;
}

/* -------------------- Estilos de la grilla -------------------- */
.grid-border {
    border: 1px solid #dee2e6;
    border-radius: 6px;
    overflow: hidden;
}

/* Encabezado */
.grid-header th {
    background-color: #a7c7e7 !important; /* azul claro */
    color: #0d3b66 !important;
    text-align: center;
}

/* Celdas del cuerpo */
.grid-border td {
    vertical-align: middle;
    text-align: center;
}

/* -------------------- Paginador personalizado -------------------- */
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

/* Quita bordes del pie del GridView */
.grid-border tfoot,
.grid-border tfoot tr,
.grid-border tfoot td {
    border: none !important;
    background: none !important;
}

/* Botones de paginación */
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
</style>

<!-- -------------------- SECCIÓN SUPERIOR -------------------- -->
<div class="section-container">
    <div class="header-box">
        <h2>Gestionar Ordenes de Compra</h2>
        <div class="color-container">
            <div class="color-block block-blue-light"></div>
            <div class="color-block block-blue-dark"></div>
        </div>
    </div>

    <div class="buttons-container">
        <asp:Button
            ID="btnRegistrarOrden"
            runat="server"
            Text="Registrar"
            CssClass="btn btn-primary rounded shadow-sm"
            OnClick="btnRegistrarOrden_Click" />

        <asp:Button
            ID="btnFiltrarOrdenes"
            runat="server"
            Text="Filtrar"
            CssClass="btn btn-primary rounded shadow-sm" />
    </div>
</div>

<!-- -------------------- GRIDVIEW -------------------- -->
<div class="container mt-4">
    <asp:GridView 
        ID="dgvOrdenesCompra"
        runat="server"
        AutoGenerateColumns="false"
        AllowPaging="true"
        PageSize="8"
        CssClass="table table-hover table-striped align-middle grid-border"
        HeaderStyle-CssClass="grid-header"
        PagerStyle-CssClass="custom-pager"
        OnPageIndexChanging="dgvOrdenesCompra_PageIndexChanging">

        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" />
            <asp:BoundField DataField="FechaEmision" HeaderText="Fecha Emisión" />
            <asp:BoundField DataField="FechaLlegada" HeaderText="Fecha Llegada" />
            <asp:BoundField DataField="DeudaPendiente" HeaderText="Deuda Pendiente" />
            <asp:BoundField DataField="Empleado" HeaderText="Empleado" />
            <asp:BoundField DataField="Proveedor" HeaderText="Proveedor" />
            <asp:BoundField DataField="MontoTotal" HeaderText="Monto Total" />

            <asp:TemplateField HeaderText="Acciones">
                <ItemTemplate>
                    <div class="d-flex justify-content-center gap-2">
                        <asp:LinkButton
                            ID="btnModificarOrden"
                            runat="server"
                            CssClass="btn btn-sm btn-outline-primary"
                            CommandArgument='<%# Eval("ID") %>'
                            OnClick="btnModificarOrden_Click">
                            <i class="fa-solid fa-pen"></i>
                        </asp:LinkButton>

                        <asp:LinkButton 
                            ID="btnEliminarOrden" 
                            runat="server"
                            CssClass="btn btn-sm btn-outline-danger">
                            <i class="fa-solid fa-trash"></i>
                        </asp:LinkButton>

                        <asp:LinkButton 
                            ID="btnVerOrden"
                            runat="server"
                            CssClass="btn btn-sm btn-outline-success"
                            CommandArgument='<%# Eval("ID") %>'
                            OnClick="btnVerOrden_Click">
                            <i class="fa-solid fa-eye"></i>
                        </asp:LinkButton>
                    </div>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</div>



</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
