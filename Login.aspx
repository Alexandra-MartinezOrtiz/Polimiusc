<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebAppPoliMusicV2.Login" %>
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
            background: linear-gradient(135deg, #00284D, #1CB36E);
        }

        .login-box {
            background-color: rgba(0, 0, 0, 0.75);
            padding: 40px 30px;
            border-radius: 15px;
            text-align: center;
            width: 320px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.6);
        }

        .login-box img {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            margin-bottom: 20px;
        }

        .login-box .input-field {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border-radius: 8px;
            border: none;
            outline: none;
            background-color: #f1f1f1;
            font-size: 14px;
        }

        .login-box .login-button {
            width: 100%;
            padding: 12px;
            margin-top: 20px;
            background-color: #2F725E;
            color: white;
            font-weight: bold;
            border: none;
            border-radius: 8px;
            cursor: pointer;
        }

        .login-box .login-button:hover {
            background-color: #246350;
        }

        .login-box .options {
            display: flex;
            justify-content: space-between;
            font-size: 12px;
            color: #ccc;
            margin-top: 10px;
        }

        .error-message {
            color: #ff4d4d;
            font-size: 12px;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <form id="formLogin" runat="server">
        <div class="login-box">
            <img src="https://cdn-icons-png.flaticon.com/512/847/847969.png" alt="User Icon" />
            <asp:TextBox ID="txtUsername" runat="server" placeholder="Username" CssClass="input-field"></asp:TextBox>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password" CssClass="input-field"></asp:TextBox>

            <div class="options">
                <span><input type="checkbox" /> Remember me</span>
                <a href="#" style="color: #ccc;">Forgot Password?</a>
            </div>

            <asp:Button ID="btnLogin" runat="server" Text="LOGIN" CssClass="login-button" OnClick="btnLogin_Click" />

            <asp:Label ID="lblErrorMessage" runat="server" CssClass="error-message"></asp:Label>
        </div>
    </form>
</body>
</html>
