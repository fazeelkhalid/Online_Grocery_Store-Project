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
using  freshCart.DAL;

namespace freshCart
{
    public partial class myAccount : System.Web.UI.Page
    {
        private globalFunctions globanFun = new globalFunctions();
        private myAccount_DAL info = new myAccount_DAL(); // for access myAccount_DAL.cs class function

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Phone_number"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                HttpCookie cookie = new HttpCookie("FreshCartCookies");
                if (Request.Cookies["FreshCartCookies"] != null)
                {
                
                    Text1.Value = Request.Cookies["FreshCartCookies"]["last-login-date"].ToString();
                    Text2.Value = Request.Cookies["FreshCartCookies"]["last-login-time"].ToString();

                }
                else {
                    Text1.Value = DateTime.Now.ToString("M-d-yyyy");
                    Text2.Value = DateTime.Now.ToString("hh:mm:ss");
                }
                string name = "";
                string email = "";
                string purchase = "";
                
                bool isError = info.showAccountInfo(out name,out email,Session["Phone_number"].ToString(),out purchase); // take information from database through myAccount_DAL class 
                if (!isError)
                {
                    NameOut.Value = name;
                    Customer_name.Text = name;
                    EmailOut.Value = email;
                    phoneNumberOut.Value = Session["Phone_number"].ToString();
                    TotalPurchaseOut.Value = purchase;
                }
                else { // if some error occur during accessing of data in DAL layer
                    Response.Redirect("login.aspx");
                }
            }
        }
        
        protected void Button1_click(object sender, EventArgs e)
        {

            nameOrEmailWarning.Text = " ";
            passwordwarningBox.Text = " ";
            string errorString = "";
            if (oldPassword.Text == "" || newPassword.Text == "" || confirmPassword.Text == "") // if any required field is empty
            {
                passwordwarningBox.Text = "Password field empty";
            }
            else if (!globanFun.ValidatePassword(newPassword.Text.Trim(), out errorString)) // if password not follow a strong pattern
            {
                passwordwarningBox.Text = errorString;
            }
            else if(newPassword.Text.Trim() != confirmPassword.Text.Trim()){ // if new and confirm password not match
                 passwordwarningBox.Text = "New and Confirm password are not match";
            }
            else { 
                if(!info.updatePassword(oldPassword.Text.Trim(),newPassword.Text.Trim(),Session["Phone_number"].ToString())){
                    passwordwarningBox.Text = "Password not match";    
                }    
                else{
                    passwordwarningBox.Text = "Password Updated";
                }
            }
            newPassword.Text = "";
            confirmPassword.Text = "";
            oldPassword.Text = "";
            
        }

        protected void Button2_click(object sender, EventArgs e)
        {
            passwordwarningBox.Text = "";
            nameOrEmailWarning.Text = " ";
 
            if (otherInfoCurrentPass.Text == "")
            {
                nameOrEmailWarning.Text = "Password field empty";
            }
            else if (!globanFun.EmailIsValid(newEmail.Text.Trim()))
            {
                nameOrEmailWarning.Text = "Please enter valid email";
            }
            else if(!info.updateEmailPassword(newEmail.Text.Trim(), otherInfoCurrentPass.Text.Trim(),changeName.Text.Trim(), Session["Phone_number"].ToString())){
               nameOrEmailWarning.Text = "Password not match";
            }
            else{
                nameOrEmailWarning.Text = "Information updated";
            }

            otherInfoCurrentPass.Text = "";
            changeName.Text = "";
            newEmail.Text = "";
            this.Page_Load(sender,e);
        }

        protected void Logout_button(object sender, EventArgs e)
        {
            //create a cookie by using HttpCookie class and add the name of the cookie that is Democookie  
            HttpCookie cookie = new HttpCookie("FreshCartCookies");
            //assign the textBoxes Value on introduction-of-cookies  
            cookie["last-login-date"] = DateTime.Now.ToString("M-d-yyyy");
            cookie["last-login-time"] = DateTime.Now.ToString("hh:mm:ss");
            //Write the Cookies on the client machine  
            Response.Cookies.Add(cookie);
            //add the Expiration Time That is 20 days
            cookie.Expires = DateTime.Now.AddDays(20);

            Session.Remove("Phone_number"); 
            Session.Clear(); 
            Session.Abandon();
            Session.RemoveAll();
            Response.Redirect("login.aspx");
        }

        protected void Refresh(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }
    }
}