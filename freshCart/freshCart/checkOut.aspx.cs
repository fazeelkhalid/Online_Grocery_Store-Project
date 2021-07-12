using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using freshCart.DAL;

namespace freshCart
{
    public partial class checkOut : System.Web.UI.Page
    {
         //use to display data in cart
        public string totalCartProduct{ get; set; }
        public string Subtotal{ get; set; } // total without taxes shipping charges
        public string Shipping { get; set; } // shipping cost will be 10 percent of the total price
        public string Taxes { get; set; } // according to government rules
        public string TotalPrice { get; set; } // sum of subtotal plus taxes and shipping charges


        public List<product_class> itemsList { get; set; }
        public List<Cart_class> cartItemsList { get; set; }
        static Cart_DAL tempCart = new Cart_DAL();
        static string userPhoneNumber;
        Shop_DAL temp = new Shop_DAL();
       
       
        protected void Page_Load(object sender, EventArgs e)
        {
             if (Session["Phone_number"] == null)
             {
                 Response.Redirect("login.aspx");
             }

            // get cart data from the data base
            checkout_DAL tempOrder = new checkout_DAL();//use to access checkout order function and data members
            Text1.Text = tempOrder.getName(Session["Phone_number"].ToString()); // getUser name
            Text2.Text = Session["Phone_number"].ToString(); // get phone numbername

            userPhoneNumber = Session["Phone_number"].ToString();
            cartItemsList = tempCart.getCartProduct(Session["Phone_number"].ToString()); // pass data that present in the session 
            totalCartProduct = Convert.ToString(cartItemsList.Count);
            itemsList = temp.takeAllProduct(); // get all product from the database

            float totalSubtotal = 0;

            for (int i = 0; i < cartItemsList.Count; i++)
            { // count the price of all the amount 
                int discount = Int32.Parse(cartItemsList[i].Discount); // get discount
                int tempTotalPrice = Int32.Parse(cartItemsList[i].price); // get total price of item without discount
                float answer = ((float)discount / 100);
                answer = (float)tempTotalPrice * answer; // get discount price 
                answer = ((float)tempTotalPrice - answer);
                totalSubtotal += answer;
            }
            //(float)(Math.Round(totalSubtotal - 0.5 / (Math.Pow(10, 2)), 2)); -> this function will convert float value upto 2 decimal number
            Subtotal = Convert.ToString((float)(Math.Round(totalSubtotal - 0.5 / (Math.Pow(10, 2)), 2)));
            Shipping = Convert.ToString((float)(Math.Round((totalSubtotal * 0.10) - 0.5 / (Math.Pow(10, 2)), 2)));
            Taxes = Convert.ToString((float)(Math.Round((totalSubtotal * 0.17) - 0.5 / (Math.Pow(10, 2)), 2)));
            TotalPrice = Convert.ToString(float.Parse(Subtotal) + float.Parse(Shipping) + float.Parse(Taxes));
        }

        protected void addToOrder(object sender, EventArgs e) { 
            checkout_DAL tempOrder = new checkout_DAL();//use to access checkout order function and data members
            


            if (Text3.Text == "") {
                Text4.ForeColor = System.Drawing.Color.OrangeRed;
                Text4.Text = "Please enter address <br/>";
                return;
            }
            else if (Text3.Text.Length > 50) {
                Text4.ForeColor = System.Drawing.Color.OrangeRed;
                Text4.Text = "Address is too large<br/>";
                return;
            }
            int status = tempOrder.addToOrder(Session["Phone_number"].ToString(), Text3.Text.Trim());
            if (status != 0 && Int32.Parse(totalCartProduct) != 0)
            {
                Text4.ForeColor = System.Drawing.Color.OrangeRed;
                Text4.Text = "Stock cross the order boundary<br/>";
                return;
            }

            //ForeColor = System.Drawing.Color.OrangeRed;
        }
        protected void Refresh(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }
    }
}