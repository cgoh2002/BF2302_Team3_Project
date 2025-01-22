<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Asset_analysis.cs" Inherits="BF2302_Team3_Project.Asset_analysis" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="main">

    <!-- Page Title -->
    <div class="page-title dark-background">
      <div class="container position-relative">
        <h1>Client Financial Asset Analysis</h1>
        <p>Analyze your investments with AI-driven insights and market trends.</p>
        <nav class="breadcrumbs">
          <ol>
            <li><a href="home.aspx">Home</a></li>
            <li class="current">Financial Asset Analysis</li>
          </ol>
        </nav>
      </div>
    </div>

    <!-- Service Details Section -->
    <section id="service-details" class="service-details section">
      <div class="container">

        <div class="row gy-5">

          <!-- Sidebar -->
          <div class="col-lg-4" data-aos="fade-up" data-aos-delay="100">
            <div class="service-box">
              <h4>Analysis Features</h4>
              <div class="services-list">
                <a href="PortfolioPerformance.aspx"><i class="bi bi-arrow-right-circle"></i><span>Portfolio Performance</span></a>
                <a href="RiskAssessment.aspx"><i class="bi bi-arrow-right-circle"></i><span>Risk Assessment</span></a>
                <a href="MarketTrends.aspx"><i class="bi bi-arrow-right-circle"></i><span>Market Trends</span></a>
                <a href="FinancialAssetAnalysis.aspx" class="active"><i class="bi bi-arrow-right-circle"></i><span>Financial Asset Analysis</span></a>
              </div>
            </div>
          </div>

          <!-- Main Content -->
          <div class="col-lg-8 ps-lg-5" data-aos="fade-up" data-aos-delay="200">
            <h3>Investment Profiles</h3>
            <p>Optimize your financial assets with comprehensive insights:</p>

            <!-- Asset Info -->
            <div class="asset-info mb-4">
              <h5>Asset Info</h5>
              <ul>
                <li><i class="bi bi-info-circle"></i> <strong>Type:</strong> Real Estate Invesment Turst(REITS)</li>
                <li><i class="bi bi-graph-up-arrow"></i> <strong>Risk Score:</strong> Low</li>
                <li><i class="bi bi-calendar"></i><strong>Purchase Date:</strong> May 10, 2021</li>
              </ul>
            </div>

            <!-- Performance Metrics -->
            <div class="performance-metrics mb-4">
              <h5>Performance Metrics</h5>
              <ul>
                <li><i class="bi bi-cash"></i> <strong>ROI:</strong> 10%</li>
                <li><i class="bi bi-bar-chart"></i> <strong>Market Value:</strong> $500,000</li>
                <li><i class="bi bi-arrow-up"></i> <strong>Growth Trends:</strong> 5% annual growth</li>
              </ul>
            </div>

            <!-- Key Market Trends -->
            <div class="market-trends mt-4">
              <h5>Key Market Trends Near Your Assets</h5>
              <p>
                Your asset's region is experiencing consistent economic growth with increasing demand for commercial spaces.
              </p>
              <a href="MarketTrends.aspx" class="btn btn-outline-primary">Explore Market Trends</a>
            </div>

            <!-- ChatGPT Integration -->
            <div class="chatgpt-integration mt-5">
              <h5>Need Personalized Insights?</h5>
              <p>Use our AI assistant for detailed guidance and analysis of your investments.</p>
              <div id="chatgpt-container" class="chat-widget">
                <textarea id="chatgpt-input" class="form-control" rows="3" placeholder="Ask anything about your assets..."></textarea>
                <button id="chatgpt-send" class="btn btn-primary mt-2">Ask AI</button>
                <div id="chatgpt-response" class="mt-3 p-3 bg-light"></div>
              </div>
            </div>
          </div>

        </div>

      </div>
    </section>

  </main>


</asp:Content>
