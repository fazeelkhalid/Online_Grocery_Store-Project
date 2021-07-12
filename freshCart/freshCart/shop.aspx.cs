using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using freshCart.DAL;

namespace freshCart
{  
    public partial class shop : System.Web.UI.Page 
    {
        public List<product_class> itemsList { get; set; }
        Shop_DAL temp = new Shop_DAL();
        public static string userPhoneNumber { get; set; }
        static string tempURL;

        protected void Page_Load(object sender, EventArgs e){

            if (Session["Phone_number"] == null)
            {
                Response.Redirect("login.aspx");
            }

            tempURL = Request.RawUrl;
            userPhoneNumber = Session["Phone_number"].ToString();
            itemsList = temp.takeAllProduct(); // get all product from the database
        }

        [System.Web.Services.WebMethod]
        public static void GetData(string s1)
        {
            Cart_DAL tempCart = new Cart_DAL();
            string temp = userPhoneNumber;
            if (tempCart.addtoCArd(userPhoneNumber, Int32.Parse(s1)) == 3) {
                int x;
            }
        }

        protected void Refresh(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }

        [System.Web.Services.WebMethod]
        public static void removeIdCart(string s1) //remove product from cart table
        {
            Cart_DAL tempCart = new Cart_DAL();
            string temp = userPhoneNumber;
            tempCart.removeOrderFromCart(temp, Int32.Parse(s1));
            HttpContext.Current.Response.Redirect(tempURL);
        }
    }
}