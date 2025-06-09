<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="WebAppPoliMusicV3.SignUp" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registro - PoliMusic</title>
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

        .signup-container {
            background-color: rgba(0, 0, 0, 0.75);
            padding: 40px;
            border-radius: 20px;
            width: 90%;
            max-width: 500px;
            box-shadow: 0 0 20px rgba(0,0,0,0.5);
            color: white;
        }

        .signup-container h2 {
            text-align: center;
            font-size: 26px;
            margin-bottom: 30px;
            color: #1CB36E;
        }

        .signup-input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 6px;
            border: none;
            font-size: 16px;
        }

        .signup-button {
            width: 100%;
            padding: 10px;
            background-color: #1CB36E;
            color: black;
            border: none;
            border-radius: 6px;
            font-weight: bold;
            font-size: 16px;
            cursor: pointer;
        }

        .signup-button:hover {
            background-color: #17a365;
        }

        .link {
            display: block;
            margin-top: 15px;
            color: #00e5ff;
            text-align: center;
            text-decoration: none;
        }

        .link:hover {
            text-decoration: underline;
        }

        .error-label {
            color: #ff4d4d;
            font-weight: bold;
            text-align: center;
            margin-top: 10px;
        }

        .link-button {
            display: block;
            margin-top: 15px;
            color: #00e5ff;
            text-decoration: none;
            font-size: 12px;
        }

        .link-button:hover {
            text-decoration: underline;
        }

    </style>
</head>
<body>
    <form id="formLogin" runat="server">
        <div class="signup-container">
            <h2>Registro de nuevo usuario</h2>

            <asp:TextBox ID="txtUserName" runat="server" CssClass="signup-input" placeholder="Nombre de usuario*"></asp:TextBox>

            <asp:TextBox ID="txtEmail" runat="server" CssClass="signup-input" placeholder="Correo electrónico*"></asp:TextBox>

            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="signup-input" placeholder="Contraseña*"></asp:TextBox>

            <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="signup-input" placeholder="Confirmar contraseña*"></asp:TextBox>

            <asp:TextBox ID="txtBirthDate" runat="server" CssClass="signup-input" placeholder="Fecha de nacimiento (dd/MM/yyyy)"></asp:TextBox>

            <asp:FileUpload ID="fupPhoto" runat="server" CssClass="signup-input" />

            <asp:Button ID="btnSumbit" runat="server" Text="Registrarse" CssClass="signup-button" OnClick="btnSumbit_Click" />

            <asp:HyperLink ID="HyperLink1" NavigateUrl="~/Login.aspx" runat="server" CssClass="link">Volver al login</asp:HyperLink>



            <asp:Panel ID="frmConfirmation" Visible="true" Runat="server">
                <asp:Label id="lblMessage" CssClass="error-label" Runat="server"></asp:Label>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
