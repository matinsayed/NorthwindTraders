using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NorthwindTraders
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            lblTotalVisitors.Text = Application["TotalVisitors"].ToString();
            lblActiveVisitors.Text = Application["ActiveVisitors"].ToString();

        }
    }
}