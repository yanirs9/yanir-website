<%@ Page Title="דף הבית" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="MySite.DefaultPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="text-align:center; padding: 50px;">
        <h1>ברוכים הבאים לאתר שלי!</h1>
        <hr />
        
        <%-- בדיקה אם יש משתמש מחובר ב-Session --%>
        <% if (Session["user"] != null) { %>
            <h2 style="color: green;">שלום, <%= Session["user"].ToString() %>! התחברת בהצלחה.</h2>
        <% } else { %>
            <h2 style="color: navy;">שלום אורח, אנא התחבר כדי לצפות בתוכן האישי.</h2>
        <% } %>
        
        <br />
        <p>זהו דף הבית של המערכת שלך.</p>
    </div>
</asp:Content>