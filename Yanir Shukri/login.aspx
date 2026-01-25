<%@ Page Title="כניסה" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="MySite.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="register-container">
        <h2 class="register-title">כניסה למערכת</h2>
        <hr />
        <table class="reg-table">
            <tr>
                <td>שם משתמש (אימייל):</td>
                <td><asp:TextBox ID="txtEmail" runat="server" CssClass="form-input" placeholder="הכנס אימייל" /></td>
            </tr>
            <tr>
                <td>סיסמה:</td>
                <td><asp:TextBox ID="txtPassword" runat="server" CssClass="form-input" TextMode="Password" placeholder="הכנס סיסמה" /></td>
            </tr>
            <tr>
                <td colspan="2" style="padding-top: 20px;">
                    <asp:Button ID="btnLogin" runat="server" Text="התחברות" OnClick="btnLogin_Click" CssClass="btn-submit" />
                </td>
            </tr>
        </table>
        <div style="text-align: center; margin-top: 20px;">
            <asp:Label ID="lblLoginMessage" runat="server" ForeColor="Red"></asp:Label>
        </div>
    </div>
</asp:Content>