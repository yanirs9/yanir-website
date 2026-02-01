
using System;
using System.Data.SqlClient;
using System.Drawing;

namespace MySite
{
    public partial class Login : System.Web.UI.Page
    {
        string connString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MyDB.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connString))
                {
                    string sql = "SELECT txtFirstName FROM tUsers WHERE txtEmail = @email AND txtPassword = @pass";

                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@pass", txtPassword.Text);

                    conn.Open();

                    object result = cmd.ExecuteScalar();

                    conn.Close();

                    if (result != null)
                    {
                        Session["user"] = result.ToString();
                        Response.Redirect("Default.aspx");
                    }
                    else
                    {
                        lblLoginMessage.Text = "שגיאה: אימייל או סיסמה אינם נכונים!";
                        lblLoginMessage.ForeColor = Color.Red;
                    }
                }
            }
            catch (Exception ex)
            {
                lblLoginMessage.Text = "שגיאת מערכת: " + ex.Message;
                lblLoginMessage.ForeColor = Color.Red;
            }
        }
    }
}