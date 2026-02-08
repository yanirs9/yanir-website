using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace MySite
{
    public partial class ViewUsers : System.Web.UI.Page
    {
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
            try
            {
                using (SqlConnection conn = new SqlConnection(connString))
                {
                    string sql = "SELECT txtFirstName, txtLastName, txtEmail, txtPhone, txtAge FROM tUsers";
                    SqlDataAdapter adp = new SqlDataAdapter(sql, conn);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        gvUsers.DataSource = dt;
                        gvUsers.DataBind();
                        lblCount.Text = "סה\"כ משתמשים רשומים: " + dt.Rows.Count;
                    }
                    else
                    {
                        lblCount.Text = "אין משתמשים רשומים במערכת.";
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('שגיאה בשליפת נתונים: " + ex.Message + "');</script>");
            }
        }
    }
}