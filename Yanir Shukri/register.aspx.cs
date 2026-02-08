using System;
using System.Drawing;
using System.Data.SqlClient;
using System.Web.UI;

namespace MySite
{
    public partial class Register : System.Web.UI.Page
    {
        string connString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MyDB.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            // תיקון שגיאה CS0176 - גישה דרך שם המחלקה ValidationSettings
            System.Web.UI.ValidationSettings.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
        }

        protected void BtnRegister_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtEmail.Text) || string.IsNullOrEmpty(txtPassword.Text))
            {
                lblMessage.Text = "נא למלא את כל השדות";
                lblMessage.ForeColor = Color.Red;
                return;
            }

            string fullPhone = ddlPrefix.SelectedValue + txtPhoneBody.Text;

            try
            {
                using (SqlConnection conn = new SqlConnection(connString))
                {
                    conn.Open();

                    string checkSql = "SELECT COUNT(*) FROM tUsers WHERE txtEmail = @email";
                    SqlCommand checkCmd = new SqlCommand(checkSql, conn);
                    checkCmd.Parameters.AddWithValue("@email", txtEmail.Text);

                    int count = (int)checkCmd.ExecuteScalar();

                    if (count > 0)
                    {
                        lblMessage.Text = "משתמש זה כבר קיים במערכת!";
                        lblMessage.ForeColor = Color.Red;
                    }
                    else
                    {
                        string sql = "INSERT INTO tUsers (txtFirstName, txtLastName, txtEmail, txtPassword, txtPhone, txtAge) " +
                                     "VALUES (@fName, @lName, @email, @pass, @phone, @age)";

                        SqlCommand cmd = new SqlCommand(sql, conn);
                        cmd.Parameters.AddWithValue("@fName", txtFirstName.Text);
                        cmd.Parameters.AddWithValue("@lName", txtLastName.Text);
                        cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                        cmd.Parameters.AddWithValue("@pass", txtPassword.Text);
                        cmd.Parameters.AddWithValue("@phone", fullPhone);
                        cmd.Parameters.AddWithValue("@age", txtAge.Text);

                        cmd.ExecuteNonQuery();

                        lblMessage.Text = "נרשמת בהצלחה!";
                        lblMessage.ForeColor = Color.Green;
                        Response.AddHeader("REFRESH", "2;URL=Home.aspx");
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "שגיאה: " + ex.Message;
                lblMessage.ForeColor = Color.Red;
            }
        }
    }
}