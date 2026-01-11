<%@ Page Title="כניסה" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="MySite.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>כניסת משתמשים</h2>
    <hr />
    
    <div>
        שם משתמש: <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
        <br /><br />
        
        סיסמה: <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
        <br /><br />
        
        <asp:Button ID="btnLogin" runat="server" Text="התחבר" OnClick="btnLogin_Click" />
        <br /><br />
        
        <asp:Label ID="lblLoginMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
    </div>
</asp:Content>