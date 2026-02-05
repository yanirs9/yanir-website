<%@ Page Title="כניסה למערכת" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="MySite.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .login-container {
            max-width: 450px;
            margin: 60px auto;
            padding: 40px;
            background-color: #ffffff;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.1);
            border-top: 5px solid #6c5ce7; /* הסגול המזוהה איתך */
            text-align: center;
        }

        .login-title {
            font-size: 28px;
            color: #1e293b;
            margin-bottom: 30px;
            font-weight: bold;
            letter-spacing: 1px;
        }

        .login-table {
            width: 100%;
            border-spacing: 0 20px;
        }

        .form-input {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #e2e8f0;
            border-radius: 10px;
            font-size: 16px;
            transition: all 0.3s ease;
            box-sizing: border-box;
        }

        .form-input:focus {
            border-color: #6c5ce7;
            outline: none;
            box-shadow: 0 0 10px rgba(108, 92, 231, 0.2);
        }

        .btn-login {
            width: 100%;
            padding: 14px;
            background: #6c5ce7;
            color: white;
            border: none;
            border-radius: 12px;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s;
            margin-top: 10px;
        }

        .btn-login:hover {
            background: #5a4ad1;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(108, 92, 231, 0.3);
        }

        .register-link {
            display: block;
            margin-top: 20px;
            color: #64748b;
            text-decoration: none;
            font-size: 14px;
        }

        .register-link span {
            color: #6c5ce7;
            font-weight: bold;
        }

        .error-message {
            color: #ff7675;
            margin-top: 15px;
            font-weight: bold;
        }
    </style>

    <div class="login-container">
        <h2 class="login-title">LOGIN SYSTEM</h2>
        
        <table class="login-table">
            <tr>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input" placeholder="כתובת אימייל"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-input" TextMode="Password" placeholder="סיסמה"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnLogin" runat="server" Text="התחברות" CssClass="btn-login" OnClick="BtnLogin_Click" />
                </td>
            </tr>
        </table>

        <asp:Label ID="lblError" runat="server" CssClass="error-message"></asp:Label>

        <a href="Register.aspx" class="register-link">
            עדיין אין לך חשבון? <span>הירשם עכשיו</span>
        </a>
    </div>
</asp:Content>