using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebAppPoliMusicV3
{
    public partial class Songs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Validar sesión
                if (Session[EntityLayer.PoliMusicV3.Util.Constants.USER] != null)
                {
                    var user = (EntityLayer.PoliMusicV3.User)Session[EntityLayer.PoliMusicV3.Util.Constants.USER];
                    lblNombreCompleto.Text = user.UserName;
                }
                else
                {
                    Response.Redirect("Login.aspx", false);
                    Context.ApplicationInstance.CompleteRequest();
                    return;
                }

                CargarCanciones();
            }
        }

        private void CargarCanciones()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["BDD_PoliMusicConnectionString"].ConnectionString;

            var songBL = new BusinesLayer.PoliMusicV3.Song(connectionString);
            var canciones = songBL.ObtenerCanciones();

            gridViewSongs.DataSource = canciones;
            gridViewSongs.DataBind();
        }


        protected void linkButtonCloseSession_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Login.aspx", false);
            Context.ApplicationInstance.CompleteRequest();
        }
    }
}
