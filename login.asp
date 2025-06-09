<%@ Language=VBScript %>
<% Response.CharSet = "UTF-8" %>
<%
' Iniciar la sesión
Session.Timeout = 20

' Verificar si se enviaron datos
If Request.Form("submit") <> "" Then
    Dim conn, rs, username, password, sql
    username = Request.Form("username")
    password = Request.Form("password")

    ' Crear conexión a la base de datos
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=SQLOLEDB;Data Source=localhost;Initial Catalog=BDD_PoliMusic_GR2;User ID=usr_polimusic_gr2;Password=Politecnica1;"

    ' Validar usuario
    sql = "SELECT * FROM TBL_USER WHERE USERNAME='" & username & "' AND PASSWORD='" & password & "'"
    Set rs = conn.Execute(sql)

    If Not rs.EOF Then
        Session("username") = rs("USERNAME")
        Response.Redirect("songs.asp")
    Else
        msg = "Usuario o contraseña incorrectos"
    End If

    rs.Close
    Set rs = Nothing
    conn.Close
    Set conn = Nothing  
End If
%>

<!DOCTYPE html>
<html>
<head>
    <title>Login PoliMusic</title>
    <style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f5f5f5;
        padding: 50px;
    }

    .login-box {
        background: white;
        padding: 30px;
        border-radius: 10px;
        width: 320px;
        margin: auto;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }

    h2 {
        text-align: center;
        margin-bottom: 20px;
        font-weight: 600;
    }

    label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
    }

    input[type=text],
    input[type=password] {
        width: 100%;
        padding: 10px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
    }

    input[type=submit] {
        background-color: #28a745;
        color: white;
        padding: 10px;
        border: none;
        width: 100%;
        font-weight: bold;
        font-size: 15px;
        border-radius: 5px;
        cursor: pointer;
    }

    input[type=submit]:hover {
        background-color: #218838;
    }
</style>

</head>
<body>
    <div class="login-box">
        <h2>Login PoliMusic</h2>
        <% If msg <> "" Then %>
            <p style="color:red;"><%=msg%></p>
        <% End If %>
        <form method="post" action="login.asp">
            <label>Usuario:</label>
            <input type="text" name="username" required />
            <label>Contraseña:</label>
            <input type="password" name="password" required />
            <input type="submit" name="submit" value="Ingresar" />
        </form>
    </div>
</body>
</html>