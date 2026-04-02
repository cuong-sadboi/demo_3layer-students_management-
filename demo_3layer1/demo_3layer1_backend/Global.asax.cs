using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace demo_3layer1
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {
            var path = (Request.Url?.AbsolutePath ?? string.Empty).ToLowerInvariant();

            // Backend only: block student-facing pages/routes.
            if (path.StartsWith("/ui/students/courseregistration") ||
                path.StartsWith("/ui/students/viewgrades") ||
                path.StartsWith("/ui/login/studentdashboard"))
            {
                Response.Redirect("~/UI/Login/Login.aspx", endResponse: true);
            }
        }
    }
}