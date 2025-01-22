<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="BF2302_Team3_Project.home" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="main">
         <main class="main">

    <!-- Page Title -->
    <div class="page-title dark-background">
        <div class="container position-relative">
            <h1>United Togather </h1>
            <p>Manage risk profiles for financial assets.</p>
            <nav class="breadcrumbs">
                <ol>
                    <li><a href="Index.aspx">Home</a></li>
                    <li class="current">Risk Assessment</li>
                </ol>
            </nav>
        </div>
    </div>

        <section id="about" class="about section">
        <div class="container" data-aos="fade-up">
            <div class="row">
                <div class="col-lg-6">
                    <img src="assets/img/logo.png" ` class="img-fluid" alt="">
                </div>
                <div class="col-lg-6 d-flex flex-column justify-content-center">
                    <h2>About Us</h2>
                    <p>United Together is dedicated to empowering individuals and businesses to achieve their financial goals through personalized strategies, expert advice, and advanced AI tools.</p>
                    <ul>
                        <li><i class="bi bi-check-circle"></i> Personalized financial planning</li>
                        <li><i class="bi bi-check-circle"></i> Trusted by thousands of clients</li>
                        <li><i class="bi bi-check-circle"></i> Cutting-edge AI support</li>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <!-- Wealth Management Section with CRUD -->
    <section id="wealth-management-crud" class="wealth-management section">
        <div class="container" data-aos="fade-up">
            <div class="section-header text-center">
                <h2>Manage Wealth Management Features</h2>
                <p>Empower advisors with tools that can be added, updated, or removed as needed.</p>
            </div>

            <div class="card mb-5">
                <div class="card-body">
                    <h5 class="card-title">Add or Update Feature</h5>
                    <form id="feature-form">
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="feature-title" class="form-label">Feature Title</label>
                                <input type="text" id="feature-title" class="form-control" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="feature-description" class="form-label">Feature Description</label>
                                <input type="text" id="feature-description" class="form-control" required>
                            </div>
                        </div>
                        <input type="hidden" id="feature-id">
                        <button type="submit" class="btn btn-primary" id="save-feature">Save Feature</button>
                        <button type="reset" class="btn btn-secondary" id="reset-feature">Reset</button>
                    </form>
                </div>
            </div>

            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Feature List</h5>
                    <table class="table table-striped" id="feature-table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Title</th>
                                <th>Description</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
            </div>
        </div>

        <script>
            let features = [];
            let editIndex = null;
            const featureForm = document.getElementById("feature-form");
            const featureTable = document.getElementById("feature-table").querySelector("tbody");
            const featureTitle = document.getElementById("feature-title");
            const featureDescription = document.getElementById("feature-description");

            function renderFeatures() {
                featureTable.innerHTML = "";
                features.forEach((feature, index) => {
                    const row = `
                                              <tr>
                                                <td>${index + 1}</td>
                                                <td>${feature.title}</td>
                                                <td>${feature.description}</td>
                                                <td>
                                                  <button class="btn btn-sm btn-warning" onclick="editFeature(${index})">Edit</button>
                                                  <button class="btn btn-sm btn-danger" onclick="deleteFeature(${index})">Delete</button>
                                                </td>
                                              </tr>
                                            `;
                    featureTable.insertAdjacentHTML("beforeend", row);
                });
            }

            function saveFeature(event) {
                event.preventDefault();

                const title = featureTitle.value.trim();
                const description = featureDescription.value.trim();

                if (editIndex !== null) {
                    features[editIndex] = { title, description };
                    editIndex = null;
                } else {
                    features.push({ title, description });
                }

                featureForm.reset();
                renderFeatures();
            }

            function editFeature(index) {
                const feature = features[index];
                featureTitle.value = feature.title;
                featureDescription.value = feature.description;
                editIndex = index;
            }

            function deleteFeature(index) {
                features.splice(index, 1);
                renderFeatures();
            }

            featureForm.addEventListener("submit", saveFeature);
        </script>

        <style>
            #wealth-management-crud {
                padding: 60px 0;
                background-color: #f8f9fa;
            }

            #feature-form .form-label {
                font-weight: bold;
            }

            #feature-table {
                margin-top: 20px;
            }
        </style>
    </section>

    <!-- Ask ChatGPT Section -->
    <section id="ask-chatgpt" class="ask-chatgpt section">
        <div class="container" data-aos="fade-up">
            <div class="section-header text-center">
                <h2>Ask ChatGPT</h2>
                <p>Interact with our AI assistant to get insights instantly.</p>
            </div>

            <div class="chatgpt-box">
                <div class="input-group">
                    <input type="text" id="chatgpt-input" class="form-control" placeholder="Type your question here..." />
                    <button id="chatgpt-submit" class="btn btn-primary">Ask</button>
                </div>
                <div id="chatgpt-response" class="chatgpt-response mt-3"></div>
            </div>
        </div>
    </section>

    <script>
        document.getElementById("chatgpt-submit").addEventListener("click", function () {
            const userInput = document.getElementById("chatgpt-input").value;
            const responseDiv = document.getElementById("chatgpt-response");

            if (!userInput.trim()) {
                responseDiv.innerHTML = "<p class='text-danger'>Please type a question before submitting.</p>";
                return;
            }

            responseDiv.innerHTML = "<p class='text-info'>Thinking...</p>";

            fetch("https://your-chatgpt-backend.com/api/chat", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify({ question: userInput }),
            })
                .then((response) => response.json())
                .then((data) => {
                    responseDiv.innerHTML = <p class='text-success'>${data.answer}</p>;
                })
                .catch((error) => {
                    console.error("Error:", error);
                    responseDiv.innerHTML = "<p class='text-danger'>Something went wrong. Please try again later.</p>";
                });
        });
    </script>


    <a href="#" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

    <!-- Vendor JS Files -->
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="assets/vendor/aos/aos.js"></script>
    <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
    <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>

   

                
    </section>


    </section>


</main>

</asp:Content>

