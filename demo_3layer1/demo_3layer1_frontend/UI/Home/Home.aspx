<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="demo_3layer1.Home" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>He thong Quan ly Sinh vien</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous" />
    <link href="https://fonts.googleapis.com/css2?family=Sora:wght@500;700;800&family=Be+Vietnam+Pro:wght@400;500;600&display=swap" rel="stylesheet" />
    <style>
        :root {
            --bg-1: #031926;
            --bg-2: #0b4f6c;
            --panel: #f8fbfd;
            --text: #102a43;
            --muted: #486581;
            --admin: #ef476f;
            --teacher: #06d6a0;
            --student: #ffd166;
        }

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            min-height: 100vh;
            font-family: "Be Vietnam Pro", "Segoe UI", sans-serif;
            color: var(--text);
            background: radial-gradient(circle at 10% 15%, rgba(255, 209, 102, 0.24), rgba(255, 209, 102, 0) 36%),
                        radial-gradient(circle at 80% 80%, rgba(6, 214, 160, 0.22), rgba(6, 214, 160, 0) 34%),
                        linear-gradient(140deg, var(--bg-1), var(--bg-2));
        }

        .page-wrap {
            width: min(1140px, 100%);
            margin: 0 auto;
            padding: 20px 14px 34px;
        }

        .hero {
            position: relative;
            border-radius: 26px;
            overflow: hidden;
            min-height: 390px;
            box-shadow: 0 22px 44px rgba(0, 0, 0, 0.32);
        }

        .hero img {
            width: 100%;
            height: 390px;
            object-fit: cover;
            transform: scale(1.03);
        }

        .hero-overlay {
            position: absolute;
            inset: 0;
            background: linear-gradient(110deg, rgba(3, 25, 38, 0.92), rgba(11, 79, 108, 0.48) 58%, rgba(11, 79, 108, 0.2));
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: flex-start;
            padding: 34px;
            color: #f9fcff;
        }

        .hero-tag {
            font-family: "Sora", sans-serif;
            font-size: 11px;
            letter-spacing: 0.08em;
            text-transform: uppercase;
            border: 1px solid rgba(255, 255, 255, 0.38);
            border-radius: 999px;
            padding: 7px 12px;
            background: rgba(255, 255, 255, 0.12);
            margin-bottom: 16px;
        }

        .hero-title {
            margin: 0;
            font-family: "Sora", sans-serif;
            font-size: clamp(28px, 3.5vw, 44px);
            line-height: 1.15;
            max-width: 15ch;
        }

        .hero-subtitle {
            margin: 14px 0 22px;
            max-width: 46ch;
            line-height: 1.7;
            color: rgba(248, 252, 255, 0.9);
        }

        .hero-actions {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }

        .quick-link {
            color: #0d3b66;
            text-decoration: none;
            font-weight: 700;
            border: 0;
            border-radius: 12px;
            background: #ffffff;
            padding: 10px 16px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            transition: transform 120ms ease;
        }

        .quick-link:hover {
            transform: translateY(-1px);
        }

        .section-title {
            margin: 30px 0 8px;
            color: #f0f8ff;
            text-align: center;
            font-family: "Sora", sans-serif;
            font-size: clamp(22px, 2.8vw, 30px);
        }

        .section-subtitle {
            margin: 0 0 18px;
            text-align: center;
            color: rgba(240, 248, 255, 0.86);
        }

        .role-grid {
            display: grid;
            grid-template-columns: repeat(3, minmax(0, 1fr));
            gap: 14px;
        }

        .role-card {
            background: var(--panel);
            border-radius: 20px;
            border: 1px solid rgba(255, 255, 255, 0.24);
            padding: 20px;
            box-shadow: 0 14px 28px rgba(3, 25, 38, 0.2);
            transition: transform 130ms ease, box-shadow 130ms ease;
        }

        .role-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 18px 36px rgba(3, 25, 38, 0.28);
        }

        .role-pill {
            display: inline-block;
            margin-bottom: 10px;
            font-size: 12px;
            font-weight: 700;
            letter-spacing: 0.05em;
            text-transform: uppercase;
            border-radius: 999px;
            padding: 6px 10px;
            color: #073b4c;
            background: #d4f5ff;
        }

        .role-card h5 {
            margin: 0 0 8px;
            font-family: "Sora", sans-serif;
            font-size: 22px;
        }

        .role-card p {
            margin: 0 0 16px;
            color: var(--muted);
            line-height: 1.6;
            min-height: 72px;
        }

        .role-btn {
            width: 100%;
            border: 0;
            border-radius: 12px;
            height: 44px;
            font-weight: 700;
            color: #0f1720;
        }

        .admin-btn {
            background: linear-gradient(120deg, #ff8fab, var(--admin));
        }

        .teacher-btn {
            background: linear-gradient(120deg, #84f8cf, var(--teacher));
        }

        .student-btn {
            background: linear-gradient(120deg, #ffe29a, var(--student));
        }

        @media (max-width: 920px) {
            .role-grid {
                grid-template-columns: 1fr;
            }

            .hero-overlay {
                padding: 24px;
            }

            .hero {
                min-height: 330px;
            }

            .hero img {
                height: 330px;
            }
        }

        @media (max-width: 560px) {
            .page-wrap {
                padding: 12px 10px 24px;
            }

            .hero-actions {
                width: 100%;
            }

            .quick-link {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="page-wrap">
            <section class="hero">
                <img src="img/banner.jpg" alt="Banner" />
                <div class="hero-overlay">
                    <span class="hero-tag">Student Management Suite</span>
                    <h1 class="hero-title">Nen tang quan ly hoc vu thong minh.</h1>
                    <p class="hero-subtitle">Quan ly sinh vien, mon hoc, diem so va dang ky hoc phan tren cung mot he thong, su dung de dang tren moi thiet bi.</p>

                    <div class="hero-actions">
                        <a href="../Login/Login.aspx" class="quick-link">Dang nhap nhanh</a>
                    </div>
                </div>
            </section>

            <h2 class="section-title">Chon vai tro de bat dau</h2>
            <p class="section-subtitle">Moi vai tro se duoc dieu huong den dashboard va quyen truy cap phu hop.</p>

            <div class="role-grid">
                <article class="role-card">
                    <span class="role-pill">ADMIN</span>
                    <h5>Quan tri vien</h5>
                    <p>Quan ly toan bo tai nguyen he thong, bao gom sinh vien, mon hoc va ket qua hoc tap.</p>
                    <asp:Button ID="btnAdmin" runat="server" Text="Vao voi quyen Admin" CssClass="role-btn admin-btn" OnClick="btnAdmin_Click" />
                </article>

                <article class="role-card">
                    <span class="role-pill">TEACHER</span>
                    <h5>Giang vien</h5>
                    <p>Theo doi hoc phan phu trach, cap nhat diem va tra cuu thong tin hoc tap theo lop.</p>
                    <asp:Button ID="btnTeacher" runat="server" Text="Vao voi quyen Teacher" CssClass="role-btn teacher-btn" OnClick="btnTeacher_Click" />
                </article>

                <article class="role-card">
                    <span class="role-pill">STUDENT</span>
                    <h5>Sinh vien</h5>
                    <p>Dang ky mon hoc, xem bang diem va quan ly lo trinh hoc tap ca nhan tren mot giao dien gon gang.</p>
                    <asp:Button ID="btnStudent" runat="server" Text="Vao voi quyen Student" CssClass="role-btn student-btn" OnClick="btnStudent_Click" />
                </article>
            </div>
        </div>
    </form>
</body>
</html>
