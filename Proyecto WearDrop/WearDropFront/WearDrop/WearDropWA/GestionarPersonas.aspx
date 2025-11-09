<%@ Page Title="" Language="C#" MasterPageFile="~/WearDrop1.Master" AutoEventWireup="true" CodeBehind="GestionarPersonas.aspx.cs" Inherits="WearDropWA.GestionarPersonas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Gestionar Personas
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        /* ======= Encabezado con barras (como ListarAlmacenes) ======= */
        .header-title {
            display: flex;
            align-items: stretch;
            height: 60px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .title-section {
            background-color: #FFFFFF;
            padding: 0 25px;
            display: flex; align-items: center;
            flex: 0 0 250px;
        }
        .title-section h2 {
            margin: 0; font-size: 20px; font-weight: 500; color: #333; white-space: nowrap;
        }
        .color-bar { height: 100%; }
        .bar-1 { background-color: #C5D9C0; flex: 1.5; }
        .bar-2 { background-color: #95B88F; flex: 1.5; }

        /* ======= Subtítulo en caja ======= */
        .selector-banner{
            background:#fff; border-radius:10px; padding:12px 16px;
            box-shadow:0 2px 6px rgba(0,0,0,.08);
            font-weight:600; color:#333;
        }

        /* ======= Opciones (tiles) ======= */
        .tile-option{
            display:flex; align-items:center; gap:12px;
            width:100%; padding:16px 18px;
            border:3px solid transparent; border-radius:14px;
            background:#fff; color:#111; text-decoration:none; font-weight:700;
            box-shadow:0 2px 6px rgba(0,0,0,.08);
            transition:transform .08s ease, box-shadow .12s ease, background .12s ease;
        }
        .tile-option i{ font-size:1.25rem; }
        .tile-option:hover{
            transform: translateY(-2px);
            text-decoration:none;
            box-shadow:0 6px 16px rgba(0,0,0,.14);
        }

        /* Marcos y hover suaves (paleta del proyecto) */
        .tile-empleados{ border-color:#7FB489; }
        .tile-empleados:hover{ background:#E8F4E5; }

        .tile-clientes{ border-color:#7FA0B9; }
        .tile-clientes:hover{ background:#E6EEF5; }

        .tile-cuentas{ border-color:#C89395; }
        .tile-cuentas:hover{ background:#F6E9EA; }

        /* Contenedor de ancho cómodo como en otras vistas */
        .wd-wrap{ max-width: 980px; }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">

        <!-- Subtítulo en caja -->
        <div class="row mt-3 wd-wrap">
            <div class="col-12">
                <div class="selector-banner">
                    Seleccionar Tipo de Persona a Gestionar:
                </div>
            </div>
        </div>

        <!-- Opciones -->
        <div class="row g-3 mt-1 wd-wrap">
            <div class="col-12 col-md-6">
                <a class="tile-option tile-empleados" href="ListarEmpleados.aspx">
                    <i class="fa-solid fa-id-badge"></i>
                    <span>EMPLEADOS</span>
                </a>
            </div>

            <div class="col-12 col-md-6">
                <a class="tile-option tile-clientes" href="#">
                    <i class="fa-solid fa-cart-shopping"></i>
                    <span>CLIENTES</span>
                </a>
            </div>

            <div class="col-12 col-md-6">
                <a class="tile-option tile-cuentas" href="ListarCuentas.aspx">
                    <i class="fa-solid fa-gear"></i>
                    <span>CUENTAS</span>
                </a>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
