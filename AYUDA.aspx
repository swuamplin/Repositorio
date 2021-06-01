<%@ Page Title="" Language="C#" MasterPageFile="~/BarraNavegacionPrincipal.master" AutoEventWireup="true" CodeFile="AYUDA.aspx.cs" Inherits="AYUDA" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <center>
        <div>
            <br />
            <br />
            
            <div class="input-group">
                <div class="form-inline">  
                    <section class="fondoTex">
                        
                        <h1>AYUDA</h1>
                        <h2>Este Software le proporciona una batería de preguntas o checklist que deberá ir comprobando durante las inspecciones FOD
                            de cada zona del avión y que le servirá de guía para sacar las discrepancias que encuentre durante la verificación.
                           Posteriormente podrá sacar un informe con el que revisar cada uno de estos puntos y poner solución lo antes posible
                        </h2> 
                        <br />
                        <h3>Puede acceder al manual de usuario pulsando el siguiente botón (no disponible todavía)</h3>
                        <asp:Button ID="btnManual" runat="server" Text="Manual de usuario"/>
                    </section>
                </div>
            </div>
     
      </div>
    </center>
</asp:Content>

