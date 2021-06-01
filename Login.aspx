<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Revisión FOD</title>
     <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/signin.css" rel="stylesheet" />
    <style>
       body {
            background-image: url('Images/AvionDeFondo.jpg') ;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
}
    </style>
</head>
<body>

    <div class="container">
        <form class="form-signin" runat="server">
            <h3 class="alert alert-success ">Revisión FOD</h3>
            <label for="inputEmail" class="sr-only">Nombre de Usuario</label>
            <input type="text" id="inputEmail" class="form-control" placeholder="Nombre de Usuario" runat="server"
                required="required" autofocus="autofocus" />
            <label for="inputPassword" class="sr-only">Contraseña</label>
            <input type="password" runat="server" id="inputPassword" class="form-control" placeholder="Contraseña"
                required="required" />
            <asp:Label runat="server" ID="Avisos" CssClass="h4  alert-danger  " ></asp:Label>
            <br />
            <br />
            <asp:Button runat="server" CssClass="btn btn-lg btn-success btn-block" 
                Text="Entrar" ID="btnLogin" OnClick="btnLogin_Click" />

        </form>
    </div>
</body>
 


<%@ import namespace="System.Data" %>
<%@ import namespace="System.Data.SqlClient" %>

<%@ import namespace="System" %>
<%@ import namespace="System.Collections.Generic" %>
<%@ import namespace="System.Configuration" %>




<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            // Request.Cookies["user"].Expires = DateTime.Now.AddMinutes(-30);
            Request.Cookies.Remove("user");
            Session.RemoveAll();

        }
        catch (Exception ex)
        {

            Response.Write(ex.Message);
        }

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (inputEmail.Value.ToUpper() == "ADMIN" && inputPassword.Value.ToUpper() == "ADMIN@123")
        {
            Session["UserId"] = "1";
            Session["Role"] = "Admin";
            Session["UserName"] = "Admin";
            Session["IsAuth"] = "true";
            Response.Redirect("Home.aspx");
        }
        else
        {
            LoginDetails log = ValidateUser(inputEmail.Value, inputPassword.Value);
            if (log.IsAuthUser)
            {
                Session["UserId"] = log.UserId;
                Session["UserName"] = log.UserName;
                Session["IsAuth"] = log.IsAuthUser;
                Session["Role"] = log.Role;

                Response.Redirect("Home.aspx");
            }
            else
            {

               // Response.Redirect("Login.aspx");
               Avisos.Text = "Usuario o contraseña incorrecto";
            }
        }

    }

    private LoginDetails ValidateUser(string username, string password)
    {
        LoginDetails obj = new LoginDetails();
        obj.IsAuthUser = false;
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionString"].ConnectionString);

            SqlDataAdapter da;
            DataSet ds = new DataSet();
            string query= "select * from Tb_Usuarios where UserName='" + username.Trim() + "' and Pwd='" + password.Trim() + "'";
            da = new SqlDataAdapter(query, con);
            con.Open();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                obj.IsAuthUser = true;
                obj.UserName = ds.Tables[0].Rows[0]["UserName"].ToString();
                obj.UserId = int.Parse( ds.Tables[0].Rows[0]["UserId"].ToString());
                obj.Role = ds.Tables[0].Rows[0]["Role"].ToString();
            }
        }
        catch (Exception ex)
        {



            obj.IsAuthUser = false;
        }
        return obj;

    }
    private struct LoginDetails
    {
        public int UserId { get; set; }
        public string UserName { get; set; }
        public string Role { get; set; }
        public bool IsAuthUser { get; set; }

    }



</script>
</html>
