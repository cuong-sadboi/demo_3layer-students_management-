<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TeacherDashboard.aspx.cs" Inherits="demo_3layer1.TeacherDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Bảng điều khiển Giảng viên</title>
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
                    <h1 class="portal-title">Bảng điều khiển Giảng viên</h1>
                    <p class="portal-subtitle">Theo dõi lớp học, quản lý học phần và cập nhật kết quả học tập cho sinh viên.</p>
                </div>
                <span class="portal-badge">Giảng viên</span>
            </div>

            <div class="portal-grid">
                <article class="portal-card">
                    <h3 class="portal-card-title">Quản lý môn học</h3>
                    <p class="portal-card-text">Cập nhật danh sách môn học phụ trách và thông tin học phần liên quan.</p>
                    <asp:Button ID="btnSubjects" runat="server" CssClass="portal-btn success" Text="Quản lý môn học" OnClick="btnSubjects_Click" />
                </article>

                <article class="portal-card">
                    <h3 class="portal-card-title">Quản lý điểm</h3>
                    <p class="portal-card-text">Nhập điểm, điều chỉnh kết quả và tra cứu lịch sử cập nhật điểm sinh viên.</p>
                    <asp:Button ID="btnGrades" runat="server" CssClass="portal-btn warning" Text="Quản lý điểm" OnClick="btnGrades_Click" />
                </article>

                <article class="portal-card">
                    <h3 class="portal-card-title">Đăng xuất</h3>
                    <p class="portal-card-text">Đăng xuất khỏi tài khoản giảng viên và quay lại màn hình đăng nhập.</p>
                    <asp:Button ID="btnLogout" runat="server" CssClass="portal-btn danger" Text="Đăng xuất" OnClick="btnLogout_Click" />
                </article>
            </div>

            <section class="portal-fill-section">
                <div class="portal-fill-grid">
                    <article class="portal-mini-card">
                        <h3 class="portal-mini-title">Tổng quan giảng dạy</h3>
                        <p class="portal-mini-text">Theo dõi tiến độ nhập điểm và khối lượng công việc để quản lý lớp học chủ động hơn.</p>

                        <div class="portal-stat-strip">
                            <div class="portal-stat">
                                <span class="portal-stat-value">03</span>
                                <span class="portal-stat-label">Lớp phụ trách</span>
                            </div>
                            <div class="portal-stat">
                                <span class="portal-stat-value">42</span>
                                <span class="portal-stat-label">Bài chờ chấm</span>
                            </div>
                            <div class="portal-stat">
                                <span class="portal-stat-value">89%</span>
                                <span class="portal-stat-label">Điểm đã hoàn tất</span>
                            </div>
                        </div>
                    </article>

                    <article class="portal-mini-card">
                        <h3 class="portal-mini-title">Kế hoạch hôm nay</h3>
                        <ul class="portal-timeline">
                            <li>Hoàn tất nhập điểm các lớp còn thiếu.</li>
                            <li>Kiểm tra môn học có đăng ký vượt sĩ số.</li>
                            <li>Chuẩn bị tài liệu cho buổi học kế tiếp.</li>
                        </ul>
                    </article>
                </div>
            </section>
        </div>
    </form>
</body>
</html>
























