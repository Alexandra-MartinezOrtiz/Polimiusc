<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Song.aspx.cs" Inherits="WebAppPoliMusicV2.Song" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Canción Seleccionada</h2>
    <asp:Label ID="lblSongName" runat="server" Font-Size="Large" />
    <br /><br />
    <audio controls>
        <source id="audioSource" runat="server" type="audio/mpeg" />
        Tu navegador no soporta audio HTML5.
    </audio>
        </div>
    </form>
</body>
</html>
