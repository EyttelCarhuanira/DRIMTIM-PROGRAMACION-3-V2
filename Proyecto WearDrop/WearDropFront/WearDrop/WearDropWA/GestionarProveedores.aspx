
<%@ Page Title="" Language="C#" MasterPageFile="~/WearDrop1.Master" AutoEventWireup="true" CodeBehind="GestionarProveedores.aspx.cs" Inherits="WearDropWA.GestionarProveedores" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">

    Gestionar Proveedores


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

.block-green {
    background-color: #2e8b57; /* verde oscuro */
}

.block-lgreen {
    background-color: #90ee90; /* verde claro */
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
    background-color: #90ee90 !important; /* verde claro */
    color: black !important;
    text-align: center;
}

/* Celdas del cuerpo */
.grid-border td {
    vertical-align: middle;
    text-align: center; /* Centra el contenido */
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

.table > tfoot > tr > td {
    border: none !important;
    background-color: transparent !important;
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
    background-color: #e6ffe6;
    border-color: #2e8b57;
}

.custom-pager span {
    background-color: #2e8b57;
    color: #fff;
    border-color: #2e8b57;
}
</style>

<!-- -------------------- SECCIÓN SUPERIOR -------------------- -->
<div class="section-container">
    <div class="header-box">
        <h2>Gestionar Proveedores</h2>
        <div class="color-container">
            <div class="color-block block-lgreen"></div>
            <div class="color-block block-green"></div>
        </div>
    </div>

    <div class="buttons-container">
        <asp:Button
            ID="btnRegistrarProveedor"
            runat="server"
            Text="Registrar"
            CssClass="btn btn-success rounded"
            OnClick="btnRegistrarProveedor_Click" />

        <asp:Button
            ID="btnFiltrarProveedores"
            runat="server"
            Text="Filtrar"
            CssClass="btn btn-success rounded" />
    </div>
</div>

<!-- -------------------- GRIDVIEW -------------------- -->
<div class="container mt-4">
    <asp:GridView 
        ID="dgvProveedores"
        runat="server"
        AutoGenerateColumns="false"
        AllowPaging="true"
        PageSize="8"
        CssClass="table table-hover table-striped align-middle grid-border"
        HeaderStyle-CssClass="grid-header"
        PagerStyle-CssClass="custom-pager"
        OnPageIndexChanging="dgvProveedores_PageIndexChanging">

        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
            <asp:BoundField DataField="Telefono" HeaderText="Teléfono" />
            <asp:BoundField DataField="Direccion" HeaderText="Dirección" />
            <asp:BoundField DataField="RUC" HeaderText="RUC" />

            <asp:TemplateField HeaderText="Acciones">
                <ItemTemplate>
                    <div class="d-flex justify-content-center gap-2">
                        <asp:LinkButton
                            ID="btnModificarProveedor"
                            runat="server"
                            CssClass="btn btn-sm btn-outline-primary"
                            CommandArgument='<%# Eval("ID") %>'
                            OnClick="btnModificarProveedor_Click">
                            <i class="fa-solid fa-pen"></i>
                        </asp:LinkButton>

                        <asp:LinkButton 
                            ID="btnEliminarProveedor" 
                            runat="server"
                            CssClass="btn btn-sm btn-outline-danger">
                            <i class="fa-solid fa-trash"></i>
                        </asp:LinkButton>

                        <asp:LinkButton 
                            ID="btnVerProveedor"
                            runat="server"
                            CssClass="btn btn-sm btn-outline-success"
                            CommandArgument='<%# Eval("ID") %>'
                            OnClick="btnVerProveedor_Click">
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
