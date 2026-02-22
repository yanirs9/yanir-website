using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace MySite
{
    public partial class ViewUsers : System.Web.UI.Page
    {
        // מחרוזת ההתחברות שלך למסד הנתונים
        string connString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MyDB.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            // בדיקת אבטחה - רק מנהל יכול לצפות ברשימה
            if (Session["role"] == null || Session["role"].ToString() != "admin")
            {
                Response.Redirect("Home.aspx");
                return;
            }

            if (!IsPostBack)
            {
                BindUsers();
            }
        }

        private void BindUsers()
        {
            // קליטת פרמטרים מה-URL (מגיע מהחיפוש בדף הניהול)
            string fName = Request.QueryString["fname"];
            string lName = Request.QueryString["lname"];

            try
            {
                using (SqlConnection conn = new SqlConnection(connString))
                {
                    // בונים את השאילתה עם תנאי בסיסי 1=1 שמאפשר להוסיף תנאי חיפוש דינמי
                    string sql = "SELECT txtFirstName, txtLastName, txtEmail, txtPhone, txtAge FROM tUsers WHERE 1=1";

                    if (!string.IsNullOrEmpty(fName))
                        sql += " AND txtFirstName LIKE @fName";

                    if (!string.IsNullOrEmpty(lName))
                        sql += " AND txtLastName LIKE @lName";

                    SqlCommand cmd = new SqlCommand(sql, conn);

                    // הוספת פרמטרים למניעת הזרקת SQL
                    if (!string.IsNullOrEmpty(fName))
                        cmd.Parameters.AddWithValue("@fName", "%" + fName + "%");

                    if (!string.IsNullOrEmpty(lName))
                        cmd.Parameters.AddWithValue("@lName", "%" + lName + "%");

                    SqlDataAdapter adp = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);

                    gvUsers.DataSource = dt;
                    gvUsers.DataBind();

                    if (dt.Rows.Count > 0)
                        lblCount.Text = "סה\"כ משתמשים שנמצאו: " + dt.Rows.Count;
                    else
                        lblCount.Text = "לא נמצאו משתמשים התואמים את החיפוש.";
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('שגיאה בשליפת נתונים: " + ex.Message + "');</script>");
            }
        }
    }
}