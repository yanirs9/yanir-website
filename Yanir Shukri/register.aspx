<%@ Page Title="הרשמה" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="MySite.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>דף הרשמה למערכת</h2>
    <hr />
    <table style="width: 100%; border: none;">
        <tr>
            <td>שם פרטי:</td>
            <td><asp:TextBox ID="txtFirstName" runat="server" /></td>
        </tr>
        <tr>
            <td>שם משפחה:</td>
            <td><asp:TextBox ID="txtLastName" runat="server" /></td>
        </tr>
        <tr>
            <td>אימייל:</td>
            <td><asp:TextBox ID="txtEmail" runat="server" /></td>
        </tr>
        <tr>
            <td>טלפון:</td>
            <td><asp:TextBox ID="txtPhone" runat="server" /></td>
        </tr>
        <tr>
            <td>גיל:</td>
            <td><asp:TextBox ID="txtAge" runat="server" /></td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnRegister" runat="server" Text="הרשמה" OnClick="BtnRegister_Click" />
            </td>
        </tr>
    </table>
    
    <br />
    <asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label>
</asp:Content>