using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BarraNavegacion : System.Web.UI.MasterPage
{
    public string myrole = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Userid"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        try
        {
            if (Convert.ToBoolean(Session["IsAuth"]))
            {
                switch (Session["Role"].ToString())
                {
                    case "Operario":
                        myrole = "<ul class='nav navbar-nav h4' id='mUser'><li><a href='Home.aspx'>Inicio</a></li><li><a href='QueEsFOd.aspx'>¿Qué es FOD?</a></li><li><a href='Inspeccion.aspx'>Hacer Inspección</a></li><li><a href='GestionarInformes.aspx'>Gestionar Informes</a></li><li><a href='AYUDA.aspx'>AYUDA</a></li></ul>";
                        break;
                    case "Admin":
                        myrole = "<ul class='nav navbar-nav h4' id='mAdmin'><li><a href='Home.aspx'>Inicio</a></li><li>";
                        break;
                    default:
                        break;
                }
            }
        }
        catch (Exception EX)
        {

            Response.Redirect("Login.aspx");
        }
    }
}
