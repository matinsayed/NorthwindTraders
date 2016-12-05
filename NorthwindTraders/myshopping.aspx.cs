using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NorthwindTraders
{
    public partial class MyCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                UpdateCart();
            }
        }

        private void UpdateCart()
        {
            CartList.DataSource = CartActions.GetCart();
            CartList.DataBind();
            if (CartList.Rows.Count > 0)
            {
                Label lbltotal = CartList.FooterRow.Cells[4].FindControl("lblTotal") as Label;
                lbltotal.Text = CartActions.GetCart().Sum(a => a.LineTotal).ToString("c");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            bool found = false;
            foreach (GridViewRow row in CartList.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox cb = row.FindControl("Remove") as CheckBox;
                    if (cb.Checked == true)
                    {
                        int cartItemID = Convert.ToInt32(row.Cells[0].Text);
                        CartActions.DeleteCartItem(cartItemID);
                        found = true;
                    }
                }
            }
            Label1.Visible = true;
            if (found == true)
            {
                Label1.Text = "Cart Items removed succcessfully....";
                UpdateCart();
            }
            else
            {
                Label1.Text = "Nothing selected...";
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in CartList.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    int cartItemID = Convert.ToInt32(row.Cells[0].Text);
                    int qty = Convert.ToInt32((row.Cells[3].FindControl("PurchaseQuantity") as TextBox).Text);

                    CartActions.UpdateQuantity(cartItemID, qty);
                    Label1.Visible = true;
                    Label1.Text = "Cart Items updated succcessfully....";
                    UpdateCart();
                }
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/checkout.aspx");
        }
    }
}