<%@ Page Title="" Language="C#" MasterPageFile="~/BarraNavegacionPrincipal.master" AutoEventWireup="true"
    CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="Content/landing-page.css" rel="stylesheet" />

    <div class="intro-header">
        <div class="container">

            <div class="row">
                <div class="col-lg-12">

                    <div class="intro-message">
                        <h1>Bienvenido <%=Session["username"].ToString() %></h1>
                        <h3>Revisión FOD para Talleres de Mantenimiento de Aeronaves</h3>
                        <hr class="intro-divider" />
                        
                    </div>
                </div>
            </div>

        </div>
    </div>

</asp:Content>
