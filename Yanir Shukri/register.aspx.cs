using System;
using System.Drawing;

namespace MySite
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
        }

        protected void BtnRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                lblMessage.Text = "ההרשמה בוצעה בהצלחה!";
                lblMessage.ForeColor = Color.Green;
            }
            else
            {
                lblMessage.Text = "ההרשמה לא בוצעה בהצלחה - נא לתקן את השדות המסומנים";
                lblMessage.ForeColor = Color.Red;
            }
        }
    }
}