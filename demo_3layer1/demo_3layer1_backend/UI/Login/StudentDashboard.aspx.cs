using System;
using System.Web.UI;

namespace demo_3layer1
{
    public partial class StudentDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
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
