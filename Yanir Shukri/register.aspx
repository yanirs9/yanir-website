<%@ Page Title="הרשמה" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="MySite.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .register-container { max-width: 650px; margin: 40px auto; padding: 30px; background-color: #ffffff; border-radius: 10px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); }
        .register-title { font-size: 28px; color: #2c3e50; text-align: center; margin-bottom: 20px; font-weight: bold; }
        .reg-table { width: 100%; border-spacing: 0 15px; }
        .reg-table td { font-size: 16px; color: #333; padding: 5px; }
        .form-input { width: 100%; padding: 12px; font-size: 16px; border: 1px solid #ccc; border-radius: 5px; box-sizing: border-box; }
        .btn-submit { width: 100%; padding: 15px; background-color: #3b5998; color: white; border: none; border-radius: 5px; font-size: 20px; font-weight: bold; cursor: pointer; transition: 0.3s; }
        .btn-submit:hover { background-color: #2c3e50; }
        .error-msg { color: red; font-size: 13px; display: block; margin-top: 5px; }
    </style>

    <div class="register-container">
        <h2 class="register-title">דף הרשמה למערכת</h2>
        <hr />
        
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
                <td>תעודת זהות:</td>
                <td>
                    <asp:TextBox ID="txtID" runat="server" CssClass="form-input" MaxLength="9" placeholder="הכנס 9 ספרות" />
                    <asp:RequiredFieldValidator ID="rfvID" runat="server" ControlToValidate="txtID" ErrorMessage="חובה להזין ת.ז" CssClass="error-msg" Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="revID" runat="server" ControlToValidate="txtID" 
                        ValidationExpression="^[0-9]{9}$" ErrorMessage="תעודת זהות חייבת להכיל בדיוק 9 ספרות" CssClass="error-msg" Display="Dynamic" />
                </td>
            </tr>
            <tr>
                <td>אימייל:</td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input" placeholder="example@gmail.com" />
                    <asp:RegularExpressionValidator ID="rev1" runat="server" ControlToValidate="txtEmail" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="כתובת אימייל לא תקינה" CssClass="error-msg" Display="Dynamic" />
                </td>
            </tr>
            <tr>
                <td>סיסמה:</td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-input" TextMode="Password" placeholder="בחר סיסמה חזקה" />
                    <asp:RequiredFieldValidator ID="rfv3" runat="server" ControlToValidate="txtPassword" ErrorMessage="חובה לבחור סיסמה" CssClass="error-msg" Display="Dynamic" />
                </td>
            </tr>
            <tr>
                <td>טלפון:</td>
                <td>
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-input" placeholder="הכנס מספר טלפון" />
                    <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="txtPhone" 
                        ValidationExpression="^[0-9]{9,10}$" ErrorMessage="טלפון חייב להכיל 9-10 ספרות" CssClass="error-msg" Display="Dynamic" />
                </td>
            </tr>
            <tr>
                <td>גיל:</td>
                <td>
                    <asp:TextBox ID="txtAge" runat="server" CssClass="form-input" placeholder="גיל (מספר בלבד)" />
                    <asp:RangeValidator ID="rv1" runat="server" ControlToValidate="txtAge" 
                        MinimumValue="1" MaximumValue="120" Type="Integer" ErrorMessage="הכנס גיל תקין (1-120)" CssClass="error-msg" Display="Dynamic" />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="padding-top: 20px;">
                    <asp:Button ID="btnRegister" runat="server" Text="שלח הרשמה" OnClick="BtnRegister_Click" CssClass="btn-submit" />
                </td>
            </tr>
        </table>
        
        <div style="text-align: center; margin-top: 20px;">
            <asp:Label ID="lblMessage" runat="server" Font-Size="Large" Font-Bold="true"></asp:Label>
        </div>
    </div>
</asp:Content>