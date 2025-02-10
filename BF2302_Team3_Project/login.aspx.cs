using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;

namespace BF2302_Team3_Project
{
    public partial class Login : System.Web.UI.Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Login"].ConnectionString;
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            // Hash the input password
            string hashedPassword = HashPassword(password);

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "SELECT Role FROM Users WHERE Username = @Username AND Password = @Password";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Password", hashedPassword);

                object result = cmd.ExecuteScalar();
                if (result != null)
                {
                    string role = result.ToString();
                    Session["Username"] = username;
                    Session["Role"] = role;

                    if (role == "admin")
                        Response.Redirect("FeatureRequests.aspx");
                    else
                        Response.Redirect("Home.aspx");
                }
                else
                {
                    lblError.Text = "Invalid username or password.";
                }
            }
        }

        private string HashPassword(string password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
                StringBuilder builder = new StringBuilder();
                foreach (byte b in bytes)
                {
                    builder.Append(b.ToString("x2"));
                }
                return builder.ToString();
            }
        }
    }
}
        