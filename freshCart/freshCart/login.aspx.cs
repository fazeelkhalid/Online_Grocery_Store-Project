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
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void Button1_click(object sender, EventArgs e)
        {
            Regex r = new Regex(@"^[0-9]{11}$");
            warningBox.Text = " ";
            if (PhoneNumber.Text == "" || password_id.Text == "")
            {
                warningBox.ForeColor = System.Drawing.Color.OrangeRed;
                warningBox.Text = "Password or phone number missing<br/>";
                return;
            }
            else if (!r.IsMatch(PhoneNumber.Text))
            {
                warningBox.ForeColor = System.Drawing.Color.OrangeRed;
                warningBox.Text = "Invalid mobile number";
                return;
            }
            myDAL login = new myDAL();
            int role = new int();
            string loginUser = login.Loginuser(PhoneNumber.Text.Trim(), password_id.Text.Trim(), out role);

            if ("Invalid mobile number or Password<br/>" == loginUser)
            {
                warningBox.ForeColor = System.Drawing.Color.OrangeRed;
                warningBox.Text = loginUser; // print message if user not able to login

            }
            else
            {
                if (role == 0)
                { // user login
                    Session["Phone_number"] = loginUser;
                    Response.Redirect("myAccount.aspx");
                }
                else if (role == 1)
                {
                    //creat session for admin login and redirect the admin

                    Session["Phone_number"] = loginUser;
                    Response.Redirect("adminMyAccount.aspx");
                }
                else
                {
                    Response.Write("<script>alert('You have been blocked contact our support for further instruction');</script>");
                }

            }
        }
 
    }
}