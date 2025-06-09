using System;
using System.Configuration;
using System.Data;
using System.Web.Security;
using System.Web.UI;

namespace WebAppPoliMusicV3
{
    public partial class Login : System.Web.UI.Page
    {
        string strConnString = ConfigurationManager.ConnectionStrings["BDD_PoliMusicConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                txtLogin.Text = "Alexandra.Martinez";
                txtPassword.Text = "123";
                txtPassword.Attributes.Add("value", txtPassword.Text);

                lblMessage.Text = string.Empty;
            }
        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            string login = txtLogin.Text;
            string password = txtPassword.Text;

            if (string.IsNullOrEmpty(login) || string.IsNullOrEmpty(password))
            {
                lblMessage.Text = "Please, write a login/password.";
                return;
            }

            // Compatibilidad con .NET Framework 2.0 usando SHA1
            password = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "SHA1");
            System.Console.WriteLine("Este es mi pasword sha1:" + password);
            DataTable dtUser = new BusinesLayer.PoliMusicV3.User(strConnString).AuthenticateUser(login, password);

            if (dtUser != null && dtUser.Rows.Count > 0)
            {
                EntityLayer.PoliMusicV3.User user = new EntityLayer.PoliMusicV3.User();
                user.ID = Convert.ToInt32(dtUser.Rows[0]["ID_USER"]);
                user.UserName = login;
                user.Photo = dtUser.Rows[0]["USER_PHOTO"].ToString();
                user.Email = dtUser.Rows[0]["EMAIL"].ToString();
                user.Birthday = dtUser.Rows[0]["BIRTHDAY"].ToString();
                user.UserType = Convert.ToInt32(dtUser.Rows[0]["USER_TYPE"]);

                Session["USER"] = user;

                FormsAuthentication.RedirectFromLoginPage(login, true);

                if (user.UserType == 0) // ID_USER_NORMAL
                {
                    // Usuario normal
                    // Ya redirigido por FormsAuthentication
                }
                else if (user.UserType == 1) // ID_USER_ADMIN
                {
                    Response.Redirect("~/DesktopAdmin.aspx?uid=" + user.ID, true);
                }
                else
                {
                    lblMessage.Text = "Login/password incorrect, try again.";
                    return;
                }
            }
            else
            {
                lblMessage.Text = "Login/password incorrect, try again.";
                return;
            }

            lblMessage.Text = string.Empty;
        }

        protected void LinkButtonNewUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("SignUp.aspx", true);
        }
    }
}
