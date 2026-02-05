using System;
using System.Data.SqlClient;
using System.Drawing;

namespace MySite
{
    public partial class Login : System.Web.UI.Page
    {
        // מחרוזת החיבור המקורית שלך
        string connString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MyDB.mdf;Integrated Security=True";

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connString))
                {
                    conn.Open();

                    // שינוי השאילתה: במקום לספור (COUNT), אנחנו שולפים את השם הפרטי (txtFirstName)
                    // וודא ששם העמודה בטבלה tUsers הוא אכן txtFirstName
                    string sql = "SELECT txtFirstName FROM tUsers WHERE txtEmail = @email AND txtPassword = @pass";

                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@pass", txtPassword.Text);

                    // ExecuteScalar מחזיר את הערך הראשון בעמודה הראשונה (כלומר את השם)
                    object result = cmd.ExecuteScalar();

                    if (result != null)
                    {
                        // שמירת השם הפרטי בתוך ה-Session
                        Session["user"] = result.ToString();

                        Response.Redirect("Home.aspx");
                    }
                    else
                    {
                        lblError.Text = "אימייל או סיסמה שגויים. נסה שוב.";
                        lblError.ForeColor = Color.Red;
                    }
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                lblError.Text = "שגיאה בגישה לבסיס הנתונים: " + ex.Message;
                lblError.ForeColor = Color.Red;
            }
        }
    }
}