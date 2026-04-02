<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="demo_3layer1.AdminDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Bảng điều khiển Quản trị</title>
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
                    <h1 class="portal-title">Bảng điều khiển Quản trị</h1>
                    <p class="portal-subtitle">Quản lý toàn bộ dữ liệu học vụ, danh mục môn học và kết quả học tập trong một giao diện thống nhất.</p>
                </div>
                <span class="portal-badge">Quản trị viên</span>
            </div>

            <div class="portal-grid">
                <article class="portal-card">
                    <h3 class="portal-card-title">Quản lý sinh viên</h3>
                    <p class="portal-card-text">Xem danh sách, cập nhật và xử lý thông tin sinh viên theo lớp học.</p>
                    <asp:Button ID="btnStudents" runat="server" CssClass="portal-btn primary" Text="Quản lý sinh viên" OnClick="btnStudents_Click" />
                </article>

                <article class="portal-card">
                    <h3 class="portal-card-title">Quản lý môn học</h3>
                    <p class="portal-card-text">Quản lý môn học, số tín chỉ và tình trạng sử dụng trong hệ thống.</p>
                    <asp:Button ID="btnSubjects" runat="server" CssClass="portal-btn success" Text="Quản lý môn học" OnClick="btnSubjects_Click" />
                </article>

                <article class="portal-card">
                    <h3 class="portal-card-title">Quản lý điểm</h3>
                    <p class="portal-card-text">Theo dõi và cập nhật bảng điểm cho tất cả sinh viên và môn học.</p>
                    <asp:Button ID="btnScores" runat="server" CssClass="portal-btn warning" Text="Quản lý điểm" OnClick="btnGrade_Click" />
                </article>

                <article class="portal-card">
                    <h3 class="portal-card-title">Đăng xuất</h3>
                    <p class="portal-card-text">Kết thúc phiên làm việc admin và quay về màn hình đăng nhập.</p>
                    <asp:Button ID="btnLogout" runat="server" CssClass="portal-btn danger" Text="Đăng xuất" OnClick="btnLogout_Click" />
                </article>
            </div>

            <section class="portal-fill-section">
                <div class="portal-fill-grid">
                    <article class="portal-mini-card">
                        <h3 class="portal-mini-title">Nhịp vận hành hôm nay</h3>
                        <p class="portal-mini-text">Theo dõi nhanh các đầu việc trọng tâm để ưu tiên xử lý đúng thứ tự trong ngày.</p>

                        <div class="portal-stat-strip">
                            <div class="portal-stat">
                                <span class="portal-stat-value">24</span>
                                <span class="portal-stat-label">Yêu cầu mới</span>
                            </div>
                            <div class="portal-stat">
                                <span class="portal-stat-value">08</span>
                                <span class="portal-stat-label">Hồ sơ chờ duyệt</span>
                            </div>
                            <div class="portal-stat">
                                <span class="portal-stat-value">96%</span>
                                <span class="portal-stat-label">Tiến độ hoàn tất</span>
                            </div>
                        </div>
                    </article>

                    <article class="portal-mini-card">
                        <h3 class="portal-mini-title">Việc cần ưu tiên</h3>
                        <ul class="portal-timeline">
                            <li>Rà soát sinh viên chưa đủ dữ liệu hồ sơ.</li>
                            <li>Đối chiếu điểm cập nhật trong ngày.</li>
                            <li>Xác nhận mở lớp cho học kỳ sắp tới.</li>
                        </ul>
                    </article>
                </div>
            </section>
        </div>
    </form>
</body>
</html>


















