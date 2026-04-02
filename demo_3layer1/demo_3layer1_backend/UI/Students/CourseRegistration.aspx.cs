using demo_3layer1.DataAccess;
using demo_3layer1.Models;
using demo_3layer1.Security;
using System;
using System.Linq;
using System.Web.UI.WebControls;

namespace demo_3layer1.UI.Students
{
    public partial class CourseRegistration : System.Web.UI.Page
    {
        private readonly SubjectDataAccess _subjectData = new SubjectDataAccess();
        private readonly AppDbContext _context = new AppDbContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!SessionRoleHelper.IsInRole(Session["Role"], "Student"))
            {
                Response.Redirect("~/UI/Login/Login.aspx");
                return;
            }
            if (!IsPostBack)
            {
                BindSubjects();
                BindRegistrations();
            }
        }

        private void BindSubjects()
        {
            var subjects = _subjectData.GetAllSubjects();
            ddlSubjects.DataSource = subjects;
            ddlSubjects.DataTextField = "Name";
            ddlSubjects.DataValueField = "Id";
            ddlSubjects.DataBind();
        }

        private int GetCurrentStudentId()
        {
            return Session["StudentId"] is int id ? id : 0;
        }

        private void BindRegistrations()
        {
            int studentId = GetCurrentStudentId();
            if (studentId <= 0)
            {
                lblMessage.CssClass = "portal-message error";
                lblMessage.Text = "Tai khoan chua lien ket ho so sinh vien.";
                gvRegistrations.DataSource = Enumerable.Empty<object>();
                gvRegistrations.DataBind();
                return;
            }

            var regs = _context.CourseRegistrations
                .Where(r => r.StudentId == studentId)
                .Select(r => new { r.Id, r.Semester, Subject = r.Subject })
                .ToList();
            gvRegistrations.DataSource = regs;
            gvRegistrations.DataBind();
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            int studentId = GetCurrentStudentId();
            if (studentId == 0)
            {
                lblMessage.CssClass = "portal-message error";
                lblMessage.Text = "Không xác định được sinh viên hiện tại.";
                return;
            }

            if (ddlSubjects.Items.Count == 0)
            {
                lblMessage.CssClass = "portal-message warn";
                lblMessage.Text = "Chua co mon hoc de dang ky.";
                return;
            }

            int subjectId;
            if (!int.TryParse(ddlSubjects.SelectedValue, out subjectId))
            {
                lblMessage.CssClass = "portal-message error";
                lblMessage.Text = "Mon hoc khong hop le.";
                return;
            }

            string semester = txtSemester.Text.Trim();
            if (string.IsNullOrWhiteSpace(semester)) semester = DateTime.Now.ToString("yyyy");

            bool exists = _context.CourseRegistrations.Any(r => r.StudentId == studentId && r.SubjectId == subjectId && r.Semester == semester);
            if (exists)
            {
                lblMessage.CssClass = "portal-message warn";
                lblMessage.Text = "Môn học đã được đăng ký cho học kỳ này.";
                return;
            }

            _context.CourseRegistrations.Add(new demo_3layer1.Models.CourseRegistration
            {
                StudentId = studentId,
                SubjectId = subjectId,
                Semester = semester
            });
            _context.SaveChanges();

            lblMessage.CssClass = "portal-message ok";
            lblMessage.Text = "Đăng ký thành công.";
            BindRegistrations();
        }

        protected void gvRegistrations_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteRegistration")
            {
                int studentId = GetCurrentStudentId();
                int id = Convert.ToInt32(e.CommandArgument);
                var existing = _context.CourseRegistrations.Find(id);
                if (existing != null && existing.StudentId == studentId)
                {
                    _context.CourseRegistrations.Remove(existing);
                    _context.SaveChanges();
                    BindRegistrations();
                }
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/UI/Login/StudentDashboard.aspx");
        }
    }
}
