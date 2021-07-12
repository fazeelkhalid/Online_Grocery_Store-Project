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
    public partial class Order : System.Web.UI.Page
    {
        public List<order_class> itemsList{set;get;}
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Phone_number"] == null)
            {
                Response.Redirect("login.aspx");
            }
            Order_DAL temp = new Order_DAL();
            itemsList = temp.displayOrder();
        }


        [System.Web.Services.WebMethod]
        public static void orderDeliveredCS(string s1)
        {
            Order_DAL tempCart = new Order_DAL();
            tempCart.OrderDone(Int32.Parse(s1));
        }

        protected void Refresh(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }
    }
}