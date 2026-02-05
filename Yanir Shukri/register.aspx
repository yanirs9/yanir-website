<%@ Page Title="הרשמה" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="MySite.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .register-container { 
            max-width: 500px; 
            margin: 40px auto; 
            padding: 30px; 
            background-color: #ffffff; 
            border-radius: 20px; 
            box-shadow: 0 10px 30px rgba(0,0,0,0.1); 
            border-top: 5px solid #6c5ce7; 
            position: relative; 
        }
        .register-title { font-size: 26px; color: #1e293b; text-align: center; margin-bottom: 25px; font-weight: bold; }
        .reg-table { width: 100%; border-spacing: 0 15px; }
        .form-input { width: 100%; padding: 12px; border: 1px solid #e2e8f0; border-radius: 8px; transition: 0.3s; box-sizing: border-box; }
        .form-input:focus { border-color: #6c5ce7; outline: none; box-shadow: 0 0 8px rgba(108, 92, 231, 0.2); }
        .btn-submit { width: 100%; padding: 14px; background: #6c5ce7; color: white; border: none; border-radius: 12px; font-size: 18px; font-weight: bold; cursor: pointer; transition: 0.3s; margin-top: 20px; }
        .btn-submit:hover { background: #5a4ad1; transform: translateY(-2px); }

        .phone-group { display: flex; gap: 8px; align-items: center; }
        .prefix-dropdown { 
            width: 90px; padding: 11px; border: 1px solid #e2e8f0; border-radius: 8px; 
            background-color: #f8fafc; color: #1e293b; font-weight: 600; cursor: pointer;
        }

        /* עיצוב הקישור למטה */
        .login-footer-link {
            text-align: center; 
            margin-top: 25px; 
            border-top: 1px solid #e2e8f0; 
            padding-top: 15px;
        }
        .login-footer-link span { color: #64748b; font-size: 14px; }
        .login-footer-link a { color: #6c5ce7; font-weight: bold; text-decoration: none; font-size: 14px; }
        .login-footer-link a:hover { text-decoration: underline; }
    </style>

    <div class="register-container">
        <h2 class="register-title">יצירת חשבון</h2>
        <table class="reg-table">
            <tr>
                <td>שם פרטי:</td>
                <td><asp:TextBox ID="txtFirstName" runat="server" CssClass="form-input" /></td>
            </tr>
            <tr>
                <td>שם משפחה:</td>
                <td><asp:TextBox ID="txtLastName" runat="server" CssClass="form-input" /></td>
            </tr>
            <tr>
                <td>מספר נייד:</td>
                <td>
                    <div class="phone-group">
                        <asp:DropDownList ID="ddlPrefix" runat="server" CssClass="prefix-dropdown">
                            <asp:ListItem Text="050" Value="050" />
                            <asp:ListItem Text="052" Value="052" />
                            <asp:ListItem Text="053" Value="053" />
                            <asp:ListItem Text="054" Value="054" />
                            <asp:ListItem Text="055" Value="055" />
                            <asp:ListItem Text="058" Value="058" />
                        </asp:DropDownList>
                        <asp:TextBox ID="txtPhoneBody" runat="server" CssClass="form-input" placeholder="7 ספרות" MaxLength="7" />
                    </div>
                </td>
            </tr>
            <tr>
                <td>אימייל:</td>
                <td><asp:TextBox ID="txtEmail" runat="server" CssClass="form-input" /></td>
            </tr>
            <tr>
                <td>סיסמה:</td>
                <td><asp:TextBox ID="txtPassword" runat="server" CssClass="form-input" TextMode="Password" /></td>
            </tr>
            <tr>
                <td>גיל:</td>
                <td><asp:TextBox ID="txtAge" runat="server" CssClass="form-input" /></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnRegister" runat="server" Text="שלח רישום" OnClick="BtnRegister_Click" CssClass="btn-submit" />
                </td>
            </tr>
        </table>

        <div style="text-align: center; margin-top: 15px;">
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
        </div>

        <div class="login-footer-link">
            <span>כבר יש לך חשבון? </span>
            <a href="Login.aspx">התחבר עכשיו</a>
        </div>
    </div>
</asp:Content>