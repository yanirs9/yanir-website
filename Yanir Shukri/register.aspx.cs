using System;

namespace MySite
{
    public partial class Register : System.Web.UI.Page
    {
        protected global::System.Web.UI.WebControls.Label lblMessage;

        protected void BtnRegister_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "ההרשמה בוצעה בהצלחה!";
        }
    }
}
