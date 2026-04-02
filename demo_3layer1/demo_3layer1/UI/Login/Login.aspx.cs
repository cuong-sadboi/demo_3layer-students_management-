using System;
using demo_3layer1.Business;
using demo_3layer1.Security;

namespace demo_3layer1.UI.Loginn
{
    public partial class Login : System.Web.UI.Page
    {
        private readonly UserBusiness _userBusiness = new UserBusiness();
        private const int MaxFailedAttempts = 5;
        private static readonly TimeSpan LockDuration = TimeSpan.FromMinutes(2);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // ✅ Xóa session cũ nếu không đến từ Home
                if (Session["CameFromHome"] == null)
                {
                    ClearAuthSession();
                }
                else
                {
                    // Bắt đầu phiên đăng nhập mới từ Home thì reset bộ đếm lỗi
                    ResetFailedAttemptState();
                }

                // ✅ Nếu có vai trò được chọn từ Home.aspx
              

                // ✅ Đảm bảo có tài khoản mặc định
                _userBusiness.SeedDefaultUsers();

                // Xóa flag để không ảnh hưởng lần sau
                Session["CameFromHome"] = null;
            }

            UpdateLoginLockUi();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            TimeSpan lockRemaining;
            if (IsLoginLocked(out lockRemaining))
            {
                ShowLockMessage(lockRemaining);
                UpdateLoginLockUi();
                return;
            }

            if (!Page.IsValid)
            {
                return;
            }

            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                lblMessage.Text = "Vui lòng nhập đầy đủ tên đăng nhập và mật khẩu!";
                return;
            }

            var user = _userBusiness.Login(username, password);
            if (user == null)
            {
                RegisterFailedAttempt();
                return;
            }

            var selectedRole = SessionRoleHelper.NormalizeRole(Session["SelectedRole"]);
            if (!string.IsNullOrEmpty(selectedRole) &&
                !string.Equals(selectedRole, user.Role, StringComparison.OrdinalIgnoreCase))
            {
                // Không chặn cứng đăng nhập, chỉ thông báo để UX mềm hơn.
                lblMessage.Text = "Vai tro da chon khong trung voi tai khoan. He thong se dang nhap theo vai tro cua tai khoan.";
            }

            ResetFailedAttemptState();

            // ✅ Lưu thông tin đăng nhập vào session
            Session["Username"] = user.Username;
            Session["Role"] = user.Role;
            Session["UserId"] = user.Id;
            Session["SelectedRole"] = null;
            
            // QUAN TRỌNG: nhớ lưu luôn UserId

            // ✅ Nếu là sinh viên → tìm đúng Student theo UserId
            if (string.Equals(user.Role, "Student", StringComparison.OrdinalIgnoreCase))
            {
                var stu = new StudentBusiness().GetByUserId(user.Id); // cần hàm này
                
                if (stu != null)
                {
                    Session["StudentId"] = stu.Id;
                    Session["StudentName"] = stu.Name;
                }
                else
                {
                    // Chưa liên kết hồ sơ: không cho vào dashboard để tránh lỗi logic dữ liệu
                    ClearAuthSession();
                    lblMessage.Text = "Tài khoản chưa liên kết hồ sơ sinh viên. Vui lòng liên hệ quản trị viên.";
                    return;
                }
            }

            // ✅ Điều hướng theo role
            var normalizedRole = (user.Role ?? string.Empty).Trim();
            switch (normalizedRole.ToLowerInvariant())
            {
                case "admin":
                    Response.Redirect("AdminDashboard.aspx");
                    break;
                case "teacher":
                    Response.Redirect("TeacherDashboard.aspx");
                    break;
                case "student":
                    Response.Redirect("StudentDashboard.aspx");
                    break;
                default:
                    ClearAuthSession();
                    lblMessage.Text = "Vai trò không hợp lệ.";
                    break;
            }
        }

        private int GetFailedAttemptCount()
        {
            return Session["LoginFailedCount"] is int value ? value : 0;
        }

        private DateTime? GetLockUntilUtc()
        {
            return Session["LoginLockUntilUtc"] is DateTime value ? value : (DateTime?)null;
        }

        private bool IsLoginLocked(out TimeSpan remaining)
        {
            var lockUntilUtc = GetLockUntilUtc();
            if (!lockUntilUtc.HasValue)
            {
                remaining = TimeSpan.Zero;
                return false;
            }

            remaining = lockUntilUtc.Value - DateTime.UtcNow;
            if (remaining <= TimeSpan.Zero)
            {
                Session.Remove("LoginLockUntilUtc");
                remaining = TimeSpan.Zero;
                return false;
            }

            return true;
        }

        private void RegisterFailedAttempt()
        {
            int failedAttempts = GetFailedAttemptCount() + 1;

            if (failedAttempts >= MaxFailedAttempts)
            {
                Session["LoginFailedCount"] = 0;
                Session["LoginLockUntilUtc"] = DateTime.UtcNow.Add(LockDuration);

                TimeSpan remaining;
                IsLoginLocked(out remaining);
                ShowLockMessage(remaining);
                UpdateLoginLockUi();
                return;
            }

            Session["LoginFailedCount"] = failedAttempts;
            int remainingAttempts = MaxFailedAttempts - failedAttempts;
            lblMessage.Text = $"Sai tên đăng nhập hoặc mật khẩu. Còn {remainingAttempts} lần thử.";
        }

        private void ResetFailedAttemptState()
        {
            Session.Remove("LoginFailedCount");
            Session.Remove("LoginLockUntilUtc");
        }

        private void ShowLockMessage(TimeSpan remaining)
        {
            int waitSeconds = Math.Max(1, (int)Math.Ceiling(remaining.TotalSeconds));
            lblMessage.Text = $"Bạn đã nhập sai quá nhiều lần. Vui lòng thử lại sau {waitSeconds} giây.";
        }

        private void UpdateLoginLockUi()
        {
            TimeSpan remaining;
            bool isLocked = IsLoginLocked(out remaining);

            btnLogin.Enabled = !isLocked;
            if (isLocked)
            {
                int waitSeconds = Math.Max(1, (int)Math.Ceiling(remaining.TotalSeconds));
                btnLogin.Text = $"Tạm khóa ({waitSeconds}s)";
            }
            else
            {
                btnLogin.Text = "Đăng nhập";
            }
        }

        private void ClearAuthSession()
        {
            Session.Remove("Username");
            Session.Remove("Role");
            Session.Remove("UserId");
            Session.Remove("StudentId");
            Session.Remove("StudentName");
            Session.Remove("SelectedRole");
        }
    }
}
