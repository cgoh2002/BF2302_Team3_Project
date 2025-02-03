using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics.Contracts;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BF2302_Team3_Project
{
    //    public partial class RiskAssessment : System.Web.UI.Page
    //    {
    //        string connectionString = ConfigurationManager.ConnectionStrings["RiskAssessment"].ConnectionString;

    //        RiskAssessment aRisk = new RiskAssessment();

    //        protected void Page_Load(object sender, EventArgs e)
    //        {
    //            if (!IsPostBack)
    //            {
    //                LoadRecords();
    //            }

    //        }
    //        private void LoadRecords()
    //        {
    //            List<RiskAssessment> risklist = new List<RiskAssessment>();
    //            risklist = aRisk.GetAllRiskAssessments();
    //            this.gvRiskAssessmentRecords.DataSource = risklist;
    //            this.gvRiskAssessmentRecords.DataBind();
    //        }

    //        public void InsertRecord(object sender, EventArgs e)
    //        {
    //            string assetName = txtAssetName.Text; // Replace with your input field ID
    //            int riskScore = int.Parse(txtRiskScore.Text); // Replace with your input field ID
    //            string riskLevel = ddlRiskLevel.SelectedValue; // Replace with your dropdown field ID

    //            string query = "INSERT INTO Risk_Assessment (AssetName, RiskScore, RiskLevel) VALUES (@AssetName, @RiskScore, @RiskLevel)";
    //            using (SqlConnection conn = new SqlConnection(connectionString))
    //            {
    //                using (SqlCommand cmd = new SqlCommand(query, conn))
    //                {
    //                    cmd.Parameters.AddWithValue("@AssetName", assetName);
    //                    cmd.Parameters.AddWithValue("@RiskScore", riskScore);
    //                    cmd.Parameters.AddWithValue("@RiskLevel", riskLevel);

    //                    conn.Open();
    //                    cmd.ExecuteNonQuery();
    //                }
    //            }

    //        }
    //        protected void gvProduct_SelectedIndexChanged(object sender, EventArgs e)
    //        {
    //            // Get the currently selected row.
    //            GridViewRow row = gvRiskAssessmentRecords.SelectedRow;

    //            // Get Product ID from the selected row, which is the 
    //            // first row, i.e. index 0.
    //            string prodID = row.Cells[0].Text;

    //            // Redirect to next page, with the Product Id added to the URL,
    //            // e.g. ProductDetails.aspx?ProdID=1
    //            Response.Redirect("ProductDetails.aspx?ProdID=" + prodID);
    //        }
    //        public void gvRiskAssessmentRecords_RowDeleting(object sender, GridViewDeleteEventArgs e)
    //        {
    //            int result = 0;
    //            RiskAssessment riskAssessment = new RiskAssessment();
    //            string RiskId = gvRiskAssessmentRecords.DataKeys[e.RowIndex].Value.ToString();
    //            result = riskAssessment.DeleteRiskAssessment(RiskId);

    //            if (result > 0)
    //            {
    //                Response.Write("<script>alert('Product Remove successfully');</script>");
    //            }
    //            else
    //            {
    //                Response.Write("<script>alert('Product Removal NOT successfully');</script>");
    //            }

    //            Response.Redirect("RiskAssessment.aspx");

    //        }
    //        protected void gvProduct_RowEditing(object sender, GridViewEditEventArgs e)
    //        {
    //            gvRiskAssessmentRecords.EditIndex = e.NewEditIndex;
    //            LoadRecords();
    //        }
    //        protected void gvRiskAssessment_RowUpdating(object sender, GridViewUpdateEventArgs e)
    //        {
    //            int result = 0;
    //            RiskAssessment risk = new RiskAssessment();

    //            // Get the row being updated
    //            GridViewRow row = gvRiskAssessmentRecords.Rows[e.RowIndex];

    //            // Retrieve updated values from the grid row
    //            string riskId = gvRiskAssessmentRecords.DataKeys[e.RowIndex].Value.ToString();
    //            string assetName = ((TextBox)row.Cells[1].Controls[0]).Text;
    //            string riskScore = ((TextBox)row.Cells[2].Controls[0]).Text;
    //            string riskLevel = ((TextBox)row.Cells[3].Controls[0]).Text;

    //            // Perform update operation
    //            result = risk.UpdateRiskAssessment(riskId, assetName, riskScore, riskLevel);

    //            if (result > 0)
    //            {
    //                Response.Write("<script>alert('Risk assessment updated successfully');</script>");
    //            }
    //            else
    //            {
    //                Response.Write("<script>alert('Failed to update risk assessment');</script>");
    //            }

    //            gvRiskAssessmentRecords.EditIndex = -1;
    //            LoadRecords();
    //        }

    //        protected void gvRiskAssessment_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    //        {
    //            gvRiskAssessmentRecords.EditIndex = -1;
    //            LoadRecords();
    //        }
    //        protected void SelectRecord(object sender, EventArgs e)
    //        {
    //            GridViewRow selectedRow = gvRiskAssessmentRecords.SelectedRow;
    //            if (selectedRow != null)
    //            {
    //                // Get data from the selected row
    //                string assetName = selectedRow.Cells[0].Text;
    //                string riskScore = selectedRow.Cells[1].Text;
    //                string riskLevel = selectedRow.Cells[2].Text;

    //                // Display or process the selected data (example: populate fields for editing)
    //                txtAssetName.Text = assetName;
    //                txtRiskScore.Text = riskScore;
    //                ddlRiskLevel.SelectedValue = riskLevel;
    //            }
    //        }
    //    }
    //}
    public partial class RiskAssessment : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["RiskAssessment"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadRiskData();
            }
        }

        private void LoadRiskData()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Risk_Assessment";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        gvRiskAssessmentRecords.DataSource = dt;
                        gvRiskAssessmentRecords.DataBind();
                    }
                }
            }
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            string riskLevel = ddlRiskLevel.SelectedValue;
            string assetName = txtAssetName.Text.Trim();
            string riskScore = txtRiskScore.Text.Trim();

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Risk_Assessment (AssetName, RiskScore, RiskLevel) VALUES (@AssetName, @RiskScore, @RiskLevel)";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@AssetName", assetName);
                    cmd.Parameters.AddWithValue("@RiskScore", riskScore);
                    cmd.Parameters.AddWithValue("@RiskLevel", riskLevel);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            LoadRiskData();
        }
        protected void GridViewRisk_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Get the currently selected row.
            GridViewRow row = gvRiskAssessmentRecords.SelectedRow;

            // Get Risk ID from the selected row, which is the 
            // first column, i.e., index 0.
            string riskID = row.Cells[0].Text;

            // Redirect to another page, with the Risk ID added to the URL,
            // e.g., RiskDetails.aspx?RiskID=1
            Response.Redirect("RiskDetails.aspx?Riskid=" + riskID);
        }
       
        protected void GridViewRisk_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvRiskAssessmentRecords.EditIndex = e.NewEditIndex;
            LoadRiskData();
        }

        protected void GridViewRisk_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvRiskAssessmentRecords.Rows[e.RowIndex];
            int id = Convert.ToInt32(gvRiskAssessmentRecords.DataKeys[e.RowIndex].Value);
            string assetName = (row.FindControl("txtAssetName") as TextBox).Text;
            string riskLevel = (row.FindControl("ddlRiskLevel") as DropDownList).SelectedValue;
            string riskScore = (row.FindControl("txtRiskScore") as TextBox).Text;

            using (SqlConnection con = new SqlConnection())
            {
                string query = "UPDATE Risk_Assessment SET AssetName=@AssetName, RiskScore=@RiskScore, RiskLevel=@RiskLevel WHERE Riskid=@Riskid";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Riskid", id);
                    cmd.Parameters.AddWithValue("@AssetName", assetName);
                    cmd.Parameters.AddWithValue("@RiskScore", riskScore);
                    cmd.Parameters.AddWithValue("@RiskLevel", riskLevel);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            gvRiskAssessmentRecords.EditIndex = -1;
            LoadRiskData();
        }

        protected void GridViewRisk_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvRiskAssessmentRecords.EditIndex = -1;
            LoadRiskData();
        }

        protected void GridViewRisk_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvRiskAssessmentRecords.DataKeys[e.RowIndex].Value);

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM Risk_Assessment WHERE Riskid=@Riskid";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Riskid", id);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            LoadRiskData();
        }
    }
}


