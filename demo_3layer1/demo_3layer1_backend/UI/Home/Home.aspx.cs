using System;
using System.Web.UI;

namespace demo_3layer1
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            btnStudent.Visible = false;
        }

        protected void btnAdmin_Click(object sender, EventArgs e)
        {
            Session["SelectedRole"] = "Admin";
            Session["CameFromHome"] = true;
            Response.Redirect("~/UI/Login/Login.aspx");
        }

        protected void btnTeacher_Click(object sender, EventArgs e)
        {
            Session["SelectedRole"] = "Teacher";
            Session["CameFromHome"] = true;
            Response.Redirect("~/UI/Login/Login.aspx");
        }

        protected void btnStudent_Click(object sender, EventArgs e)
        {
            Session["SelectedRole"] = null;
            Session["CameFromHome"] = true;
            Response.Redirect("~/UI/Login/Login.aspx");
        }
        protected void btnLoginNow_Click(object sender, EventArgs e)
        {
            // Chuyển hướng sang trang đăng nhập
            Session["CameFromHome"] = true;
            Response.Redirect("~/UI/Login/Login.aspx");
        }
    }
}
