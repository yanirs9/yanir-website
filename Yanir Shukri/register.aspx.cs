using System;
using System.Drawing;
using System.Data.SqlClient;

namespace MySite
{
    public partial class Register : System.Web.UI.Page
    {
        string connString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MyDB.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
        }

        protected void BtnRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    using (SqlConnection conn = new SqlConnection(connString))
                    {
                        string sql = "INSERT INTO tUsers (txtFirstName, txtLastName, txtEmail, txtPassword, txtPhone, txtAge) " +
                                     "VALUES (@fName, @lName, @email, @pass, @phone, @age)";

                        SqlCommand cmd = new SqlCommand(sql, conn);
                        cmd.Parameters.AddWithValue("@fName", txtFirstName.Text);
                        cmd.Parameters.AddWithValue("@lName", txtLastName.Text);
                        cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                        cmd.Parameters.AddWithValue("@pass", txtPassword.Text);
                        cmd.Parameters.AddWithValue("@phone", txtPhone.Text);
                        cmd.Parameters.AddWithValue("@age", int.Parse(txtAge.Text));

                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();

                        Session["user"] = txtFirstName.Text;
                        lblMessage.Text = "ההרשמה הסתיימה בהצלחה!";
                        lblMessage.ForeColor = Color.Green;
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
}