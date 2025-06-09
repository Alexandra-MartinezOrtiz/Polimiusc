using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;

namespace DataAccess.PoliMusicV3
{
    public class Song
    {
        private string _conn;

        public Song(string connectionString)
        {
            _conn = connectionString;
        }

        public List<EntityLayer.PoliMusicV3.Song> GetAll()
        {
            List<EntityLayer.PoliMusicV3.Song> songs = new List<EntityLayer.PoliMusicV3.Song>();

            using (SqlConnection con = new SqlConnection(_conn))
            {
                SqlCommand cmd = new SqlCommand("SELECT ID_SONG, SONG_NAME, SONG_PATH, PLAYS FROM TBL_SONG", con);
                con.Open();

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        songs.Add(new EntityLayer.PoliMusicV3.Song
                        {
                            IdSong = (int)reader["ID_SONG"],
                            SongName = reader["SONG_NAME"].ToString(),
                            SongPath = reader["SONG_PATH"].ToString(),
                            Plays = reader["PLAYS"] != DBNull.Value ? (int)reader["PLAYS"] : 0
                        });
                    }
                }
            }

            return songs;
        }
    }
}
