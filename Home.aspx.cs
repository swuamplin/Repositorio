using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home : System.Web.UI.Page
{
    public StringBuilder Announcements = new StringBuilder();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Convert.ToBoolean(Session["IsAuth"]))
            {
                if (Session["role"].ToString().ToUpper() == "Operario")
                {

                }
                
            }
        }
        catch (Exception EX)
        {

            Response.Redirect("Login.aspx");
        }
        
    }
}
