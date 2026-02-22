<%@ Page Title="פאנל ניהול" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="MySite.Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .admin-container { 
            max-width: 800px; 
            margin: 40px auto; 
            padding: 30px; 
            background-color: #ffffff; 
            border-radius: 20px; 
            box-shadow: 0 10px 30px rgba(0,0,0,0.1); 
            border-top: 5px solid #6c5ce7; 
            text-align: center;
        }
        .admin-title { font-size: 28px; color: #1e293b; margin-bottom: 10px; font-weight: bold; }
        .admin-subtitle { color: #64748b; margin-bottom: 30px; }
        
        .admin-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }
        .admin-card {
            padding: 20px;
            border: 1px solid #e2e8f0;
            border-radius: 15px;
            transition: 0.3s;
            text-decoration: none;
            color: #1e293b;
        }
        .admin-card:hover {
            border-color: #6c5ce7;
            background-color: #f8fafc;
            transform: translateY(-5px);
        }
        .admin-card h3 { color: #6c5ce7; margin-bottom: 10px; }
        
        /* עיצוב החיפוש החדש */
        .search-box { margin: 20px 0; padding: 15px; border: 1px solid #e2e8f0; border-radius: 12px; display: flex; gap: 10px; justify-content: center; }
        .input-search { padding: 8px; border: 1px solid #cbd5e1; border-radius: 8px; }
    </style>

    <div class="admin-container">
        <h2 class="admin-title">שלום, מנהל המערכת</h2>
        <p class="admin-subtitle">כאן תוכל לנהל את המשתמשים ולצפות בנתוני האתר</p>
        
        <div class="search-box">
            <asp:TextBox ID="txtSearchFName" runat="server" placeholder="שם פרטי" CssClass="input-search" />
            <asp:TextBox ID="txtSearchLName" runat="server" placeholder="שם משפחה" CssClass="input-search" />
            <asp:Button ID="btnSearch" runat="server" Text="חפש במערכת" OnClick="BtnSearch_Click" 
                style="padding: 8px 15px; background: #6c5ce7; color: white; border: none; border-radius: 8px; cursor: pointer;" />
        </div>

        <hr style="border: 0; border-top: 1px solid #e2e8f0;" />

        <div class="admin-grid">
            <a href="ViewUsers.aspx" class="admin-card">
                <h3>👥 ניהול משתמשים</h3>
                <p>צפייה בכל הרשומים, עריכה ומחיקה</p>
            </a>
            <a href="Statistics.aspx" class="admin-card">
                <h3>📊 סטטיסטיקה</h3>
                <p>ניתוח נתוני הרשמה ופעילות</p>
            </a>
            <a href="Settings.aspx" class="admin-card">
                <h3>⚙️ הגדרות אתר</h3>
                <p>שינוי הגדרות מערכת כלליות</p>
            </a>
        </div>

        <div style="margin-top: 40px;">
            <asp:Button ID="btnLogout" runat="server" Text="התנתק מהמערכת" OnClick="btnLogout_Click" 
                style="padding: 10px 20px; background: #ef4444; color: white; border: none; border-radius: 8px; cursor: pointer;" />
        </div>
    </div>
</asp:Content>