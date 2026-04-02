using demo_3layer1.Business;
using demo_3layer1.DataAccess;
using demo_3layer1.Security;
using System;
using System.Linq;
using demo_3layer1.Models;
using System.Globalization;
using System.Web.UI.WebControls;


namespace demo_3layer1.UI.Grades
{
    public partial class GradeAdd : System.Web.UI.Page
    {
        private readonly GradeBusiness _gradeBus = new GradeBusiness();
        private readonly StudentDataAccess _studentData = new StudentDataAccess();
        private readonly SubjectDataAccess _subjectData = new SubjectDataAccess();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!SessionRoleHelper.IsInRole(Session["Role"], "Admin", "Teacher"))
            {
                Response.Redirect("~/UI/Login/Login.aspx");
                return;
            }
            if (!IsPostBack)
            {
                ddlStudent.DataSource = _studentData.GetAllStudents();
                ddlStudent.DataTextField = "Name";
                ddlStudent.DataValueField = "Id";
                ddlStudent.DataBind();

                ddlSubject.DataSource = _subjectData.GetAllSubjects();
                ddlSubject.DataTextField = "Name";
                ddlSubject.DataValueField = "Id";
                ddlSubject.DataBind();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (!SessionRoleHelper.IsInRole(Session["Role"], "Admin", "Teacher"))
            {
                Response.Redirect("~/UI/Login/Login.aspx");
                return;
            }

            try
            {
                if (ddlStudent.Items.Count == 0 || ddlSubject.Items.Count == 0)
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Chua co du lieu sinh vien hoac mon hoc de nhap diem.";
                    return;
                }

                int studentId;
                int subjectId;
                if (!int.TryParse(ddlStudent.SelectedValue, out studentId) || !int.TryParse(ddlSubject.SelectedValue, out subjectId))
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Du lieu sinh vien/mon hoc khong hop le.";
                    return;
                }

                // Chuẩn hóa dấu thập phân
                string scoreText = txtScore.Text.Trim();
                scoreText = scoreText.Replace(',', '.'); // cho phép 7,5 hoặc 7.5

                double score = double.Parse(scoreText, CultureInfo.InvariantCulture);

                string message = _gradeBus.SaveGrade(studentId, subjectId, score);

                if (message.Contains("thành công"))
                {
                    Response.Redirect("GradeList.aspx"); // quay về bảng điểm
                }
                else
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = message;
                }
            }
            catch (FormatException)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "❌ Điểm không hợp lệ. Vui lòng nhập số từ 0 đến 10 (vd: 7,5 hoặc 7.5).";
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "❌ Lỗi: " + ex.Message;
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("GradeList.aspx");
        }
    }
}
