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
    public partial class insertSupplier : System.Web.UI.Page
    {
        globalFunctions Globalfun = new globalFunctions(); // checking for the gloabal functions
        uploadProduct_DAL tempuploadProduct_DAL = new uploadProduct_DAL(); // use to access uploadProduct_DAL
        
        Regex contactCheck = new Regex(@"^[0-9]{11}$");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Phone_number"] == null)
            {
                Response.Redirect("login.aspx");
            }

        }

        public void addSupplier(object sender, EventArgs e)
        {
            warningBox.Text = "";
            if(Text1.Text=="" || Text2.Text=="" ||Text3.Text=="" ||Text4.Text=="" ){
                warningBox.ForeColor = System.Drawing.Color.OrangeRed;
                warningBox.Text = "Required Field / Fields are empty";
                return;
            }
            else if (Text1.Text.Length > 50) {
                warningBox.ForeColor = System.Drawing.Color.OrangeRed;
                warningBox.Text = "Supplier name is too large";
                return;
            }
            else if (Text2.Text.Length > 50)
            {
                warningBox.ForeColor = System.Drawing.Color.OrangeRed;
                warningBox.Text = "Company name is too large";
                return;
            }
            else if (System.Text.RegularExpressions.Regex.IsMatch(Text3.Text, "[^0-9]") || Text3.Text.Length!=13)
            {
                warningBox.ForeColor = System.Drawing.Color.OrangeRed;
                warningBox.Text = "Please enter valid CNIC (xxxxxxxxxxxxx)";
                return;
            }
            else if (Text4.Text.Length > 50)
            {
                warningBox.ForeColor = System.Drawing.Color.OrangeRed;
                warningBox.Text = "Company address is too large";
                return;
            }
            if (Text5.Text != "") // means user wanna enter email so now check is user enter valid email or nor
            {
                if (!Globalfun.EmailIsValid(Text5.Text) || Text5.Text.Length > 50)
                {
                    warningBox.ForeColor = System.Drawing.Color.OrangeRed;
                    warningBox.Text = "Please enter valid email";
                    return;
                }
            }
            if (Text6.Text != "" && !contactCheck.IsMatch(Text6.Text))
            {
                warningBox.ForeColor = System.Drawing.Color.OrangeRed;
                warningBox.Text = "Please enter valid mobile number";
                return;
            }
            tempuploadProduct_DAL.storeSupplier(Text1.Text, Text2.Text, Text5.Text, Text6.Text, Text3.Text, Text4.Text);
            warningBox.ForeColor = System.Drawing.Color.OrangeRed;
            warningBox.Text = "Supplier stored";
            return;         
        }

    }
}