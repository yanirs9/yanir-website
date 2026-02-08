using System;
using System.Web.UI;

namespace MySite
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // בדיקת אבטחה: אם המשתמש לא מחובר או שהוא לא מנהל - חזור לדף הבית
            if (Session["role"] == null || Session["role"].ToString() != "admin")
            {
                Response.Redirect("Home.aspx");
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // ניקוי ה-Session והעברה לדף הכניסה
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
    }
}