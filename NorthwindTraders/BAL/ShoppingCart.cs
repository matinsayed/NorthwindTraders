using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace NorthwindTraders
{

    public class CartItem
    {
        [Key]
        public int CartItemID { get; set; }
        public int ProductID { get; set; }
        public string ProductName { get; set; }
        public int Quantity { get; set; }
        public decimal UnitPrice { get; set; }
        public decimal LineTotal
        {
            get
            {
                return this.Quantity * this.UnitPrice;
            }
        }
    }

    public static class CartActions
    {

        public static List<CartItem> GetCart()
        {
            if (HttpContext.Current.Session["MyCart"] != null)
                return HttpContext.Current.Session["MyCart"] as List<CartItem>;
            else
            {
                List<CartItem> MyCart = new List<CartItem>();
                return MyCart;
            }
        }

        public static bool SaveCartItem(CartItem cartItem)
        {

            List<CartItem> MyCart = GetCart();

            if (MyCart.Find(a => a.ProductID == cartItem.ProductID) != null)
            {
                MyCart.First(a => a.ProductID == cartItem.ProductID).Quantity += 1;
            }
            else
            {
                if (MyCart.Count > 0)
                {
                    cartItem.CartItemID = MyCart.Max(a => a.CartItemID) + 1;
                }
                else
                {
                    cartItem.CartItemID = 1;
                }
                MyCart.Add(cartItem);
            }

            HttpContext.Current.Session["MyCart"] = MyCart;
            return true;
        }

        public static bool UpdateQuantity(int cartItemID , int Qty)
        {
            List<CartItem> MyCart = GetCart();
            MyCart.Where(a => a.CartItemID == cartItemID).First().Quantity = Qty;
            
            HttpContext.Current.Session["MyCart"] = MyCart;
            return true;

        }

        public static bool DeleteCartItem(int cartItemID)
        {
            List<CartItem> MyCart = GetCart();

            var cartItem = MyCart.SingleOrDefault(a => a.CartItemID == cartItemID);
            if (cartItem != null)
                MyCart.Remove(cartItem);
            
            HttpContext.Current.Session["MyCart"] = MyCart;
            return true;
        }


    }


}