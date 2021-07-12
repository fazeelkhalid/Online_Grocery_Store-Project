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
    public partial class signUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_click(object sender, EventArgs e)
        {
            string message;
            globalFunctions Globalfun = new globalFunctions(); //use to access global function

            Regex contactCheck = new Regex(@"^[0-9]{11}$");
            Label1.Text = " ";
            Label2.Text = " ";
            UserNAmeError.Text = "";
            emailError.Text = "";

            if (userName.Text == "" || contactNumber_id.Text == "" || password_id.Text == "" || reEnterpassword.Text == "")
            {
                //Response.Write("<script> alert('session') </script>");
                Label1.ForeColor = System.Drawing.Color.OrangeRed;
                Label1.Text = "Please fill all the fields";
                return;
            }
            else if (userName.Text.Length > 50)
            { // user name should be in 50 character
                UserNAmeError.ForeColor = System.Drawing.Color.OrangeRed;
                UserNAmeError.Text = "User name must be in 50 Character";
                return;
            }
            else if (!Globalfun.ValidatePassword(password_id.Text.Trim(), out message))
            {
                Label1.Text = message;
                Label1.ForeColor = System.Drawing.Color.OrangeRed;
                return;
            }
            else if (!Globalfun.EmailIsValid(email.Text))
            {
                emailError.ForeColor = System.Drawing.Color.OrangeRed;
                emailError.Text = "Please Enter valid Email";
                return;

            }
            else if (password_id.Text != reEnterpassword.Text)
            {
                Label1.ForeColor = System.Drawing.Color.OrangeRed;
                Label1.Text = "Password not matches";
                return;
            }
            else if (!contactCheck.IsMatch(contactNumber_id.Text))
            {
                Label2.ForeColor = System.Drawing.Color.OrangeRed;
                Label2.Text = "Invalid mobile number";
                return;
            }

            myDAL my = new myDAL();
            if (my.InsertUserData(userName.Text.Trim(), contactNumber_id.Text.Trim(), email.Text.Trim(), password_id.Text.Trim(), 0) == 2) //if contact number alreadey exist in database it will show a message for the user
            {
                Label2.ForeColor = System.Drawing.Color.OrangeRed;
                Label2.Text = "Please try other mobile number";
                return;
            }
            else
            {
                Session["Phone_number"] = contactNumber_id.Text.Trim();
                if (Session["Phone_number"].ToString() != null)
                {
                    Response.Redirect("myAccount.aspx");
                }
            }
        }
        
    }
}