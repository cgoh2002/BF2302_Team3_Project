using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BF2302_Team3_Project
{
    public partial class Risk_Assessment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void InsertRecord(object sender, EventArgs e)
        {
            // Add your logic for inserting a record here
        }

        protected void UpdateRecord(object sender, EventArgs e)
        {
            // Add your logic for updating a record here
        }

        protected void DeleteRecord(object sender, EventArgs e)
        {
            // Add your logic for deleting a record here
        }
        protected void SelectRecord(object sender, EventArgs e)
        {
            // Get the selected row's data
            GridView gridView = sender as GridView;
            GridViewRow selectedRow = gridView.SelectedRow;

            // Example: Get a value from the selected row
            string assetName = selectedRow.Cells[1].Text; // Adjust the cell index as needed
                                                          // Add logic to process the selected row's data
        }
    }
}