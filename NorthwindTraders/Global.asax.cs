using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace NorthwindTraders
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            Application["TotalVisitors"] = 0;
            Application["ActiveVisitors"] = 0;
        }
        protected void Session_Start(object sender, EventArgs e)
        {
            Application["TotalVisitors"] = Convert.ToInt32(Application["TotalVisitors"]) +  1;
            Application["ActiveVisitors"] = Convert.ToInt32(Application["ActiveVisitors"]) + 1;
        }
        protected void Session_End(object sender, EventArgs e)
        {
            Application["ActiveVisitors"] = Convert.ToInt32(Application["ActiveVisitors"]) - 1;
            //Response.Redirect(@"~\sessiontimeout.aspx");
        }
        protected void Application_End(object sender, EventArgs e)
        {
        }

    }
}