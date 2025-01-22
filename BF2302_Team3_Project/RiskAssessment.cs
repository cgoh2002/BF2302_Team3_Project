using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;

namespace BF2302_Team3_Project
{
    public partial class RiskAssessment
    {
        private string _connStr = ConfigurationManager.ConnectionStrings["RiskAssessment"].ConnectionString;

        private string _RiskId;
        private string _AssetName;
        private string _RiskScore;
        private string _RiskLevel;

        // Parameterized Constructor
        public RiskAssessment(string RiskId, string AssetName, string RiskScore, string RiskLevel)
        {
            _RiskId = RiskId;
            _AssetName = AssetName;
            _RiskScore = RiskScore;
            _RiskLevel = RiskLevel;
        }

        // Default Constructor
        public RiskAssessment() { }

        // Properties
        public string RiskId
        {
            get { return _RiskId; }
            set { _RiskId = value; }
        }

        public string AssetName
        {
            get { return _AssetName; }
            set { _AssetName = value; }
        }

        public string RiskScore
        {
            get { return _RiskScore; }
            set { _RiskScore = value; }
        }

        public string RiskLevel
        {
            get { return _RiskLevel; }
            set { _RiskLevel = value; }
        }

        // Retrieve Risk Assessment by RiskId
        public RiskAssessment GetRiskAssessment(string RiskId)
        {
            RiskAssessment riskDetail = null;

            string queryStr = "SELECT * FROM Risk_Assessment WHERE RiskId = @RiskId";

            try
            {
                using (SqlConnection conn = new SqlConnection(_connStr))
                {
                    using (SqlCommand cmd = new SqlCommand(queryStr, conn))
                    {
                        cmd.Parameters.AddWithValue("@RiskId", RiskId);

                        conn.Open();
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                string assetName = reader["AssetName"].ToString();
                                string riskScore = reader["RiskScore"].ToString();
                                string riskLevel = reader["RiskLevel"].ToString();

                                riskDetail = new RiskAssessment(RiskId, assetName, riskScore, riskLevel);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error in GetRiskAssessment: {ex.Message}");
                throw;
            }

            return riskDetail;
        }

        // Retrieve all Risk Assessments
        public List<RiskAssessment> GetAllRiskAssessments()
        {
            List<RiskAssessment> riskList = new List<RiskAssessment>();

            string queryStr = "SELECT * FROM Risk_Assessment ORDER BY AssetName";

            try
            {
                using (SqlConnection conn = new SqlConnection(_connStr))
                {
                    using (SqlCommand cmd = new SqlCommand(queryStr, conn))
                    {
                        conn.Open();
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                string riskId = reader["RiskId"].ToString();
                                string assetName = reader["AssetName"].ToString();
                                string riskScore = reader["RiskScore"].ToString();
                                string riskLevel = reader["RiskLevel"].ToString();

                                RiskAssessment risk = new RiskAssessment(riskId, assetName, riskScore, riskLevel);
                                riskList.Add(risk);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error in GetAllRiskAssessments: {ex.Message}");
                throw;
            }

            return riskList;
        }

        // Insert Risk Assessment
        public int InsertRiskAssessment()
        {
            int rowsAffected = 0;

            string queryStr = "INSERT INTO Risk_Assessment (RiskId, AssetName, RiskScore, RiskLevel) " +
                              "VALUES (@RiskId, @AssetName, @RiskScore, @RiskLevel)";

            try
            {
                using (SqlConnection conn = new SqlConnection(_connStr))
                {
                    using (SqlCommand cmd = new SqlCommand(queryStr, conn))
                    {
                        cmd.Parameters.AddWithValue("@RiskId", _RiskId);
                        cmd.Parameters.AddWithValue("@AssetName", _AssetName);
                        cmd.Parameters.AddWithValue("@RiskScore", _RiskScore);
                        cmd.Parameters.AddWithValue("@RiskLevel", _RiskLevel);

                        conn.Open();
                        rowsAffected = cmd.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error in InsertRiskAssessment: {ex.Message}");
                throw;
            }

            return rowsAffected;
        }

        // Update Risk Assessment
        public int UpdateRiskAssessment(string riskId, string assetName, string riskScore, string riskLevel)
        {
            int rowsAffected = 0;

            string queryStr = "UPDATE Risk_Assessment SET " +
                              "AssetName = @AssetName, RiskScore = @RiskScore, RiskLevel = @RiskLevel " +
                              "WHERE RiskId = @RiskId";

            try
            {
                using (SqlConnection conn = new SqlConnection(_connStr))
                {
                    using (SqlCommand cmd = new SqlCommand(queryStr, conn))
                    {
                        cmd.Parameters.AddWithValue("@RiskId", _RiskId);
                        cmd.Parameters.AddWithValue("@AssetName", _AssetName);
                        cmd.Parameters.AddWithValue("@RiskScore", _RiskScore);
                        cmd.Parameters.AddWithValue("@RiskLevel", _RiskLevel);

                        conn.Open();
                        rowsAffected = cmd.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error in UpdateRiskAssessment: {ex.Message}");
                throw;
            }

            return rowsAffected;
        }

        // Delete Risk Assessment
        public int DeleteRiskAssessment(string riskId)
        {
            int rowsAffected = 0;

            string queryStr = "DELETE FROM Risk_Assessment WHERE RiskId = @RiskId";

            try
            {
                using (SqlConnection conn = new SqlConnection(_connStr))
                {
                    using (SqlCommand cmd = new SqlCommand(queryStr, conn))
                    {
                        cmd.Parameters.AddWithValue("@RiskId", riskId);

                        conn.Open();
                        rowsAffected = cmd.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error in DeleteRiskAssessment: {ex.Message}");
                throw;
            }

            return rowsAffected;
        }
    }
}
