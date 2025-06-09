<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebAppPoliMusicV3.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login - PoliMusic</title>
    <style>
        body {
            margin: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #013220, #1CB36E);
        }

        .login-card {
            background-color: #072c23;
            padding: 40px 30px;
            border-radius: 20px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.6);
            width: 340px;
            text-align: center;
            color: white;
        }

        .login-card img {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            margin-bottom: 30px;
        }

        .input-container {
            position: relative;
            margin-bottom: 20px;
        }

        .input-field {
            width: 100%;
            padding: 12px 42px 12px 12px; /* espacio a la derecha para el ícono */
            border: none;
            border-radius: 10px;
            background-color: #f1f1f1;
            font-size: 14px;
            box-sizing: border-box;
        }

        .toggle-password {
            position: absolute;
            top: 50%;
            right: 12px;
            transform: translateY(-50%);
            background: none;
            border: none;
            padding: 0;
            font-size: 18px;
            cursor: pointer;
            color: #555;
            height: 24px;
            width: 24px;
            line-height: 1;
        }

        .login-button {
            width: 100%;
            padding: 12px;
            background-color: #2F725E;
            color: white;
            font-weight: bold;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            margin-top: 10px;
        }

        .login-button:hover {
            background-color: #246350;
        }

        .options {
            display: flex;
            justify-content: space-between;
            font-size: 12px;
            color: #ccc;
            margin: 10px 0 20px 0;
        }

        .options a {
            color: #ccc;
            text-decoration: none;
        }

        .options a:hover {
            text-decoration: underline;
        }

        .error-label {
            color: #ff4d4d;
            font-size: 12px;
            margin-top: 10px;
        }

        .link-button {
            display: block;
            margin-top: 20px;
            color: #00e5ff;
            text-decoration: none;
            font-size: 12px;
        }

        .link-button:hover {
            text-decoration: underline;
        }

    </style>

    <script type="text/javascript">
        function togglePassword() {
            var pwd = document.getElementById('<%= txtPassword.ClientID %>');
            var icon = document.getElementById('eyeIcon');
            if (pwd.type === "password") {
                pwd.type = "text";
                icon.innerText = '🙈';
            } else {
                pwd.type = "password";
                icon.innerText = '👁️';
            }
        }
    </script>
</head>
<body>
    <form id="formLogin" runat="server">
        <div class="login-card">
            <img src="https://cdn-icons-png.flaticon.com/512/847/847969.png" alt="User Icon" />

            <div class="input-container">
                <asp:TextBox ID="txtLogin" runat="server" CssClass="input-field" placeholder="Username"></asp:TextBox>
            </div>

           <div class="input-container">
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="input-field" placeholder="Password"></asp:TextBox>
                <button type="button" id="eyeIcon" class="toggle-password" onclick="togglePassword()">👁️</button>
            </div>

            <div class="options">
                <span><input type="checkbox" /> Remember me</span>
                <a href="#">Forgot Password?</a>
            </div>

            <asp:LinkButton ID="LinkButtonNewUser" runat="server" CssClass="link-button" OnClick="LinkButtonNewUser_Click">
                ¿No tienes cuenta? Regístrate aquí
            </asp:LinkButton>


            <asp:Button ID="btnLogin" runat="server" Text="LOGIN" CssClass="login-button" OnClick="BtnLogin_Click" />

            <asp:Label ID="lblMessage" runat="server" CssClass="error-label"></asp:Label>
        </div>
    </form>
</body>
</html>
