<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="demo_3layer1.AdminDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Admin Dashboard</title>
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
                    <h1 class="portal-title">Admin Dashboard</h1>
                    <p class="portal-subtitle">Quan ly toan bo du lieu hoc vu, danh muc mon hoc va ket qua hoc tap trong mot giao dien thong nhat.</p>
                </div>
                <span class="portal-badge">Administrator</span>
            </div>

            <div class="portal-grid">
                <article class="portal-card">
                    <h3 class="portal-card-title">Student Management</h3>
                    <p class="portal-card-text">Xem danh sach, cap nhat va xu ly thong tin sinh vien theo lop hoc.</p>
                    <asp:Button ID="btnStudents" runat="server" CssClass="portal-btn primary" Text="Quan ly sinh vien" OnClick="btnStudents_Click" />
                </article>

                <article class="portal-card">
                    <h3 class="portal-card-title">Subject Catalog</h3>
                    <p class="portal-card-text">Quan ly mon hoc, so tin chi va tinh trang su dung trong he thong.</p>
                    <asp:Button ID="btnSubjects" runat="server" CssClass="portal-btn success" Text="Quan ly mon hoc" OnClick="btnSubjects_Click" />
                </article>

                <article class="portal-card">
                    <h3 class="portal-card-title">Grade Control</h3>
                    <p class="portal-card-text">Theo doi va cap nhat bang diem cho tat ca sinh vien va mon hoc.</p>
                    <asp:Button ID="btnScores" runat="server" CssClass="portal-btn warning" Text="Quan ly diem" OnClick="btnGrade_Click" />
                </article>

                <article class="portal-card">
                    <h3 class="portal-card-title">Sign Out</h3>
                    <p class="portal-card-text">Ket thuc phien lam viec admin va quay ve man hinh dang nhap.</p>
                    <asp:Button ID="btnLogout" runat="server" CssClass="portal-btn danger" Text="Dang xuat" OnClick="btnLogout_Click" />
                </article>
            </div>
        </div>
    </form>
</body>
</html>
