<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentDashboard.aspx.cs" Inherits="demo_3layer1.StudentDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Dashboard</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous" />
    <link href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:wght@400;500;600;700&display=swap" rel="stylesheet" />
    <link href="<%= ResolveUrl("~/Content/PortalPro.css") %>" rel="stylesheet" />
</head>
<body class="portal-body">
    <form id="form1" runat="server">
        <div class="portal-shell">
            <div class="portal-topbar">
                <div>
                    <h1 class="portal-title">Student Dashboard</h1>
                    <p class="portal-subtitle">Truy cap nhanh cac chuc nang hoc tap ca nhan, bao gom dang ky mon va theo doi bang diem.</p>
                </div>
                <span class="portal-badge">Student</span>
            </div>

            <div class="portal-grid">
                <article class="portal-card">
                    <h3 class="portal-card-title">Course Registration</h3>
                    <p class="portal-card-text">Dang ky hoc phan theo hoc ky va quan ly danh sach mon hoc da chon.</p>
                    <asp:Button ID="btnRegisterCourse" runat="server"
                        CssClass="portal-btn primary"
                        Text="Dang ky mon"
                        OnClick="btnRegisterCourse_Click" />
                </article>

                <article class="portal-card">
                    <h3 class="portal-card-title">View Grades</h3>
                    <p class="portal-card-text">Theo doi ket qua hoc tap moi nhat va tong hop diem theo mon hoc.</p>
                    <asp:Button ID="btnViewGrades" runat="server"
                        CssClass="portal-btn warning"
                        Text="Xem bang diem"
                        OnClick="btnViewGrades_Click" />
                </article>

                <article class="portal-card">
                    <h3 class="portal-card-title">Sign Out</h3>
                    <p class="portal-card-text">Dang xuat khoi tai khoan sinh vien va ket thuc phien lam viec hien tai.</p>
                    <asp:Button ID="btnLogout" runat="server"
                        CssClass="portal-btn danger"
                        Text="Dang xuat"
                        OnClick="btnLogout_Click" />
                </article>
            </div>
        </div>
    </form>
</body>
</html>
