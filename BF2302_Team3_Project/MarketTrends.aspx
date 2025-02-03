<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="MarketTrends.aspx.cs" Inherits="BF2302_Team3_Project.MarketTrends"  Async="true"%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       
    <body>
 

  <div class="page-title dark-background">
  <div class="container position-relative">
    <h1>Financial Market Trend Analysis</h1>
    <p>Analyze market trends and investment insights using Yahoo Finance API</p>
    <nav class="breadcrumbs">
      <ol>
        <li><a href="Index.aspx">Home</a></li>
        <li class="current">Financial Asset Analysis</li>
      </ol>
    </nav>
  </div>
</div> 

 <section id="service-details" class="service-details section">
  <div class="container">

    <div class="row gy-5">

      <!-- Sidebar -->
      <div class="col-lg-4" data-aos="fade-up" data-aos-delay="100">
        <div class="service-box">
          <h4>Analysis Features</h4>
          <div class="services-list" id="tickerInput">
            <a href="PortfolioPerformance.aspx"><i class="bi bi-arrow-right-circle"></i><span>Portfolio Performance</span></a>
            <a href="RiskAssessment.aspx"><i class="bi bi-arrow-right-circle"></i><span>Risk Assessment</span></a>
            <a href="MarketTrends.aspx"class="active"><i class="bi bi-arrow-right-circle"></i><span>Market Trends</span></a>
            <a href="AssetAnalysis.aspx" ><i class="bi bi-arrow-right-circle"></i><span>Financial Asset Analysis</span></a>
          </div>
        </div>
      </div>

      <!-- Main Content -->
      <div class="col-lg-8 ps-lg-5" data-aos="fade-up" data-aos-delay="200">
      <div class="market-trends">
      <h5>Enter Stock Ticker</h5>
      <!--<input type="text" id="tickerInput" class="form-control" placeholder="e.g., AAPL, MSFT, TSLA"  -->
      <asp:TextBox id="tickerInput" placeholder="e.g., AAPL, MSFT, TSLA"  CssClass="form-control" runat="server"></asp:TextBox>
         <!-- <button id="fetchTrends" class="btn btn-primary mt-3">Fetch Market Trends</button>-->
<asp:Button ID="fetchTrends" CssClass="btn btn-primary mt-3" runat="server" Text="Fetch Trends" OnClick="fetchTrends_Click" />
      <asp:Literal ID="marketTrendsResult" runat="server"></asp:Literal>
    </div
    </div>

  </div>
</section>

  <!-- Footer -->
  <footer class="bg-dark text-white text-center py-3 mt-5">
    <p>&copy; 2025 Financial Market Analysis. All rights reserved.</p>
  </footer>

  <!-- JavaScript -->
  <script>
      document.getElementById("fetchTrends").addEventListener("click", async () => {
          const ticker = document.getElementById("tickerInput").value;
          const resultDiv = document.getElementById("marketTrendsResult");

          if (!ticker) {
              resultDiv.innerHTML = "<p class='text-danger'>Please enter a valid stock ticker!</p>";
              return;
          }

          resultDiv.innerHTML = "<p>Fetching data...</p>";

          try {
              const response = await fetch(`MarketTrendsHandler.ashx?ticker=${ticker}`);
              if (!response.ok) throw new Error("Failed to fetch data");
              const data = await response.text();
              resultDiv.innerHTML = data;
          } catch (error) {
              resultDiv.innerHTML = `<p class="text-danger">Error: ${error.message}</p>`;
          }
      });
  </script>
</body>

</asp:Content>
