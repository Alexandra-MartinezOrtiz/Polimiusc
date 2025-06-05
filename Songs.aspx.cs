using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebAppPoliMusicV2
{
    public partial class Songs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Validar sesión
                if (Session[Constants.USER] != null)
                {
                    lblNombreCompleto.Text = Session[Constants.USER].ToString();
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }

                // Cargar canciones
                CargarCanciones();
            }
        }

        private void CargarCanciones()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["BDD_PoliMusicConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT ID_SONG, SONG_NAME, SONG_PATH, PLAYS FROM TBL_SONG";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        gridViewSongs.DataSource = dt;
                        gridViewSongs.DataBind();
                    }
                }
            }
        }

        protected void linkButtonCloseSession_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
    }
} 