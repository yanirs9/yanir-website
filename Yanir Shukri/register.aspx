<%@ Page Title="הרשמה" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="MySite.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>דף הרשמה</h2>

    <asp:Label Text="שם פרטי:" runat="server" /><br />
    <asp:TextBox ID="txtFirstName" runat="server" /><br /><br />

    <asp:Label Text="שם משפחה:" runat="server" /><br />
    <asp:TextBox ID="txtLastName" runat="server" /><br /><br />

    <asp:Label Text="אימייל:" runat="server" /><br />
    <asp:TextBox ID="txtEmail" runat="server" /><br /><br />

    <asp:Label Text="טלפון:" runat="server" /><br />
    <asp:TextBox ID="txtPhone" runat="server" /><br /><br />

    <asp:Label Text="גיל:" runat="server" /><br />
    <asp:TextBox ID="txtAge" runat="server" /><br /><br />

    <asp:Button Text="הרשמה" runat="server" OnClick="BtnRegister_Click" /><br /><br />

    <asp:Label 
    ID="lblMessage" 
    runat="server" 
    ForeColor="Green">
</asp:Label>

</asp:Content>

