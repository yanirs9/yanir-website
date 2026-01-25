
using System;

namespace MySite
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // זו הפונקציה שהייתה חסרה וגרמה לשגיאה
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (txtEmail.Text == "admin@gmail.com" && txtPassword.Text == "123456")
            {
                Session["user"] = txtEmail.Text;
                Response.Redirect("Default.aspx");
            }
            else
            {
                lblLoginMessage.Text = "שם משתמש או סיסמה שגויים";
            }
        }
    }
}