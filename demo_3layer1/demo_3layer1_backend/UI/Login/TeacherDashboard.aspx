<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TeacherDashboard.aspx.cs" Inherits="demo_3layer1.TeacherDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Teacher Dashboard</title>
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
                    <h1 class="portal-title">Teacher Dashboard</h1>
                    <p class="portal-subtitle">Theo doi lop hoc, quan ly hoc phan va cap nhat ket qua hoc tap cho sinh vien.</p>
                </div>
                <span class="portal-badge">Teacher</span>
            </div>

            <div class="portal-grid">
                <article class="portal-card">
                    <h3 class="portal-card-title">Subjects</h3>
                    <p class="portal-card-text">Cap nhat danh sach mon hoc phu trach va thong tin hoc phan lien quan.</p>
                    <asp:Button ID="btnSubjects" runat="server" CssClass="portal-btn success" Text="Quan ly mon hoc" OnClick="btnSubjects_Click" />
                </article>

                <article class="portal-card">
                    <h3 class="portal-card-title">Grades</h3>
                    <p class="portal-card-text">Nhap diem, dieu chinh ket qua va tra cuu lich su cap nhat diem sinh vien.</p>
                    <asp:Button ID="btnGrades" runat="server" CssClass="portal-btn warning" Text="Quan ly diem" OnClick="btnGrades_Click" />
                </article>

                <article class="portal-card">
                    <h3 class="portal-card-title">Sign Out</h3>
                    <p class="portal-card-text">Dang xuat khoi tai khoan giang vien va quay lai man hinh dang nhap.</p>
                    <asp:Button ID="btnLogout" runat="server" CssClass="portal-btn danger" Text="Dang xuat" OnClick="btnLogout_Click" />
                </article>
            </div>
        </div>
    </form>
</body>
</html>
