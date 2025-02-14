using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Contact
{
    public partial class contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void NavigateToPage(object sender, EventArgs e)
        {
            // Identify which menu item was clicked based on CommandArgument
            string page = ((System.Web.UI.WebControls.LinkButton)sender).CommandArgument;

            switch (page)
            {
                case "Home":
                    Response.Redirect("home.aspx");
                    break;
                case "About":
                    Response.Redirect("about.aspx");
                    break;
                case "Services":
                    Response.Redirect("services.aspx");
                    break;
                case "Testimonials":
                    Response.Redirect("testimonials.aspx");
                    break;
                case "Contact":
                    Response.Redirect("contact.aspx");
                    break;
                default:
                    Response.Redirect("contact.aspx");
                    break;
            }
        }
    }
}
