using System;
using System.Drawing;
using System.Data.SqlClient;
using System.Web.UI;

namespace MySite
{
    public partial class Login : System.Web.UI.Page
    {
        string connString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MyDB.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            // תיקון שגיאה CS0176 - גישה סטטית נכונה
            System.Web.UI.ValidationSettings.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            // --- פרטי המנהל המעודכנים ---
            string adminEmail = "yanirsh2010@gmail.com";
            string adminPass = "niri2010";

            if (string.IsNullOrEmpty(txtEmail.Text) || string.IsNullOrEmpty(txtPassword.Text))
            {
                lblError.Text = "נא להזין אימייל וסיסמה";
                lblError.ForeColor = Color.Red;
                return;
            }

            try
            {
                // בדיקת גישת מנהל עם הפרטים החדשים
                if (txtEmail.Text == adminEmail && txtPassword.Text == adminPass)
                {
                    Session["user"] = "מנהל מערכת";
                    Session["role"] = "admin";
                    Response.Redirect("Admin.aspx");
                    return;
                }

                using (SqlConnection conn = new SqlConnection(connString))
                {
                    conn.Open();
                    string sql = "SELECT txtFirstName FROM tUsers WHERE txtEmail = @email AND txtPassword = @pass";
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@pass", txtPassword.Text);

                    object result = cmd.ExecuteScalar();

                    if (result != null)
                    {
                        Session["user"] = result.ToString();
                        Session["role"] = "user";
                        lblError.Text = "התחברת בהצלחה!";
                        lblError.ForeColor = Color.Green;
                        Response.AddHeader("REFRESH", "1;URL=Home.aspx");
                    }
                    else
                    {
                        lblError.Text = "אימייל או סיסמה שגויים";
                        lblError.ForeColor = Color.Red;
                    }
                }
            }
            catch (Exception ex)
            {
                lblError.Text = "שגיאה: " + ex.Message;
                lblError.ForeColor = Color.Red;
            }
        }
    }
}