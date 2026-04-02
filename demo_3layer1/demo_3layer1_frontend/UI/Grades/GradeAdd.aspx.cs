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
                    lblMessage.Text = "Chưa có dữ liệu sinh viên hoặc môn học để nhập điểm.";
                    return;
                }

                int studentId;
                int subjectId;
                if (!int.TryParse(ddlStudent.SelectedValue, out studentId) || !int.TryParse(ddlSubject.SelectedValue, out subjectId))
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Dữ liệu sinh viên/môn học không hợp lệ.";
                    return;
                }

                // Chuáº©n hÃ³a dáº¥u tháº­p phÃ¢n
                string scoreText = txtScore.Text.Trim();
                scoreText = scoreText.Replace(',', '.'); // cho phÃ©p 7,5 hoáº·c 7.5

                double score = double.Parse(scoreText, CultureInfo.InvariantCulture);

                string message = _gradeBus.SaveGrade(studentId, subjectId, score);

                if (message.Contains("thÃ nh cÃ´ng"))
                {
                    Response.Redirect("GradeList.aspx"); // quay vá» báº£ng Ä‘iá»ƒm
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
                lblMessage.Text = "âŒ Äiá»ƒm khÃ´ng há»£p lá»‡. Vui lÃ²ng nháº­p sá»‘ tá»« 0 Ä‘áº¿n 10 (vd: 7,5 hoáº·c 7.5).";
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "âŒ Lá»—i: " + ex.Message;
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("GradeList.aspx");
        }
    }
}



