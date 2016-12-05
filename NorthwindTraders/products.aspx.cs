using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NorthwindTraders
{
    public partial class products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "AddToCart")
            {
                int productid = Convert.ToInt32((e.Item.FindControl("ProductIDLabel") as Label).Text);
                string productname = (e.Item.FindControl("ProductNameLabel") as Label).Text;
                Label lbl = e.Item.FindControl("UnitPriceLabel") as Label;
                decimal unitprice = Decimal.Parse(lbl.Text, NumberStyles.AllowCurrencySymbol | NumberStyles.AllowDecimalPoint | NumberStyles.AllowThousands, new CultureInfo("en-US"));

                CartActions.SaveCartItem(new CartItem() { ProductID = productid, ProductName = productname, UnitPrice = unitprice, Quantity = 1 });
                Label1.Text = "Product saved successfully in the cart.";
                Label1.Visible = true;
            }
        }
    }
}