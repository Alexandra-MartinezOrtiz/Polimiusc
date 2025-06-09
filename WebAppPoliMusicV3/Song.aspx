<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Songs.aspx.cs" Inherits="WebAppPoliMusicV3.Songs" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Songs - PoliMusic V3</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #00284D, #1CB36E);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            background-color: rgba(0, 0, 0, 0.75);
            padding: 40px;
            border-radius: 20px;
            width: 90%;
            max-width: 1000px;
            box-shadow: 0 0 20px rgba(0,0,0,0.5);
            color: white;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        .header h2 {
            margin: 0;
            font-size: 24px;
        }

        .logout-button {
            background-color: #2F725E;
            color: white;
            padding: 8px 16px;
            text-decoration: none;
            border-radius: 6px;
            border: none;
            cursor: pointer;
        }

        .logout-button:hover {
            background-color: #246350;
        }

        .songs-title {
            text-align: center;
            font-size: 22px;
            margin-bottom: 20px;
            color: #fff;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
        }

        .table th, .table td {
            padding: 12px 15px;
            border-bottom: 1px solid #555;
            text-align: left;
            color: #f1f1f1;
        }

        .table th {
            background-color: #1CB36E;
            color: #000;
        }

        .table tr:hover {
            background-color: rgba(255, 255, 255, 0.1);
        }

        audio {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="header">
                <h2>Bienvenido, usuario: <asp:Label ID="lblNombreCompleto" runat="server" /></h2>
                <asp:LinkButton ID="linkButtonCloseSession" runat="server" OnClick="linkButtonCloseSession_Click" CssClass="logout-button">Cerrar sesión</asp:LinkButton>
            </div>

            

            <asp:GridView ID="gridViewSongs" runat="server" AutoGenerateColumns="False" CssClass="table">
                <Columns>
                    <asp:BoundField DataField="IdSong" HeaderText="ID_SONG" />
                    <asp:BoundField DataField="SongName" HeaderText="SONG_NAME" />
                    <asp:BoundField DataField="SongPath" HeaderText="SONG_PATH" />
                    <asp:BoundField DataField="Plays" HeaderText="PLAYS" />
                    <asp:TemplateField HeaderText="Reproducir">
                        <ItemTemplate>
                            <audio controls style="width: 200px;">
                                <source src='<%# ResolveUrl("~/songFiles/" + System.IO.Path.GetFileName(Eval("SongPath").ToString())) %>' type="audio/mpeg" />
                                Tu navegador no soporta audio HTML5.
                            </audio>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
