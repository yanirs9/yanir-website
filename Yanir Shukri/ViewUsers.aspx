<%@ Page Title="ניהול משתמשים" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="ViewUsers.aspx.cs" Inherits="MySite.ViewUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .view-container { 
            max-width: 1000px; 
            margin: 40px auto; 
            padding: 30px; 
            background-color: #ffffff; 
            border-radius: 20px; 
            box-shadow: 0 10px 30px rgba(0,0,0,0.1); 
            border-top: 5px solid #6c5ce7; 
        }
        .view-title { font-size: 28px; color: #1e293b; text-align: center; margin-bottom: 20px; font-weight: bold; }
        
        /* עיצוב הטבלה */
        .users-grid { width: 100%; border-collapse: collapse; margin-top: 20px; font-size: 14px; }
        .users-grid th { background-color: #6c5ce7; color: white; padding: 12px; text-align: right; }
        .users-grid td { padding: 12px; border-bottom: 1px solid #e2e8f0; color: #334155; }
        .users-grid tr:hover { background-color: #f8fafc; }
        
        .back-link { display: inline-block; margin-bottom: 20px; color: #6c5ce7; text-decoration: none; font-weight: bold; }
    </style>

    <div class="view-container">
        <a href="Admin.aspx" class="back-link">➜ חזרה לפאנל ניהול</a>
        <h2 class="view-title">רשימת משתמשים רשומים</h2>
        
        <div style="overflow-x: auto;">
            <asp:GridView ID="gvUsers" runat="server" CssClass="users-grid" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="txtFirstName" HeaderText="שם פרטי" />
                    <asp:BoundField DataField="txtLastName" HeaderText="שם משפחה" />
                    <asp:BoundField DataField="txtEmail" HeaderText="אימייל" />
                    <asp:BoundField DataField="txtPhone" HeaderText="טלפון" />
                    <asp:BoundField DataField="txtAge" HeaderText="גיל" />
                </Columns>
            </asp:GridView>
        </div>
        
        <div style="text-align: center; margin-top: 20px;">
            <asp:Label ID="lblCount" runat="server" Font-Bold="true"></asp:Label>
        </div>
    </div>
</asp:Content>