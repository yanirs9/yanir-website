<%@ Page Title="דף הבית" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="MySite.DefaultPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="text-align:center; padding: 50px;">
        <h1>ברוכים הבאים לאתר שלי!</h1>
        <hr />

        <% if (Session["user"] != null) { %>
            <%-- הודעה למשתמש מחובר --%>
            <h2 style="color: green;">שלום, <%= Session["user"].ToString() %>! התחברת בהצלחה.</h2>
        <% } else { %>
            <%-- הודעה לאורח עם קישורי מעבר --%>
            <h2 style="color: navy;">שלום אורח, אנא התחבר כדי לצפות בתוכן האישי.</h2>
            
            <div style="margin-top: 30px; border: 1px solid #e2e8f0; padding: 20px; display: inline-block; border-radius: 15px;">
                <p style="font-size: 18px;">
                    עדיין אין לך חשבון? 
                    <a href="Register.aspx" style="color: #6c5ce7; font-weight: bold; text-decoration: none;">הירשם עכשיו</a>
                </p>
                <p style="font-size: 18px; margin-top: 10px;">
                    כבר נרשמת בעבר? 
                    <a href="Login.aspx" style="color: #1e293b; font-weight: bold; text-decoration: none;">התחבר כאן</a>
                </p>
            </div>
        <% } %>

        <br /><br />
        <p>זהו דף הבית של המערכת שלך.</p>
    </div>
</asp:Content>