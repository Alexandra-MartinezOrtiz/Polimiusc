<%@ Language=VBScript %>
<%
If Session("username") = "" Then
    Response.Redirect "login.asp"
End If

Dim conn, rs, sql
Set conn = Server.CreateObject("ADODB.Connection")
Set rs = Server.CreateObject("ADODB.Recordset")

Dim connectionString
connectionString = "Provider=SQLOLEDB;Data Source=localhost;Initial Catalog=BDD_PoliMusic_GR2;User ID=usr_polimusic_gr2;Password=Politecnica1;"
conn.Open connectionString

sql = "SELECT ID_SONG, SONG_NAME, SONG_PATH, PLAYS FROM TBL_SONG ORDER BY SONG_NAME"
Set rs = conn.Execute(sql)
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>🌷 Canciones | PoliMusic</title>
    <style>
        body {
            font-family: 'Comic Sans MS', cursive, sans-serif;
            background: linear-gradient(to right, #f9d5ec, #fceff9);
            color: #5c3c92;
            margin: 0;
            padding: 40px;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #fff0f6;
            padding: 15px 30px;
            border-bottom: 2px dashed #e0aaff;
            margin-bottom: 40px;
            border-radius: 10px;
        }

        .user-info {
            font-size: 16px;
            font-weight: bold;
            color: #b030b0;
        }

        .logout-btn {
            background-color: #ff85c1;
            color: white;
            border: none;
            padding: 8px 14px;
            border-radius: 8px;
            font-weight: bold;
            cursor: pointer;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }

        .logout-btn:hover {
            background-color: #e26ba3;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            font-weight: 600;
            color: #a052d4;
        }

        .song-table {
            width: 90%;
            margin: auto;
            border-collapse: collapse;
            background-color: #ffffffcc;
            box-shadow: 0 3px 12px rgba(0, 0, 0, 0.1);
            border-radius: 12px;
            overflow: hidden;
        }

        .song-table th, .song-table td {
            padding: 14px;
            text-align: center;
            border-bottom: 1px dashed #f3c4e0;
        }

        .song-table th {
            background-color: #f3c4e0;
            color: #4a005f;
            font-weight: bold;
        }

        audio {
            width: 100%;
        }

        .player {
            width: 200px;
        }
    </style>
</head>
<body>

    <header>
        <div class="user-info">✨ Hola, <%= Session("username") %> 💖</div>
        <form method="post" action="logout.asp">
            <input type="submit" value="Cerrar sesión" class="logout-btn" />
        </form>
    </header>

    <h2>🌈 ¡Disfruta tu música favorita!</h2>

    <table class="song-table">
        <tr>
            <th>#</th>
            <th>🎵 Título</th>
            <th>👁 Reproducciones</th>
            <th>🔊 Escuchar</th>
        </tr>
        <%
        Dim index
        index = 1
        Do Until rs.EOF
        %>
        <tr>
            <td><%= index %></td>
            <td><%= rs("SONG_NAME") %></td>
            <td><%= rs("PLAYS") %></td>
            <td>
                <audio controls class="player">
                    <source src="<%= rs("SONG_PATH") %>" type="audio/mpeg">
                    Tu navegador no soporta este tipo de audio.
                </audio>
            </td>
        </tr>
        <%
            index = index + 1
            rs.MoveNext
        Loop
        rs.Close
        conn.Close
        Set rs = Nothing
        Set conn = Nothing
        %>
    </table>

</body>
</html>
