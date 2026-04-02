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
                // âœ… XÃ³a session cÅ© náº¿u khÃ´ng Ä‘áº¿n tá»« Home
                if (Session["CameFromHome"] == null)
                {
                    ClearAuthSession();
                }
                else
                {
                    // Báº¯t Ä‘áº§u phiÃªn Ä‘Äƒng nháº­p má»›i tá»« Home thÃ¬ reset bá»™ Ä‘áº¿m lá»—i
                    ResetFailedAttemptState();
                }

                // âœ… Náº¿u cÃ³ vai trÃ² Ä‘Æ°á»£c chá»n tá»« Home.aspx
              

                // âœ… Äáº£m báº£o cÃ³ tÃ i khoáº£n máº·c Ä‘á»‹nh
                _userBusiness.SeedDefaultUsers();

                // XÃ³a flag Ä‘á»ƒ khÃ´ng áº£nh hÆ°á»Ÿng láº§n sau
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
                lblMessage.Text = "Vui lÃ²ng nháº­p Ä‘áº§y Ä‘á»§ tÃªn Ä‘Äƒng nháº­p vÃ  máº­t kháº©u!";
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
                // KhÃ´ng cháº·n cá»©ng Ä‘Äƒng nháº­p, chá»‰ thÃ´ng bÃ¡o Ä‘á»ƒ UX má»m hÆ¡n.
                lblMessage.Text = "Vai trò đã chọn không trùng với tài khoản. Hệ thống sẽ đăng nhập theo vai trò của tài khoản.";
            }

            ResetFailedAttemptState();

            // âœ… LÆ°u thÃ´ng tin Ä‘Äƒng nháº­p vÃ o session
            Session["Username"] = user.Username;
            Session["Role"] = user.Role;
            Session["UserId"] = user.Id;
            Session["SelectedRole"] = null;
            
            // QUAN TRá»ŒNG: nhá»› lÆ°u luÃ´n UserId

            // âœ… Náº¿u lÃ  sinh viÃªn â†’ tÃ¬m Ä‘Ãºng Student theo UserId
            if (string.Equals(user.Role, "Student", StringComparison.OrdinalIgnoreCase))
            {
                var stu = new StudentBusiness().GetByUserId(user.Id); // cáº§n hÃ m nÃ y
                
                if (stu != null)
                {
                    Session["StudentId"] = stu.Id;
                    Session["StudentName"] = stu.Name;
                }
                else
                {
                    // ChÆ°a liÃªn káº¿t há»“ sÆ¡: khÃ´ng cho vÃ o dashboard Ä‘á»ƒ trÃ¡nh lá»—i logic dá»¯ liá»‡u
                    ClearAuthSession();
                    lblMessage.Text = "TÃ i khoáº£n chÆ°a liÃªn káº¿t há»“ sÆ¡ sinh viÃªn. Vui lÃ²ng liÃªn há»‡ quáº£n trá»‹ viÃªn.";
                    return;
                }
            }

            // âœ… Äiá»u hÆ°á»›ng theo role
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
                    lblMessage.Text = "Vai trÃ² khÃ´ng há»£p lá»‡.";
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
            lblMessage.Text = $"Sai tÃªn Ä‘Äƒng nháº­p hoáº·c máº­t kháº©u. CÃ²n {remainingAttempts} láº§n thá»­.";
        }

        private void ResetFailedAttemptState()
        {
            Session.Remove("LoginFailedCount");
            Session.Remove("LoginLockUntilUtc");
        }

        private void ShowLockMessage(TimeSpan remaining)
        {
            int waitSeconds = Math.Max(1, (int)Math.Ceiling(remaining.TotalSeconds));
            lblMessage.Text = $"Báº¡n Ä‘Ã£ nháº­p sai quÃ¡ nhiá»u láº§n. Vui lÃ²ng thá»­ láº¡i sau {waitSeconds} giÃ¢y.";
        }

        private void UpdateLoginLockUi()
        {
            TimeSpan remaining;
            bool isLocked = IsLoginLocked(out remaining);

            btnLogin.Enabled = !isLocked;
            if (isLocked)
            {
                int waitSeconds = Math.Max(1, (int)Math.Ceiling(remaining.TotalSeconds));
                btnLogin.Text = $"Táº¡m khÃ³a ({waitSeconds}s)";
            }
            else
            {
                btnLogin.Text = "ÄÄƒng nháº­p";
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


