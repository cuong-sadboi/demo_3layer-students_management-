<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentDashboard.aspx.cs" Inherits="demo_3layer1.StudentDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Bảng điều khiển Sinh viên</title>
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
                    <h1 class="portal-title">Bảng điều khiển Sinh viên</h1>
                    <p class="portal-subtitle">Truy cập nhanh các chức năng học tập cá nhân, bao gồm đăng ký môn và theo dõi bảng điểm.</p>
                </div>
                <span class="portal-badge">Sinh viên</span>
            </div>

            <div class="portal-grid">
                <article class="portal-card">
                    <h3 class="portal-card-title">Đăng ký học phần</h3>
                    <p class="portal-card-text">Đăng ký học phần theo học kỳ và quản lý danh sách môn học đã chọn.</p>
                    <asp:Button ID="btnRegisterCourse" runat="server"
                        CssClass="portal-btn primary"
                        Text="Đăng ký môn"
                        OnClick="btnRegisterCourse_Click" />
                </article>

                <article class="portal-card">
                    <h3 class="portal-card-title">Xem điểm</h3>
                    <p class="portal-card-text">Theo dõi kết quả học tập mới nhất và tổng hợp điểm theo môn học.</p>
                    <asp:Button ID="btnViewGrades" runat="server"
                        CssClass="portal-btn warning"
                        Text="Xem bảng điểm"
                        OnClick="btnViewGrades_Click" />
                </article>

                <article class="portal-card">
                    <h3 class="portal-card-title">Đăng xuất</h3>
                    <p class="portal-card-text">Đăng xuất khỏi tài khoản sinh viên và kết thúc phiên làm việc hiện tại.</p>
                    <asp:Button ID="btnLogout" runat="server"
                        CssClass="portal-btn danger"
                        Text="Đăng xuất"
                        OnClick="btnLogout_Click" />
                </article>
            </div>

            <section class="portal-fill-section">
                <div class="portal-fill-grid">
                    <article class="portal-mini-card">
                        <h3 class="portal-mini-title">Tiến độ học tập tuần này</h3>
                        <p class="portal-mini-text">Giữ nhịp học ổn định bằng cách theo dõi số môn đã đăng ký và điểm số vừa cập nhật.</p>

                        <div class="portal-stat-strip">
                            <div class="portal-stat">
                                <span class="portal-stat-value">05</span>
                                <span class="portal-stat-label">Môn đã đăng ký</span>
                            </div>
                            <div class="portal-stat">
                                <span class="portal-stat-value">02</span>
                                <span class="portal-stat-label">Môn có điểm mới</span>
                            </div>
                            <div class="portal-stat">
                                <span class="portal-stat-value">7.8</span>
                                <span class="portal-stat-label">Điểm TB hiện tại</span>
                            </div>
                        </div>
                    </article>

                    <article class="portal-mini-card">
                        <h3 class="portal-mini-title">Gợi ý trong ngày</h3>
                        <ul class="portal-timeline">
                            <li>Kiểm tra môn chưa hoàn tất đăng ký học phần.</li>
                            <li>Đối chiếu điểm mới với kế hoạch cá nhân.</li>
                            <li>Cập nhật mục tiêu cho tuần học tiếp theo.</li>
                        </ul>
                    </article>
                </div>
            </section>
        </div>
    </form>
</body>
</html>


























