<%@ Page Title="הרשמה" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="MySite.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .register-container { max-width: 500px; margin: 40px auto; padding: 30px; background-color: #ffffff; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); border-top: 4px solid #1a237e; }
        .register-title { font-size: 24px; color: #1a237e; text-align: center; margin-bottom: 20px; font-weight: bold; }
        .reg-table { width: 100%; border-spacing: 0 10px; }
        .form-input { width: 100%; padding: 10px; font-size: 15px; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box; }
        .btn-submit { width: 100%; padding: 12px; background-color: #1a237e; color: white; border: none; border-radius: 4px; font-size: 18px; cursor: pointer; transition: 0.3s; }
        .btn-submit:hover { background-color: #283593; }
        .error-msg { color: #d32f2f; font-size: 12px; display: block; margin-top: 4px; }
    </style>

    <div class="register-container">
        <h2 class="register-title">יצירת חשבון חדש</h2>
        
        <table class="reg-table">
            <tr>
                <td>שם פרטי:</td>
                <td>
                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-input" placeholder="הכנס שם פרטי" />
                    <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="txtFirstName" ErrorMessage="חובה להזין שם פרטי" CssClass="error-msg" Display="Dynamic" />
                </td>
            </tr>
            <tr>
                <td>שם משפחה:</td>
                <td>
                    <asp:TextBox ID="txtLastName" runat="server" CssClass="form-input" placeholder="הכנס שם משפחה" />
                    <asp:RequiredFieldValidator ID="rfv2" runat="server" ControlToValidate="txtLastName" ErrorMessage="חובה להזין שם משפחה" CssClass="error-msg" Display="Dynamic" />
                </td>
            </tr>
            <tr>
                <td>אימייל:</td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input" placeholder="email@example.com" />
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="חובה להזין אימייל" CssClass="error-msg" Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="rev1" runat="server" ControlToValidate="txtEmail" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="כתובת אימייל לא תקינה" CssClass="error-msg" Display="Dynamic" />
                </td>
            </tr>
            <tr>
                <td>סיסמה:</td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-input" TextMode="Password" placeholder="בחר סיסמה" />
                    <asp:RequiredFieldValidator ID="rfv3" runat="server" ControlToValidate="txtPassword" ErrorMessage="חובה לבחור סיסמה" CssClass="error-msg" Display="Dynamic" />
                </td>
            </tr>
            <tr>
                <td>טלפון:</td>
                <td>
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-input" placeholder="למשל: 0501234567" />
                    <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhone" ErrorMessage="חובה להזין טלפון" CssClass="error-msg" Display="Dynamic" />
                </td>
            </tr>
            <tr>
                <td>גיל:</td>
                <td>
                    <asp:TextBox ID="txtAge" runat="server" CssClass="form-input" placeholder="הכנס גיל" />
                    <asp:RangeValidator ID="rv1" runat="server" ControlToValidate="txtAge" 
                        MinimumValue="1" MaximumValue="120" Type="Integer" ErrorMessage="גיל לא תקין" CssClass="error-msg" Display="Dynamic" />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="padding-top: 20px;">
                    <asp:Button ID="btnRegister" runat="server" Text="הרשמה" OnClick="BtnRegister_Click" CssClass="btn-submit" />
                </td>
            </tr>
        </table>
        
        <div style="text-align: center; margin-top: 15px;">
            <asp:Label ID="lblMessage" runat="server" Font-Bold="true"></asp:Label>
        </div>
    </div>
</asp:Content>