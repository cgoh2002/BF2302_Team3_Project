<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Risk_Assessment.aspx.cs" Inherits="BF2302_Team3_Project.Risk_Assessment" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <main class="main">

        <!-- Page Title -->
        <div class="page-title dark-background">
            <div class="container position-relative">
                <h1>Risk Assessment Management</h1>
                <p>Manage risk profiles for financial assets.</p>
                <nav class="breadcrumbs">
                    <ol>
                        <li><a href="Index.aspx">Home</a></li>
                        <li class="current">Risk Assessment</li>
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
                                <a href="RiskAssessment.aspx" class="active"><i class="bi bi-arrow-right-circle"></i><span>Risk Assessment</span></a>
                                <a href="MarketTrends.aspx"><i class="bi bi-arrow-right-circle"></i><span>Market Trends</span></a>
                                <a href="FinancialAssetAnalysis.aspx"><i class="bi bi-arrow-right-circle"></i><span>Financial Asset Analysis</span></a>
                            </div>
                        </div>
                    </div>

                    <!-- Main Content -->
                    <div class="col-lg-8 ps-lg-5" data-aos="fade-up" data-aos-delay="200">
                        <h3>Risk Assessment</h3>
                        <p>Manage risk profiles for financial assets with the tools below:</p>

                        <!-- Form Section -->
                        <div class="form-section">
                            <form id="riskForm" runat="server">
                                <div class="mb-3">
                                    <label for="AssetName" class="form-label">Asset Name</label>
                                    <asp:TextBox ID="AssetName" CssClass="form-control" runat="server" placeholder="e.g., Real Estate"></asp:TextBox>
                                </div>
                                <div class="mb-3">
                                    <label for="RiskScore" class="form-label">Risk Score</label>
                                    <asp:TextBox ID="RiskScore" CssClass="form-control" runat="server" placeholder="e.g., 5"></asp:TextBox>
                                </div>
                                <div class="mb-3">
                                    <label for="RiskLevel" class="form-label">Risk Level</label>
                                    <asp:DropDownList ID="RiskLevel" CssClass="form-select" runat="server">
                                        <asp:ListItem Text="Low" Value="Low"></asp:ListItem>
                                        <asp:ListItem Text="Medium" Value="Medium"></asp:ListItem>
                                        <asp:ListItem Text="High" Value="High"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="mb-3">
                                    <asp:Button ID="InsertButton" CssClass="btn btn-success" runat="server" Text="Insert" OnClick="InsertRecord" />
                                    <asp:Button ID="UpdateButton" CssClass="btn btn-primary" runat="server" Text="Update" OnClick="UpdateRecord" />
                                    <asp:Button ID="DeleteButton" CssClass="btn btn-danger" runat="server" Text="Delete" OnClick="DeleteRecord" />
                                </div>
                            </form>
                        </div>

                        <!-- Table Section -->
                        <div class="table-container mt-4">
                            <h5>Risk Assessment Records</h5>
                            <asp:GridView ID="RiskTable" CssClass="table table-bordered" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="SelectRecord">
                                <Columns>
                                    <asp:BoundField DataField="AssetName" HeaderText="Asset Name" />
                                    <asp:BoundField DataField="RiskScore" HeaderText="Risk Score" />
                                    <asp:BoundField DataField="RiskLevel" HeaderText="Risk Level" />
                                    <asp:CommandField ShowSelectButton="True" SelectText="Select" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>

                </div>

            </div>
        </section>

    </main>

</asp:Content>
