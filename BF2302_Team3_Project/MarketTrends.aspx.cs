using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BF2302_Team3_Project
{
    public partial class MarketTrends : System.Web.UI.Page
    {
        protected Literal marketTrendsResult;



        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected async void fetchTrends_Click(object sender, EventArgs e)
        {
            string ticker = tickerInput.Text.Trim();

            if (string.IsNullOrEmpty(ticker))
            {
                marketTrendsResult.Text = "<p class='text-danger'>Please enter a valid stock ticker!</p>";
                return;
            }

            marketTrendsResult.Text = "<p>Fetching data...</p>";

            try
            {
                using (HttpClient client = new HttpClient())
                {
                    string url = $"https://query1.finance.yahoo.com/v8/finance/chart/{ticker}";
                    string response = await client.GetStringAsync(url);

                    marketTrendsResult.Text = $"<pre>{HttpUtility.HtmlEncode(response)}</pre>";
                }
            }
            catch (Exception ex)
            {
                marketTrendsResult.Text = $"<p class='text-danger'>Error: {HttpUtility.HtmlEncode(ex.Message)}</p>";
            }
        }
    }
}