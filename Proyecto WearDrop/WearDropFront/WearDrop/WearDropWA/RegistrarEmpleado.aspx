<%@ Page Title="" Language="C#" MasterPageFile="~/WearDrop1.Master" AutoEventWireup="true" CodeBehind="RegistrarEmpleado.aspx.cs" Inherits="WearDropWA.RegistrarEmpleado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Registrar Empleado
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        /* ====== ENCABEZADO CON BARRAS ====== */
        .header-title {
            display: flex;
            align-items: stretch;
            height: 60px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .title-section {
            background-color: #FFFFFF;
            padding: 0 25px;
            display: flex;
            align-items: center;
            flex: 0 0 250px;
        }

        .title-section h2 {
            margin: 0;
            font-size: 20px;
            font-weight: 500;
            color: #333;
            white-space: nowrap;
        }

        .color-bar {
            height: 100%;
        }

        .bar-1 {
            background-color: #C5D9C0;
            flex: 1.5;
        }

        .bar-2 {
            background-color: #95B88F;
            flex: 1.5;
        }

        /* ====== CAMPOS ====== */
        .form-label {
            font-size: 14px;
            color: #333;
            margin-bottom: 6px;
            display: block;
        }

        .form-control {
            background-color: #F5F5F5;
            border: 1px solid #E0E0E0;
            border-radius: 4px;
            padding: 10px 15px;
            font-size: 14px;
        }

        /* ====== BOTONES ====== */
        .btn-cancelar, .btn-registrar {
            background-color: #73866D;
            color: #FFFFFF;
            border: none;
            padding: 10px 30px;
            border-radius: 4px;
            font-size: 14px;
        }

        .btn-cancelar:hover, .btn-registrar:hover {
            background-color: #5f6f5a;
            color: #FFFFFF;
        }

        /* ====== RADIO GÉNERO ====== */
        .radio-group {
            display: flex;
            align-items: center;
            gap: 20px;
            background-color: #F5F5F5;
            border: 1px solid #E0E0E0;
            border-radius: 4px;
            padding: 8px 15px;
        }

        .radio-group label {
            margin: 0;
            font-size: 14px;
            color: #333;
            cursor: pointer;
        }

        .radio-group input[type="radio"] {
            margin-right: 6px;
            accent-color: #73866D;
            transform: scale(1.1);
            cursor: pointer;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <!-- HEADER -->
        <div class="row align-items-center">
            <div class="col-md-6 p-0">
                <div class="header-title">
                    <div class="title-section">
                        <h2>Registrar Empleado</h2>
                    </div>
                    <div class="color-bar bar-1"></div>
                    <div class="color-bar bar-2"></div>
                </div>
            </div>
        </div>

        <!-- FORMULARIO -->
        <div class="row mt-5">
            <div class="col-md-10">
                <div class="row g-3">
                    <!-- ID y Nombre -->
                    <div class="col-md-2">
                        <asp:Label ID="lblID" runat="server" Text="ID" CssClass="form-label"></asp:Label>
                        <asp:TextBox ID="txtID" runat="server" CssClass="form-control" Enabled="false" placeholder="Auto"></asp:TextBox>
                    </div>
                    <div class="col-md-10">
                        <asp:Label ID="lblNombre" runat="server" Text="Nombre (*)" CssClass="form-label"></asp:Label>
                        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" placeholder="Nombre completo"></asp:TextBox>
                    </div>

                    <!-- Apellidos -->
                    <div class="col-md-6">
                        <asp:Label ID="lblApellidoPaterno" runat="server" Text="Primer Apellido" CssClass="form-label"></asp:Label>
                        <asp:TextBox ID="txtApellidoPaterno" runat="server" CssClass="form-control" placeholder="Apellido paterno"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <asp:Label ID="lblApellidoMaterno" runat="server" Text="Segundo Apellido" CssClass="form-label"></asp:Label>
                        <asp:TextBox ID="txtApellidoMaterno" runat="server" CssClass="form-control" placeholder="Apellido materno"></asp:TextBox>
                    </div>

                    <!-- DNI y Género -->
                    <div class="col-md-6">
                        <asp:Label ID="lblDni" runat="server" Text="DNI" CssClass="form-label"></asp:Label>
                        <asp:TextBox ID="txtDni" runat="server" CssClass="form-control" MaxLength="8" placeholder="Documento Nacional de Identidad"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <asp:Label ID="lblGenero" runat="server" Text="Género" CssClass="form-label"></asp:Label>
                        <div class="radio-group">
                            <label>
                                <input type="radio" name="genero" value="M" runat="server" id="rbMasculino" />
                                M
                            </label>
                            <label>
                                <input type="radio" name="genero" value="F" runat="server" id="rbFemenino" />
                                F
                            </label>
                        </div>
                    </div>

                    <!-- Teléfono y Cargo -->
                    <div class="col-md-6">
                        <asp:Label ID="lblTelefono" runat="server" Text="Teléfono" CssClass="form-label"></asp:Label>
                        <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" placeholder="Número de teléfono"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <asp:Label ID="lblCargo" runat="server" Text="Cargo (*)" CssClass="form-label"></asp:Label>
                        <asp:TextBox ID="txtCargo" runat="server" CssClass="form-control" placeholder="Cargo del empleado"></asp:TextBox>
                    </div>

                    <!-- Sueldo -->
                    <div class="col-md-6">
                        <asp:Label ID="lblSueldo" runat="server" Text="Sueldo" CssClass="form-label"></asp:Label>
                        <asp:TextBox ID="txtSueldo" runat="server" CssClass="form-control" placeholder="Monto de sueldo"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <asp:Label ID="lblUser" runat="server" Text="User" CssClass="form-label"></asp:Label>
                        <asp:DropDownList ID="ddlUser" runat="server" CssClass="form-select">
                        </asp:DropDownList>
                    </div>
                </div>

                <!-- BOTONES -->
                <div class="mt-5 d-flex justify-content-between">
                    <asp:Button ID="btnCancelar" runat="server" Text="Regresar" CssClass="btn-cancelar" OnClick="btnCancelar_Click" />
                    <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" CssClass="btn-registrar" OnClick="btnRegistrar_Click" />
                </div>

            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
