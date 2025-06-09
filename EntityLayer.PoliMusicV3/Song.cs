using System;
using System.Collections.Generic;
using System.Text;

namespace EntityLayer.PoliMusicV3
{
    public class Song
    {
        public int IdSong { get; set; }
        public string SongName { get; set; }
        public string SongPath { get; set; }
        public int Plays { get; set; }
    }
}
