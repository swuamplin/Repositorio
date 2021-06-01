<%@ Page Title="" Language="C#" MasterPageFile="~/BarraNavegacionPrincipal.master" AutoEventWireup="true" CodeFile="GestionarInformes.aspx.cs" Inherits="GestionarInformes" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <link href="Content/VistaGrid.css" rel="stylesheet" />


<center>
    <div>        
        <div class="input-group">
            <div class="form-inline">    
                <h3 class="btn-info h3">Mostrar Informes</h3>   
                <asp:DropDownList ID="cbox_Informes" runat="server" CssClass=" list-group-item   h5" >
                    <asp:ListItem Text="Informe de Discrepancias por avión" ></asp:ListItem> 
                    <asp:ListItem Text="Informe de revisiones FOD en rojo"></asp:ListItem>   
                </asp:DropDownList>
                <asp:Button ID="btn_Ver" runat="server" Text="Ver Seleccionado" OnClick="btn_Ver_Click" CssClass=" btn-danger   h4" />
                <br />
                <asp:Label ID="Et_Mensajes" runat="server"></asp:Label>
                <br />
                <asp:Button ID="btn_Imprimir" runat="server" Text="Descargar a Excell" OnClick="btn_Imprimir_Click" CssClass ="btn-info"/>
                <br />

                <asp:GridView ID="grid_Informe1" DataSourceID ="ds_Informes1" AutoGenerateColumns="false" CssClass="GridViews" DataKeyNames="NombreAvion" runat="Server" AllowSorting ="true" Visible="false" >
                  <Columns>                      
                      <asp:BoundField DataField="NombreAvion" HeaderText="Nombre del Avión" />
                      <asp:BoundField DataField="NombreZonaAvion" HeaderText="Zona"/>
                      <asp:BoundField DataField="NombreZonaInspeccion" HeaderText="Sub Zona" />
                      <asp:BoundField DataField="DescripcionPregunta" HeaderText="Punto Checklist" />
                      <asp:BoundField DataField="FechaDiscrepancia" HeaderText="Fecha Creación" />
                      <asp:BoundField DataField="ComentarioDiscrepancia" HeaderText="Descripción del problema" />
             
                  </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="ds_Informes1" runat="Server" 
                ConnectionString="<%$ ConnectionStrings:ConexionString %>"  > 
                <SelectParameters></SelectParameters>  
            </asp:SqlDataSource> 
                

            <asp:GridView ID="grid_Informe2" runat ="server"   CssClass="GridViews"
                   DataKeyNames="NombreAvion" DataSourceID="ds_Informes2" AutoGenerateColumns ="false" Visible="false" > 
                <Columns>  
                    <asp:BoundField DataField="NombreAvion" HeaderText="Nombre del Avión" />                    
                    <asp:BoundField DataField="NombreZonaAvion" HeaderText="Zona del Avión"/>
                    <asp:BoundField DataField="NombreZonaInspeccion" HeaderText="Subzona del Avión" /> 
                    <asp:BoundField DataField="ResultadoInspeccion" HeaderText="Resultado"/>  
                    <asp:BoundField DataField="FechaInspeccion" HeaderText="Fecha" />  
                </Columns>
            </asp:GridView>
           
            <asp:SqlDataSource ID="ds_Informes2" runat="Server" 
                ConnectionString="<%$ ConnectionStrings:ConexionString %>"  > 
            <SelectParameters></SelectParameters> 
            </asp:SqlDataSource> 

            </div>
        </div>
    </div>
</center>

<%@ import namespace="System" %>
<%@ import namespace="System.Web.UI" %>
<%@ import namespace="System.Web.UI.WebControls" %>
<%@ import namespace="System.Configuration" %>
<%@ import namespace="System.Data.SqlClient" %>
<%@ import namespace="System.IO" %>
<%@ import namespace="System.Web" %>
        
<script runat="server">

    void Page_Load(Object sender, EventArgs e)
    {
        if (Session["Userid"] == null)
        {
           Response.Redirect("Login.aspx");
        }
        ds_Informes1.SelectCommand = "SELECT [NombreAvion],[NombreZonaAvion], [NombreZonaInspeccion],[DescripcionPregunta]," +
        " [FechaDiscrepancia], [ComentarioDiscrepancia] FROM [Informe_Discrepancias_Avion]";

        ds_Informes2.SelectCommand = "Select NombreAvion,NombreZonaAvion,NombreZonaInspeccion,ResultadoInspeccion," +
        " FechaInspeccion from Informe_Revisiones_FOD_Rojo";

    }


    protected void btn_Ver_Click(object sender, EventArgs e)
    {
        Et_Mensajes.Text = "";
        if (cbox_Informes.Text == "Informe de Discrepancias por avión")
        {
            grid_Informe2.Visible = false;
            ds_Informes1.SelectCommand = "SELECT [NombreAvion],[NombreZonaAvion], [NombreZonaInspeccion],[DescripcionPregunta]," +
            " [FechaDiscrepancia], [ComentarioDiscrepancia] FROM [Informe_Discrepancias_Avion]";


            grid_Informe1.Visible = true;
        }
        if (cbox_Informes.Text == "Informe de revisiones FOD en rojo")
        {
            grid_Informe1.Visible = false;
            ds_Informes2.SelectCommand = "Select NombreAvion,NombreZonaAvion,NombreZonaInspeccion,ResultadoInspeccion," +
               " FechaInspeccion from Informe_Revisiones_FOD_Rojo";
            grid_Informe2.Visible = true;
        }
    }
    protected void btn_Imprimir_Click(object sender, EventArgs e)
    {
        ExportGridToExcel();
    }
    private void ExportGridToExcel()
    {
        if (grid_Informe1.Visible == false && grid_Informe2.Visible == false)
        {
            Et_Mensajes.Text = "Pulse Ver Seleccionado para visualizar primero el informe";
            return;
        }
        if (cbox_Informes.Text == "Informe de Discrepancias por avión")
        {
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName ="Informe_Discrepancias_Avion"+DateTime.Now+".xls";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType ="application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition","attachment;filename=" + FileName);
            grid_Informe1.GridLines = GridLines.Both;
            grid_Informe1.HeaderStyle.Font.Bold = true;
            grid_Informe1.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();
        }
        if (cbox_Informes.Text == "Informe de revisiones FOD en rojo")
        {
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName ="Informe_Revisiones_FOD"+DateTime.Now+".xls";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType ="application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition","attachment;filename=" + FileName);
            grid_Informe2.GridLines = GridLines.Both;
            grid_Informe2.HeaderStyle.Font.Bold = true;
            grid_Informe2.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();
        }

    }

    public override void VerifyRenderingInServerForm(Control control)
    {
        //required to avoid the runtime error "  
        //Control 'GridView1' of type 'GridView' must be placed inside a form tag with runat=server."  
    }

</script>         
                

</asp:Content>
