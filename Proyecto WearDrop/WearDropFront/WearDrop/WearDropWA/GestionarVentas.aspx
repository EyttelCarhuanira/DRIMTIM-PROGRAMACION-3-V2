<%@ Page Title="" Language="C#" MasterPageFile="~/WearDrop1.Master" AutoEventWireup="true" CodeBehind="GestionarVentas.aspx.cs" Inherits="WearDropWA.GestionarVentas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">

    Gestionar Ventas

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

.block-red {
    background-color: #ff6b6b;
}

.block-lred {
    background-color: #FFA2A2;
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
    background-color: #FFA2A2 !important;
    color: black !important;
    text-align: center;
}

/* Celdas del cuerpo */
.grid-border td {
    vertical-align: middle;
    text-align: center; /* 🔹 Centra el contenido, incluyendo botones */
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

/* Quita bordes adicionales que deja Bootstrap */
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

/* Hover */
.custom-pager a:hover {
    background-color: #f1f1f1;
    border-color: #ff6b6b;
}

/* Página activa */
.custom-pager span {
    background-color: #000;
    color: #fff;
    border-color: #000;
}
</style>

<!-- -------------------- SECCIÓN SUPERIOR -------------------- -->
<div class="section-container">
    <div class="header-box">
        <h2>Gestionar Ventas</h2>
        <div class="color-container">
            <div class="color-block block-red"></div>
            <div class="color-block block-lred"></div>
        </div>
    </div>

    <div class="buttons-container">
        <asp:Button
            ID="btnIrARegistrarVenta"
            runat="server"
            Text="Registrar Venta"
            CssClass="btn btn-danger rounded" 
            OnClick="btnIrARegistrarVenta_Click"
            />

        <asp:Button
            ID="btnFiltrarVentas"
            runat="server"
            Text="Filtrar"
            CssClass="btn btn-danger rounded" />
    </div>
</div>

<!-- -------------------- GRIDVIEW -------------------- -->
<div class="container mt-4">
    <asp:GridView 
        ID="dgvVentas"
        runat="server"
        AutoGenerateColumns="false"
        AllowPaging="true"
        PageSize="8"
        CssClass="table table-hover table-striped align-middle grid-border"
        HeaderStyle-CssClass="grid-header"
        PagerStyle-CssClass="custom-pager"
        OnPageIndexChanging="dgvVentas_PageIndexChanging">

        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" />
            <asp:BoundField DataField="Fecha" HeaderText="Fecha" DataFormatString="{0:dd/MM/yyyy}" />
            <asp:BoundField DataField="Monto"
                HeaderText="Monto" 
                DataFormatString="{0:N2}" 
                HtmlEncode="false"
                ItemStyle-CssClass="align-middle text-center"/>
            <asp:BoundField DataField="Comprobante" HeaderText="Comprobante" />
            <asp:BoundField DataField="Cliente" HeaderText="Cliente" />


            <asp:TemplateField HeaderText="Acciones">
                <ItemTemplate>
                    <div class="d-flex justify-content-center gap-2">
                        <asp:LinkButton
                            ID="btnModificarVenta"
                            runat="server"
                            CssClass="btn btn-sm btn-outline-primary"
                            CommandArgument='<%# Eval("ID") %>'
                            OnClick="btnModificar_Click">
    <i class="fa-solid fa-pen"></i>
                        </asp:LinkButton>

                        <asp:LinkButton 
                            ID="btnEliminarVenta" 
                            runat="server"
                            CssClass="btn btn-sm btn-outline-danger">
                            <i class="fa-solid fa-trash"></i>
                        </asp:LinkButton>

                        <asp:LinkButton 
                            ID="btnVerVenta"
                            runat="server"
                            CommandArgument='<%# Eval("ID") %>'
                            CssClass="btn btn-sm btn-outline-success"
                            OnClick="btnVerVenta_Click">
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
