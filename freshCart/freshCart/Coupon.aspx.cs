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
    public partial class Coupon : System.Web.UI.Page
    {
        public List<Customer_class> itemsList { get; set; } //use to store customer list
        static string tempURL;

        myAccount_DAL tempCustomerObj = new myAccount_DAL(); // use to access myAccount_DAL class functions

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Phone_number"] == "")
            {
                Response.Redirect("login.aspx");
            }
            tempURL = Request.RawUrl;
            itemsList = tempCustomerObj.customer_List();
        }

        [System.Web.Services.WebMethod]
        public static void applycoupon_(string s1, string percentage)
        {
            coupon_DAL tempobj = new coupon_DAL();
            tempobj.addcoupon(Int32.Parse(s1),float.Parse(percentage));
           
        }
        [System.Web.Services.WebMethod]
        public static void removeCoupon(string s1) {
            coupon_DAL tempobj = new coupon_DAL();
            tempobj .removeCoupon_(Int32.Parse(s1));
        }
    }
}