<%@ Page Title="" Language="C#" MasterPageFile="~/BarraNavegacionPrincipal.master" AutoEventWireup="true" CodeFile="Inspeccion.aspx.cs" Inherits="Inspeccion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <link href="Content/VistaGrid.css" rel="stylesheet" />
 
 <style>
     .ZonaResponsive {
   
    display:block   ;
    width:30%;
    min-width:150px;
    max-width:300px;
    height:auto;

}

    </style>
 <center>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server" class="intro-header" >
    <div class="intro-header" > 
       
      <asp:Panel ID="PanelSeleccionados" runat="server" HorizontalAlign="Left"   >

            <asp:Button ID="btn_Reiniciar" OnClick ="btn_Reiniciar_Click" runat ="server" Text="Reiniciar" CssClass="btn-info h3" ToolTip="Reinicie el formulario con este botón"     />
            <br />
            <asp:TextBox ID ="Txt_Avion" runat="server" CssClass="PanelElementos"   ></asp:TextBox>
            <asp:TextBox ID ="Txt_Zona" runat="server" CssClass="PanelElementos" ></asp:TextBox>
            <asp:TextBox ID ="Txt_SubZona" runat="server" CssClass="PanelElementos" ></asp:TextBox>
            <asp:TextBox ID ="Txt_Pregunta" runat="server" CssClass="PanelElementos" ></asp:TextBox>
            <asp:TextBox ID ="Txt_PuntuacionPregunta" runat="server" CssClass="PanelElementos" ></asp:TextBox>        

      </asp:Panel>

 <asp:Menu  
     runat="server" ID="MenuTerminar" target="_blank"      ForeColor ="Black"      
     Visible="false"  OnMenuItemClick ="MenuTerminar_MenuItemClick" CssClass="btn-danger  h3" >
     <items>
          <asp:menuitem text="Terminar Inspeccion" tooltip="Al Terminar no podrá realizar la misma inspección en el día de hoy" >               
 </asp:menuitem>
     </items>
 </asp:Menu>
            <div>

                <br />
                    <asp:Label runat="server"  ID ="ArbolNav" CssClass ="h4" ></asp:Label>    
                <br />
             <asp:label id="MessageLabel"  forecolor="Red" runat="server"/>
            <div class="input-group">
                <div class="form-inline">    
                    <h3 class="btn-info h3">Hacer Inspección FOD</h3>    
                    <asp:Label runat="server"  ID ="ASv" >Seleccione un avión de la lista para realizar la inspección</asp:Label>     
                </div> 
                <br />
                <asp:label id="Message" forecolor="red" runat="server" CssClass="h4"/>
            </div>
            <br />
            <br />
            
        </div>
        <div>
            
             <asp:GridView ID="grid_Avion" AutoGenerateColumns="false" CssClass="GridViews" OnSelectedIndexChanged ="grid_Avion_SelectedIndexChanged"
                    DataKeyNames="Id_Avion" DataSourceID = "Tb_AvionDb"  runat="Server" AutoGenerateSelectButton ="true" AllowSorting ="true"   >
                  <Columns>
                      <asp:BoundField DataField="Id_Avion"  ItemStyle-Font-Size ="0" ItemStyle-CssClass="OcultarColumnaGrid" HeaderStyle-CssClass ="OcultarColumnaGrid"/>
                      <asp:BoundField DataField="NombreAvion" HeaderText="Nombre del Avión" SortExpression="NombreAvion"/>
                      <asp:BoundField DataField="DescripcionAvion"  HeaderText="Descripción del Avion" SortExpression="DescripcionAvion" />             
                  </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="Tb_AvionDb" runat="Server" 
                ConnectionString="<%$ ConnectionStrings:ConexionString %>"  >    
            </asp:SqlDataSource>
            
            <asp:GridView ID="grid_ZonaAvion" CssClass="GridViews"  AutoGenerateColumns="False" 
                   DataKeyNames="Id_ZonaAvion"  runat="Server" AutoGenerateSelectButton ="true"
                  AllowSorting ="true" OnSelectedIndexChanged="grid_ZonaAvion_SelectedIndexChanged"   >
                      <Columns>
                          <asp:BoundField DataField="Id_ZonaAvion" ItemStyle-CssClass="OcultarColumnaGrid" ItemStyle-Font-Size ="0" HeaderStyle-CssClass ="OcultarColumnaGrid"/>
                          <asp:BoundField DataField="NombreZonaAvion" HeaderText="Zona" SortExpression="NombreZonaAvion" />
                          <asp:ImageField DataImageUrlField ="" DataAlternateTextField="ZONA"></asp:ImageField>
                          <asp:BoundField DataField="Id_Avion"  ItemStyle-CssClass="OcultarColumnaGrid" ItemStyle-Font-Size ="0" HeaderStyle-CssClass ="OcultarColumnaGrid"/>
                          <asp:BoundField DataField="DescripcionZonaAvion" HeaderText="Descripcion de la Zona" SortExpression="DescripcionZonaAvion" />                          
                          <asp:imagefield  dataimageurlfield="NombreZonaAvion"  
                                dataimageurlformatstring=".\Images\ZonasAvion2\{0}.png"
                                alternatetext="ZonaAvion"
                                nulldisplaytext="No image on file."
                                headertext="Ayuda Visual"  
                                ControlStyle-CssClass  ="ZonaResponsive"     >
                           </asp:imagefield>                       

                      </Columns>
                </asp:GridView>
            <asp:GridView ID="grid_ZonaInspeccion" CssClass="GridViews" AutoGenerateColumns="False" 
                   DataKeyNames="Id_ZonaInspeccion"  runat="Server" AutoGenerateSelectButton ="true"
                  AllowSorting ="true" OnSelectedIndexChanged="grid_ZonaInspeccion_SelectedIndexChanged"   >
                      <Columns>
                          <asp:BoundField DataField="Id_ZonaInspeccion" ItemStyle-CssClass="OcultarColumnaGrid" ItemStyle-Font-Size ="0" HeaderStyle-CssClass ="OcultarColumnaGrid"/>
                          <asp:BoundField DataField="NombreZonaInspeccion" HeaderText="Zona de Inspección (Subzona)" SortExpression="NombreZonaInspeccion" />
                          <asp:BoundField DataField="Id_ZonaAvion" ItemStyle-CssClass="OcultarColumnaGrid" ItemStyle-Font-Size ="0" HeaderStyle-CssClass ="OcultarColumnaGrid"  />                        
                          <asp:BoundField DataField="DescripcionZonaInspeccion" HeaderText="Descripción de la Zona de Inspección(Subzona)" SortExpression="DescripcionZonaInspeccion" />                          
                          <asp:imagefield  dataimageurlfield="NombreZonaInspeccion"  
                                dataimageurlformatstring=".\Images\SubZonasAvion\{0}.png"
                                alternatetext="ZonaAvion"
                                nulldisplaytext="No image on file."
                                headertext="Ayuda Visual"  
                                ControlStyle-CssClass  ="ZonaResponsive"     >
                          </asp:imagefield>    

                      </Columns>
                </asp:GridView>
             <asp:SqlDataSource ID="SqlPreguntas" runat="Server" 
                ConnectionString="<%$ ConnectionStrings:ConexionString %>"  
                   >
             </asp:SqlDataSource>
            
            <asp:Panel ID="PanelDiscrepancias" runat="server" Visible="false" BorderColor ="Red" BorderWidth ="3" Width="500">
                <asp:Label ID ="DescripcionPregunta" runat ="server"    Width="500" CssClass ="h4" ></asp:Label>
                <br />           
                <asp:TextBox ID ="Txt_Comentario"   runat ="server" TextMode="MultiLine"  Width="500" CssClass="h4"  ></asp:TextBox>
                <br /> 
                <asp:Label ID ="Et_Comentario" Text ="Describa el problema encontrado y pulse aceptar" runat ="server"    Width="500"  CssClass="h5" ></asp:Label>
                <br />
                <asp:Button  ID="Btn_Aceptar" Text="Aceptar" runat="server" OnClick ="Btn_Aceptar_Click" CssClass ="btn-danger h4"/>
            </asp:Panel>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ErrorMessage="El campo comentario es obligatorio" 
                    ControlToValidate="Txt_Comentario" ForeColor="White" CssClass="alert-danger">

                </asp:RequiredFieldValidator>


            <br />
            <asp:Label runat="server" ID="Et_discrepancias"  text ="Pulse seleccionar en las discrepancias encontradas" Visible="false"></asp:Label>
            <br />
            <asp:GridView ID="grid_Preguntas" runat ="server"   CssClass="GridViews"
                   DataKeyNames="Id_Pregunta" AutoGenerateSelectButton ="true" Visible="false" DataSourceID="SqlPreguntas" OnSelectedIndexChanged ="grid_Preguntas_SelectedIndexChanged" AutoGenerateColumns ="false" > 
                <Columns>  
                    <asp:BoundField DataField="Id_Pregunta" ItemStyle-CssClass="OcultarColumnaGrid" ItemStyle-Font-Size ="0" HeaderStyle-CssClass ="OcultarColumnaGrid"  />                    
                    <asp:BoundField DataField="PuntuacionPregunta" HeaderText="Puntuación" SortExpression="PuntuacionPregunta" ItemStyle-VerticalAlign ="Middle" ItemStyle-HorizontalAlign ="Center"  />
                    <asp:BoundField DataField="NombrePregunta" HeaderText="Pregunta" SortExpression="NombrePregunta" /> 
                    <asp:BoundField DataField="DescripcionPregunta" HeaderText="Descripción de la Pregunta" SortExpression="DescripcionPregunta" />  
                </Columns>
            </asp:GridView>

        </div>
         <br/>     

         <br/>     
    

     </center>
 </div>  
    

<%@ import namespace="System.Data" %>
<%@ import namespace="System.Data.SqlClient" %>



<script runat="server">
    private int IdAvion;
    private int IdZonaInspeccion;
    private int IdZonaAvion;
    private string NAvion;
    private string NZonaInspeccion;
    private string NZonaAvion;

    void Page_Load(Object sender, EventArgs e)
    {
        if (Session["Userid"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        Tb_AvionDb.SelectCommand = "SELECT [Id_Avion],[NombreAvion], [DescripcionAvion] FROM [Tb_Avion]";
        grid_Preguntas.Visible = false;
        MenuTerminar.Visible = false;


    }

    DataSet GetData(String queryString)
    {

        // Retrieve the connection string stored in the Web.config file.
        String connectionString = ConfigurationManager.ConnectionStrings["ConexionString"].ConnectionString;

        DataSet ds = new DataSet();

        try
        {
            // Connect to the database and run the query.
            SqlConnection connection = new SqlConnection(connectionString);
            SqlDataAdapter adapter = new SqlDataAdapter(queryString, connection);

            // Fill the DataSet.
            adapter.Fill(ds);

        }
        catch(Exception ex)
        {

            // The connection failed. Display an error message.
            Message.Text = "Unable to connect to the database.";

        }

        return ds;

    }


    protected void grid_Avion_SelectedIndexChanged(object sender, EventArgs e)
    {


        GridViewRow row = grid_Avion.SelectedRow;
        ///////MessageLabel.Text = "You selected " + row.Cells[1].Text + ".";
        string a;
        a = row.Cells[1].Text;

        int result = Int32.Parse(a);
        // Declare the query string.
        String queryString =
          "SELECT [Id_ZonaAvion],[NombreZonaAvion], [Id_Avion],DescripcionZonaAvion FROM [Tb_ZonaAvion] Where [Id_Avion]="+result;

        // Run the query and bind the resulting DataSet
        // to the GridView control.
        DataSet ds = GetData(queryString);
        if (ds.Tables.Count > 0)
        {
            grid_ZonaAvion.DataSource = ds;
            grid_ZonaAvion.DataBind();
            Message.ForeColor    = System.Drawing.Color.White;
            Message.Text = result.ToString ();
            grid_Avion.Visible = false;
            ASv.Text  ="Seleccione una Zona del Avión";
            Txt_Avion.Text=row.Cells[1].Text;
            IdAvion = result;
            NAvion=row.Cells[2].Text;
            ArbolNav.Text = NAvion;        }
        else
        {
            Message.ForeColor    = System.Drawing.Color.White;
            Message.Text = "Unable to connect to the database.";
        }
    }

    protected void grid_ZonaAvion_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = grid_ZonaAvion.SelectedRow;
        ///////MessageLabel.Text = "You selected " + row.Cells[1].Text + ".";
        string a;
        a = row.Cells[1].Text;

        int result = Int32.Parse(a);
        // Declare the query string.
        String queryString =
          "SELECT [Id_ZonaInspeccion],[NombreZonaInspeccion], [Id_ZonaAvion],DescripcionZonaInspeccion FROM [Tb_ZonaInspeccion] Where [Id_ZonaAvion]="+result;

        // Run the query and bind the resulting DataSet
        // to the GridView control.
        DataSet ds = GetData(queryString);
        if (ds.Tables.Count > 0)
        {
            grid_ZonaInspeccion.DataSource = ds;
            grid_ZonaInspeccion.DataBind();
            Message.ForeColor    = System.Drawing.Color.White;
            Message.Text = result.ToString ();
            grid_ZonaAvion.Visible = false;
            ASv.Text  ="Seleccione una Sub Zona del Avión";
            Txt_Zona.Text=row.Cells[1].Text;
            IdZonaAvion = result;
            NZonaAvion=row.Cells[2].Text;
            ArbolNav.Text = ArbolNav.Text +  " / "  + NZonaAvion;
        }
        else
        {
            Message.Text = "Unable to connect to the database.";
        }
    }
    protected void grid_ZonaInspeccion_SelectedIndexChanged(object sender, EventArgs e)
    {



        GridViewRow row = grid_ZonaInspeccion.SelectedRow;
        ///////MessageLabel.Text = "You selected " + row.Cells[1].Text + ".";
        string a;
        a = row.Cells[1].Text;
        NZonaInspeccion = row.Cells[2].Text;
        Txt_SubZona.Text = row.Cells[1].Text;
        ArbolNav.Text = ArbolNav.Text +  " / "  + NZonaInspeccion;

        DataSet ds = new DataSet();


        ds = GetData("Select Id_Inspeccion from Tb_Inspecciones" +
            " where FechaInspeccion='" + DateTime.Today + "' and Id_Avion="+Txt_Avion.Text+" and Id_ZonaAvion="+Txt_Zona.Text+" and Id_ZonaInspeccion="+Txt_SubZona.Text);
        Txt_PuntuacionPregunta.Text = ds.Tables.Count.ToString();
        if (ds.Tables[0].Rows.Count > 0)
        {
            Message.ForeColor    = System.Drawing.Color.Red;
            Message.Text = "Ya se ha realizado una inspección  para hoy: "+DateTime.Today+  " ese mismo avíon, zona y sub zona.";
            return;
        }
        else
        {
            ASv.Text  ="Realice la Inspección";
            grid_ZonaInspeccion.Visible = false;

            SqlPreguntas.SelectCommand = "Select Id_Pregunta,PuntuacionPregunta,NombrePregunta,DescripcionPregunta " +
                     "from Tb_preguntas Where Id_ZonaInspeccion="+Txt_SubZona.Text;


            grid_Preguntas.Visible = true;
            IdZonaInspeccion = Int32.Parse(row.Cells[3].Text);
            MenuTerminar.Visible = true;
        }

    }


    protected void grid_Preguntas_SelectedIndexChanged(object sender, EventArgs e)
    {

        GridViewRow row = grid_Preguntas.SelectedRow;
        ///////MessageLabel.Text = "You selected " + row.Cells[1].Text + ".";
        string a;
        a = row.Cells[1].Text;
        Et_discrepancias.Visible = true;
        grid_ZonaInspeccion.Visible = false;
        grid_Preguntas.Visible = true;
        //Txt_SubZona.Text = row.Cells[2].Text;
        Txt_Comentario.Visible = true;
        Txt_Comentario.Text = "";
        Btn_Aceptar.Visible = true;
        DescripcionPregunta.Visible = true;
        Et_Comentario.Visible = true;
        MenuTerminar.Visible = true;
        Message.ForeColor    = System.Drawing.Color.White;
        Message.Text = "";
        //  grid_Preguntas.CssClass = "bootsrap.css";
        if (grid_Preguntas.SelectedRow.BackColor== System.Drawing.Color.Red)
        {
            grid_Preguntas.SelectedRow.BackColor = System.Drawing.Color.White;
            PanelDiscrepancias.Visible = false;
            MenuTerminar.Visible = true;

        }else
        {
            grid_Preguntas.SelectedRow.BackColor    = System.Drawing.Color.Red;
            DescripcionPregunta.Text=row.Cells[4].Text;
            Txt_Pregunta.Text  = row.Cells[1].Text;
            Txt_PuntuacionPregunta.Text=row.Cells[2].Text;

            PanelDiscrepancias.Visible = true;
            MenuTerminar.Visible = true;
        }


    }

    protected void btn_Reiniciar_Click(object sender, EventArgs e)
    {

        //Falta funciona para eliminar los registros creados de la tabla Discrepancias y de la tabla Inspecciones.
        Response.Redirect(HttpContext.Current.Request.UrlReferrer.AbsolutePath);
        MenuTerminar.Visible = false;
    }

    protected void Btn_Aceptar_Click(object sender, EventArgs e)
    {

        if (Txt_Comentario.Text==null || Txt_Comentario.Text=="")
        {
            Message.Text = "Debe introducir un comentario obligatoriamente";

        }else
        {

            try
            {
                SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConexionString"].ConnectionString);
                SqlCommand cmd = new SqlCommand("insert into Tb_Discrepancias (Id_Pregunta,Id_Avion,Id_ZonaAvion,Id_ZonaInspeccion,PuntuacionDiscrepancia" +
                    ",ComentarioDiscrepancia,FechaDiscrepancia,Usuario) values (@IdPregunta,@IdAvion,@IdZonaAvion,@IdZonaInspeccion,@PuntuacionDiscrepancia,@ComentarioDiscrepancia,@FechaDiscrepancia,@Usuario)", conn);
                cmd.Parameters.AddWithValue("@IdPregunta", Txt_Pregunta.Text );
                cmd.Parameters.AddWithValue("@IdAvion", Txt_Avion.Text);
                cmd.Parameters.AddWithValue("@IdZonaAvion", Txt_Zona.Text  );
                cmd.Parameters.AddWithValue("@IdZonaInspeccion",Txt_SubZona.Text);
                cmd.Parameters.AddWithValue("@PuntuacionDiscrepancia",Txt_PuntuacionPregunta.Text);
                cmd.Parameters.AddWithValue("@ComentarioDiscrepancia",Txt_Comentario.Text);
                cmd.Parameters.AddWithValue("@FechaDiscrepancia",DateTime.Now);
                cmd.Parameters.AddWithValue("@Usuario",Environment.UserName);
                Message.ForeColor    = System.Drawing.Color.White;
                Message.Text = "";
                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    grid_Preguntas.Visible = true;
                    grid_Preguntas.SelectedRow.BackColor    = System.Drawing.Color.LightBlue ;
                    MenuTerminar.Visible = true;
                    PanelDiscrepancias.Visible = false;
                    Message.ForeColor    = System.Drawing.Color.Green;
                    Message.Text = "Elemento Guardado";
                }
                catch (Exception ex)
                {
                    Message.ForeColor    = System.Drawing.Color.White;
                    Message.Text=ex.Message;
                }
                finally
                {
                    conn.Close();
                }


            }
            catch (Exception ex)
            {

            }
        }

    }
    protected void MenuTerminar_MenuItemClick(object sender, MenuEventArgs e)
    {
        DataSet ds = new DataSet();

        try
        {

            ds = GetData("Select sum(PuntuacionDiscrepancia)  from Tb_Discrepancias where FechaDiscrepancia='"+DateTime.Today +"'");
            if (ds.Tables.Count > 0)
            {
                int i=0;
                Message.ForeColor    = System.Drawing.Color.White;
                Message.Text = "";
                for (i = 0; i <= ds.Tables[0].Rows.Count - 1; i++)
                {
                    //Message.Text = ds.Tables[0].Rows[i].ItemArray[0].ToString() ;
                    //Insertar puntuacion total y crear la inspeccion con su resultado.
                    SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConexionString"].ConnectionString);
                    try
                    {
                        if (Convert.ToInt32(ds.Tables[0].Rows[i].ItemArray[0]) >= 5)
                        {
                            SqlCommand cmd = new SqlCommand("insert into Tb_Inspecciones (Usuario,FechaInspeccion,Id_Avion,Id_ZonaAvion,Id_ZonaInspeccion,ResultadoInspeccion)" +
                                " values (@Usuario,@FechaInspeccion,@IdAvion,@IdZonaAvion,@IdZonaInspeccion,@ResultadoInspeccion)", conn);
                            cmd.Parameters.AddWithValue("@Usuario",Environment.UserName);
                            cmd.Parameters.AddWithValue("@FechaInspeccion",DateTime.Now);
                            cmd.Parameters.AddWithValue("@IdAvion", Txt_Avion.Text);
                            cmd.Parameters.AddWithValue("@IdZonaAvion", Txt_Zona.Text  );
                            cmd.Parameters.AddWithValue("@IdZonaInspeccion",Txt_SubZona.Text);
                            cmd.Parameters.AddWithValue("@ResultadoInspeccion",false);
                            Message.ForeColor    = System.Drawing.Color.Red;
                            Message.Text = "El resultado ha sido mayor o igual que 5 por lo que existe riesgo de FOD";

                            conn.Open();
                            cmd.ExecuteNonQuery();
                        }
                        else
                        {
                            SqlCommand cmd = new SqlCommand("insert into Tb_Inspecciones (Usuario,FechaInspeccion,Id_Avion,Id_ZonaAvion,Id_ZonaInspeccion,ResultadoInspeccion)" +
                            " values (@Usuario,@FechaInspeccion,@IdAvion,@IdZonaAvion,@IdZonaInspeccion,@ResultadoInspeccion)", conn);
                            cmd.Parameters.AddWithValue("@Usuario",Environment.UserName);
                            cmd.Parameters.AddWithValue("@FechaInspeccion",DateTime.Now);
                            cmd.Parameters.AddWithValue("@IdAvion", Txt_Avion.Text);
                            cmd.Parameters.AddWithValue("@IdZonaAvion", Txt_Zona.Text  );
                            cmd.Parameters.AddWithValue("@IdZonaInspeccion",Txt_SubZona.Text);
                            cmd.Parameters.AddWithValue("@ResultadoInspeccion",true);
                            Message.Text = "El resultado ha sido menor que 5 por lo que no existe riesgo de FOD";
                            Message.ForeColor    = System.Drawing.Color.Green ;

                            conn.Open();
                            cmd.ExecuteNonQuery();
                        }

                    }
                    catch (Exception ex)
                    {
                        Message.ForeColor    = System.Drawing.Color.White;
                        Message.Text=ex.Message;
                    }
                    finally
                    {
                        conn.Close();
                    }




                }


            }
        }
        catch(Exception ex)
        {
            // The connection failed. Display an error message.
            Message.ForeColor    = System.Drawing.Color.White;
            Message.Text = "Fallo en la conexión.";
        }
    }
</script>
</asp:Content>
