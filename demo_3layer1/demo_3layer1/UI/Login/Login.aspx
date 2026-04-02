<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="demo_3layer1.UI.Loginn.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đăng nhập hệ thống</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous" />
    <link href="https://fonts.googleapis.com/css2?family=Sora:wght@500;700;800&family=Be+Vietnam+Pro:wght@400;500;600&display=swap" rel="stylesheet" />

    <style>
        :root {
            --bg-deep: #082032;
            --bg-mid: #114b5f;
            --bg-soft: #f4f7f9;
            --card: #ffffff;
            --text-main: #1f2933;
            --text-muted: #4f5d75;
            --accent: #ff7f11;
            --accent-strong: #e56b00;
            --ok: #1f9d78;
            --danger: #d64545;
            --line: #d9e2ec;
        }

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            min-height: 100vh;
            font-family: "Be Vietnam Pro", "Segoe UI", sans-serif;
            color: var(--text-main);
            background: radial-gradient(circle at 12% 20%, #2a6f97 0%, rgba(42, 111, 151, 0) 34%),
                        radial-gradient(circle at 88% 78%, #ffb703 0%, rgba(255, 183, 3, 0) 34%),
                        linear-gradient(140deg, var(--bg-deep), var(--bg-mid));
        }

        .page {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 28px 16px;
        }

        .login-shell {
            width: min(980px, 100%);
            border-radius: 26px;
            overflow: hidden;
            background: rgba(255, 255, 255, 0.96);
            box-shadow: 0 24px 60px rgba(3, 24, 37, 0.38);
            display: grid;
            grid-template-columns: 1.05fr 1fr;
            animation: rise-up 420ms ease-out;
        }

        .hero-pane {
            background: linear-gradient(150deg, #0d3b66 0%, #0e5c7a 58%, #0f766e 100%);
            color: #f8fbff;
            padding: 36px;
            position: relative;
        }

        .hero-pane::before,
        .hero-pane::after {
            content: "";
            position: absolute;
            border-radius: 50%;
            opacity: 0.2;
            pointer-events: none;
        }

        .hero-pane::before {
            width: 220px;
            height: 220px;
            background: #ffd166;
            top: -80px;
            right: -60px;
        }

        .hero-pane::after {
            width: 160px;
            height: 160px;
            background: #7bdff2;
            bottom: -50px;
            left: -60px;
        }

        .hero-badge {
            display: inline-block;
            padding: 7px 12px;
            border-radius: 999px;
            background: rgba(255, 255, 255, 0.16);
            border: 1px solid rgba(255, 255, 255, 0.24);
            font-size: 12px;
            letter-spacing: 0.08em;
            text-transform: uppercase;
            font-family: "Sora", sans-serif;
        }

        .hero-title {
            margin: 18px 0 10px;
            font-family: "Sora", sans-serif;
            font-size: clamp(26px, 3.2vw, 36px);
            line-height: 1.15;
        }

        .hero-subtitle {
            margin: 0;
            max-width: 34ch;
            color: rgba(255, 255, 255, 0.86);
            line-height: 1.6;
        }

        .hero-list {
            list-style: none;
            padding: 0;
            margin: 26px 0 0;
            display: grid;
            gap: 10px;
        }

        .hero-list li {
            padding: 10px 12px;
            border-radius: 10px;
            background: rgba(255, 255, 255, 0.12);
            backdrop-filter: blur(2px);
            font-size: 14px;
        }

        .form-pane {
            background: var(--card);
            padding: 34px 34px 30px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .form-title {
            margin: 0;
            font-family: "Sora", sans-serif;
            font-size: 28px;
            color: #0f3057;
        }

        .form-caption {
            margin: 8px 0 18px;
            color: var(--text-muted);
            font-size: 14px;
            line-height: 1.6;
        }

        .role-pill {
            margin-bottom: 14px;
            border-radius: 999px;
            padding: 8px 12px;
            font-size: 13px;
            color: #0e5c7a;
            background: #e6f5fb;
            border: 1px solid #bce6f5;
        }

        .is-hidden {
            display: none;
        }

        .group {
            margin-bottom: 15px;
        }

        .field-label {
            display: block;
            margin-bottom: 6px;
            font-weight: 600;
            color: #243b53;
            font-size: 14px;
        }

        .form-input {
            width: 100%;
            border: 1px solid var(--line);
            border-radius: 12px;
            height: 46px;
            padding: 0 13px;
            font-size: 14px;
            outline: none;
            transition: border-color 140ms ease, box-shadow 140ms ease;
        }

        .form-input:focus {
            border-color: #2a6f97;
            box-shadow: 0 0 0 4px rgba(42, 111, 151, 0.15);
        }

        .password-wrap {
            position: relative;
        }

        .toggle-pass {
            position: absolute;
            top: 50%;
            right: 8px;
            transform: translateY(-50%);
            border: 0;
            background: transparent;
            color: #486581;
            font-size: 12px;
            font-weight: 600;
            cursor: pointer;
            padding: 6px 8px;
            border-radius: 8px;
        }

        .toggle-pass:hover {
            background: #eef4f8;
        }

        .validator {
            display: block;
            margin-top: 5px;
            color: var(--danger);
            font-size: 12px;
        }

        .message {
            min-height: 24px;
            display: block;
            margin-bottom: 10px;
            color: var(--danger);
            font-size: 13px;
            font-weight: 600;
        }

        .btn-login {
            width: 100%;
            height: 48px;
            border: 0;
            border-radius: 12px;
            background: linear-gradient(120deg, var(--accent), var(--accent-strong));
            color: #ffffff;
            font-family: "Sora", sans-serif;
            font-weight: 700;
            font-size: 15px;
            cursor: pointer;
            transition: transform 120ms ease, filter 120ms ease;
        }

        .btn-login:hover {
            transform: translateY(-1px);
            filter: brightness(1.05);
        }

        .btn-login[disabled] {
            cursor: not-allowed;
            filter: grayscale(0.15);
            opacity: 0.9;
        }

        .helper-row {
            margin-top: 14px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 10px;
            font-size: 13px;
            color: var(--text-muted);
        }

        .back-link {
            color: #0e5c7a;
            text-decoration: none;
            font-weight: 600;
        }

        .back-link:hover {
            text-decoration: underline;
        }

        @keyframes rise-up {
            from {
                opacity: 0;
                transform: translateY(14px) scale(0.985);
            }
            to {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }

        @media (max-width: 920px) {
            .login-shell {
                grid-template-columns: 1fr;
            }

            .hero-pane {
                padding: 24px;
            }

            .hero-list {
                grid-template-columns: repeat(2, minmax(0, 1fr));
            }
        }

        @media (max-width: 560px) {
            .page {
                padding: 10px;
            }

            .form-pane,
            .hero-pane {
                padding: 20px;
            }

            .hero-list {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <% var selectedRole = ((Session["SelectedRole"] ?? string.Empty).ToString() ?? string.Empty).Trim(); %>

        <div class="page">
            <div class="login-shell">
                <section class="hero-pane">
                    <span class="hero-badge">Student Portal</span>
                    <h2 class="hero-title">Đăng nhập để tiếp tục học tập và quản lý dữ liệu.</h2>
                    <p class="hero-subtitle">Hệ thống được tối ưu cho Admin, Giáo viên và Sinh viên với quyền truy cập riêng biệt.</p>
                    <ul class="hero-list">
                        <li>Quản lý danh sách sinh viên, môn học, điểm số</li>
                        <li>Tra cứu kết quả theo từng tài khoản</li>
                        <li>Xử lý nhanh trên desktop và mobile</li>
                    </ul>
                </section>

                <section class="form-pane">
                    <h1 class="form-title">Đăng nhập hệ thống</h1>
                    <p class="form-caption">Nhập thông tin tài khoản để vào đúng dashboard theo vai trò.</p>

                    <div class="role-pill <%= string.IsNullOrEmpty(selectedRole) ? "is-hidden" : string.Empty %>">
                        Vai trò đã chọn: <strong><%= Server.HtmlEncode(selectedRole) %></strong>
                    </div>

                    <div class="group">
                        <label class="field-label" for="<%= txtUsername.ClientID %>">Tên đăng nhập</label>
                        <asp:TextBox ID="txtUsername" runat="server" CssClass="form-input" Placeholder="Nhập tên đăng nhập"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvUsername" runat="server"
                            ControlToValidate="txtUsername"
                            ErrorMessage="Tên đăng nhập không được để trống."
                            CssClass="validator" Display="Dynamic" />
                    </div>

                    <div class="group">
                        <label class="field-label" for="<%= txtPassword.ClientID %>">Mật khẩu</label>
                        <div class="password-wrap">
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-input" TextMode="Password" Placeholder="Nhập mật khẩu"></asp:TextBox>
                            <button id="btnTogglePassword" type="button" class="toggle-pass">Hiện</button>
                        </div>
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                            ControlToValidate="txtPassword"
                            ErrorMessage="Mật khẩu không được để trống."
                            CssClass="validator" Display="Dynamic" />
                    </div>

                    <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>

                    <asp:Button ID="btnLogin" runat="server" Text="Đăng nhập"
                        CssClass="btn-login"
                        OnClick="btnLogin_Click"
                        OnClientClick="if (typeof(Page_ClientValidate)==='function' && !Page_ClientValidate()) { return false; } var btn=this; window.setTimeout(function(){ btn.disabled=true; btn.value='Đang xử lý...'; }, 0); return true;" />

                    <div class="helper-row">
                        <span>Bạn quên mật khẩu? Liên hệ quản trị viên.</span>
                        <a class="back-link" href="../Home/Home.aspx">Quay lại Home</a>
                    </div>
                </section>
            </div>
        </div>
    </form>

    <script>
        (function () {
            var passInput = document.getElementById('<%= txtPassword.ClientID %>');
            var toggleBtn = document.getElementById('btnTogglePassword');

            if (!passInput || !toggleBtn) {
                return;
            }

            toggleBtn.addEventListener('click', function () {
                var showing = passInput.type === 'text';
                passInput.type = showing ? 'password' : 'text';
                toggleBtn.textContent = showing ? 'Hiện' : 'An';
            });
        })();
    </script>

</html>






























