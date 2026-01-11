
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MySite
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // בדיקה פשוטה לצורך בדיקת התיקון
            if (txtUsername.Text == "admin" && txtPassword.Text == "1234")
            {
                Session["user"] = txtUsername.Text;
                Response.Redirect("Default.aspx");
            }
            else
            {
                lblLoginMessage.Text = "פרטים שגויים!";
            }
        }
    }
}