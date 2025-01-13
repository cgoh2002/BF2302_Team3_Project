using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace BF2302_Team3_Project
{
    public class Services
    {
        string _connStr = ConfigurationManager.ConnectionStrings["Services"].ConnectionString;

        private int _serviceID;          // Service ID
        private string _name = "";       // Service Name
        private string _description = "";// Service Description
        private string _pricingDetails = ""; // Pricing Details
        private bool _isActive = true;   // Service Active Status

        // Parameterized constructor to initialize the Service object
        public Services(int serviceID, string name, string description, string pricingDetails, bool isActive)
        {
            _serviceID = serviceID;
            _name = name;
            _description = description;
            _pricingDetails = pricingDetails;
            _isActive = isActive;
        }

        // Default constructor
        public Services()
        {
        }

        // Public properties to encapsulate the private fields
        public int ServiceID
        {
            get { return _serviceID; }
            set { _serviceID = value; }
        }

        public string Name
        {
            get { return _name; }
            set { _name = value; }
        }

        public string Description
        {
            get { return _description; }
            set { _description = value; }
        }

        public string PricingDetails
        {
            get { return _pricingDetails; }
            set { _pricingDetails = value; }
        }

        public bool IsActive
        {
            get { return _isActive; }
            set { _isActive = value; }
        },
        public Services GetServices(string ServiceID)
        {
            Services servicedetail = null;
            string Name, Description, PricingDetails;
            string querystr = "Select * from Serivces Where ServiceID = @ServicesID  ";
            SqlConnection conn = new SqlConnection(_connStr);


            
        }
    }
}
