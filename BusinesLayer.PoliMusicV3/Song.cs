using System;
using System.Collections.Generic;
using System.Text;

namespace BusinesLayer.PoliMusicV3
{
    public class Song
    {

        private readonly string _conn;

        public Song(string connectionString)
        {
            _conn = connectionString;
        }

        public List<EntityLayer.PoliMusicV3.Song> ObtenerCanciones()
        {
            return new DataAccess.PoliMusicV3.Song(_conn).GetAll();
        }
    }
}
