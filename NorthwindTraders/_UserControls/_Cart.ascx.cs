using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NorthwindTraders._UserControls
{
    public partial class _Cart : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblCartCount.Text = NorthwindTraders.CartActions.GetCart().Count().ToString();
        }
    }
}