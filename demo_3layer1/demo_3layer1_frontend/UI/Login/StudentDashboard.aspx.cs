using System;
using System.Web.UI;
using demo_3layer1.Security;

namespace demo_3layer1
{
    public partial class StudentDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!SessionRoleHelper.IsInRole(Session["Role"], "Student"))
            {
                Response.Redirect("Login.aspx");
                return;
            }
        }

        protected void btnRegisterCourse_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/UI/Students/CourseRegistration.aspx");
        }

        protected void btnViewGrades_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/UI/Students/ViewGrades.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
    }
}
