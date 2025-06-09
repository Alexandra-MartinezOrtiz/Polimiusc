using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppPoliMusicV2
{
    public partial class Song : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string songName = Request.QueryString["name"];
                string songFile = Request.QueryString["file"];

                if (!string.IsNullOrEmpty(songName) && !string.IsNullOrEmpty(songFile))
                {
                    lblSongName.Text = songName;
                    audioSource.Attributes["src"] = "/SongFiles/" + songFile;
                }
                else
                {
                    lblSongName.Text = "No se encontró la canción.";
                }
            }
        }
    }
}