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
    public partial class Remove_supplier : System.Web.UI.Page
    {
        public List<supplier_class> itemsList { get; set; } //use to store customer list
        static string tempURL;
        myAccount_DAL tempCustomerObj = new myAccount_DAL(); // use to access myAccount_DAL class functions

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Phone_number"] == null)
            {
                Response.Redirect("login.aspx");
            }
            tempURL = Request.RawUrl;
            itemsList = tempCustomerObj.supplier_List();
        }

        protected void Refresh(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }

        [System.Web.Services.WebMethod]
        public static void removeSupplier_(string s1)
        {
            Remove_DAL tempobj = new Remove_DAL();
            Remove_DAL tempCart = new Remove_DAL();
            tempobj.removeSupplier_DALfun(Int32.Parse(s1));
        }

    }
}