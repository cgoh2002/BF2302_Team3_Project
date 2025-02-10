<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BF2302_Team3_Project.Login" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>  
    <div class="container mt-5">
        <h2 class="text-center">Login</h2>
        <form id="form1" runat="server" class="mt-4">
            <div class="mb-3">
                <label for="txtUsername" class="form-label">Username</label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="txtPassword" class="form-label">Password</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" />
            </div>
            <asp:Label ID="lblError" runat="server" CssClass="text-danger" />
            <div>
                <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-primary w-100" Text="Login" OnClick="btnLogin_Click" />
            </div>
        </form>
        <div class="text-center mt-3">
            <a href="Register.aspx">Don't have an account? Register here</a>
        </div>
    </div>
</body>
</html>
