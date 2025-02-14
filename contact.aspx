<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="Contact.contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="main">
        <header id="header" class="header d-flex align-items-center fixed-top">
            <div class="container-fluid container-xl d-flex align-items-center justify-content-between">
                <a href="home.aspx" class="logo d-flex align-items-center">
                    <h1 class="sitename">United Together</h1>
                </a>
                <nav id="navmenu" class="navmenu">
                    <ul>
                        <li><a href="home.aspx">Home</a></li>
                        <li><a href="about-us.aspx">About</a></li>
                        <li><a href="services.aspx">Services</a></li>
                        <li><a href="testimonials.aspx">Testimonials</a></li>
                        <li><a href="contact.aspx" class="active">Contact</a></li>
                    </ul>
                    <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
                </nav>
            </div>
        </header>
        <!-- Page Title -->
        <div class="page-title dark-background">
            <div class="container position-relative">
                <h1>Contact Us</h1>
                <p>Reach out to learn more about us and our services.</p>
                <nav class="breadcrumbs">
                    <ol>
                        <li><a href="home.aspx">Home</a></li>
                        <li class="current"><a href ="contact.aspx">Contact</a></li>
                    </ol>
                </nav>
            </div>
        </div>
        <section id="contact-us" class="contact section">
            <div class="container" data-aos="fade-up">
                <div class="section-header text-center">
                    <h2>Contact Us</h2>
                    <p>Reach out to our global offices for personalized financial solutions.</p>
                </div>

                <div class="row">
                    <!-- Singapore HQ -->
                    <div class="col-md-4 contact-info">
                        <h3>Headquarters</h3>
                        <p>123 Finance Avenue, Level 10, Singapore 049483</p>
                        <p>
                            Email: hq@unitedtogether.com<br>
                            Phone: +65 6123 4567
                        </p>
                    </div>

                    <!-- New York Office -->
                    <div class="col-md-4 contact-info">
                        <h3>New York Office</h3>
                        <p>456 Wall Street, 12th Floor, New York, NY 10005, USA</p>
                        <p>
                            Email: ny@unitedtogether.com<br>
                            Phone: +1 212 555 7890
                        </p>
                    </div>

                    <!-- London Office -->
                    <div class="col-md-4 contact-info">
                        <h3>London Office</h3>
                        <p>789 Canary Wharf, London E14 5AB, UK</p>
                        <p>
                            Email: london@unitedtogether.com<br>
                            Phone: +44 20 7946 0958
                        </p>
                    </div>
                </div>

                <!-- Google Map -->
                <div id="map" style="width: 100%; height: 400px; border-radius: 10px;"></div>
            </div>
        </section>

        <!-- Google Maps Script -->
        <script>
            function initMap() {
                const offices = [
                    { position: { lat: 1.283, lng: 103.851 }, title: "Singapore HQ" },
                    { position: { lat: 40.706, lng: -74.009 }, title: "New York Office" },
                    { position: { lat: 51.505, lng: -0.023 }, title: "London Office" }
                ];

                const map = new google.maps.Map(document.getElementById("map"), {
                    zoom: 2,
                    center: offices[0].position
                });

                offices.forEach(office => {
                    new google.maps.Marker({
                        position: office.position,
                        map: map,
                        title: office.title
                    });
                });
            }
        </script>

        <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCnUA__nE50FDC-uzaUuBSKkPKaIAmyyjI&callback=initMap"></script>
    </main>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <style>
        fieldset {
            border: 2px solid grey;
        }
        legend {
            padding-left: 20px;
        }
        div table {
            border-collapse: collapse;
            margin-left: 10px;
        }
        div table tr th {
            padding: 0px 10px 0px 40px;
            text-align: right;
        }
        div table tr td {
        }
        input {
            margin: 2px 2px 2px 10px;
        }
        .form {
            margin: 5px 5px 5px 20px;
        }
        .auto-style1 {
            height: 90px;
            width: 316px;
        }
        .auto-style3 {
            width: 316px;
        }
    </style>

    <hr />
    <p>If you would like to reach out directly to us via our website, please fill in this form.</p>
    <div>
        <fieldset>
            <legend>Personal Particulars</legend>
            <!-- Updated form to submit data to ResponsePage.aspx -->
            <form action="ResponsePage.aspx" method="GET">
                <table>
                    <tr>
                        <th>
                            <label for="name">Name:</label>
                        </th>
                        <td>
                            <input type="text" id="name" name="name" placeholder="John Smith" class="auto-style3"><br>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <label for="email">Email:</label>
                        </th>
                        <td>
                            <input type="email" id="email" name="email" placeholder="abc@gmail.com" class="auto-style3"><br>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <label for="message">Message:</label>
                        </th>
                        <td rowspan="2">
                            <input type="text" id="message" name="message" size="40" class="auto-style1"><br>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp</td>
                    </tr>
                </table>
                <input class="form" type="submit" value="Submit">
            </form>
        </fieldset>
    </div>
</asp:Content>



protected void gvProduct_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Get the currently selected row.
            GridViewRow row = gvProduct.SelectedRow;

            // Get Product ID from the selected row, which is the 
            // first row, i.e. index 0.
            string prodID = row.Cells[0].Text;

            // Redirect to next page, with the Product Id added to the URL,
            // e.g. ProductDetails.aspx?ProdID=1
            Response.Redirect("ProductDetails.aspx?ProdID="+prodID);
        }


Product prod = null;
 protected void Page_Load(object sender, EventArgs e)
 {
         Product aProd = new Product();
         // Get Product ID from querystring
         string prodID = Request.QueryString["ProdID"].ToString();
         prod = aProd.getProduct(prodID);
         
         lbl_ProdName.Text = prod.Product_Name;
         lbl_ProdDesc.Text = prod.Product_Desc;
         lbl_Price.Text = prod.Unit_Price.ToString("c");
         img_Product.ImageUrl = "~\\Images\\" + prod.Product_Image;
        
         lbl_ProdID.Text = prodID.ToString();
}
