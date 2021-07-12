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
    public partial class uploadProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Phone_number"] == null)
            {
                Response.Redirect("login.aspx");
            }
        }
        protected void postProduct(object sender, EventArgs e)
        {
            warningBox.Text = "";
            int percentage = 0; // store percentage that apply on stock
            //check is image uploaded or not


            //check all possible errors that can be occur on run time
            if (!FileUpload1.HasFile)
            { 
                warningBox.ForeColor = System.Drawing.Color.OrangeRed;
                warningBox.Text = "Please select an image";
                return;
            }
            else if(Text1.Text == "" || Text2.Text == "" || Text3.Text == "" || Text4.Text == "" || Text5.InnerText == "" || Text6.Text == "" ){
                warningBox.ForeColor = System.Drawing.Color.OrangeRed;
                warningBox.Text = "Required field / fields are empty";
                return;
            }
            else if (System.Text.RegularExpressions.Regex.IsMatch(Text1.Text, "[^0-9]"))
            {
                warningBox.ForeColor = System.Drawing.Color.OrangeRed;
                warningBox.Text = "Please enter Valid CNIC (xxxxxxxxxxxxx)";
                return;
            }
            else if (System.Text.RegularExpressions.Regex.IsMatch(Text2.Text, "[^0-9]"))
            {
                warningBox.ForeColor = System.Drawing.Color.OrangeRed;
                warningBox.Text = "Please enter correct price";
                return;
            }
            else if (Text1.Text.Length != 13 ) {
                warningBox.ForeColor = System.Drawing.Color.OrangeRed;
                warningBox.Text = "Please enter Valid CNIC (xxxxxxxxxxxxx)";
                return;
            }
            else if (Text3.Text.Length > 50)
            {
                warningBox.ForeColor = System.Drawing.Color.OrangeRed;
                warningBox.Text = "Product name should be in 50 char";
                return;
            }
            else if (Text4.Text.Length > 50)
            {
                warningBox.ForeColor = System.Drawing.Color.OrangeRed;
                warningBox.Text = "Product Category should be in 50 char";
                return;
            }
            else if (Text4.Text.Length > 50)
            {
                warningBox.ForeColor = System.Drawing.Color.OrangeRed;
                warningBox.Text = "Category should be in 50 char";
                return;
            }
            else if (Text5.InnerText.Length > 50)
            {
                warningBox.ForeColor = System.Drawing.Color.OrangeRed;
                warningBox.Text = "Description should be in 50 char";
                return;
            }
            else if (System.Text.RegularExpressions.Regex.IsMatch(Text6.Text, "[^0-9]"))
            {
                warningBox.ForeColor = System.Drawing.Color.OrangeRed;
                warningBox.Text = "Please enter correct stock ";
                return;
            }
            if (Text7.Text != "")
            { // if user enter some sale then we need to check that field else ignore that field
                if (System.Text.RegularExpressions.Regex.IsMatch(Text7.Text, "[^0-9]")) {
                    warningBox.ForeColor = System.Drawing.Color.OrangeRed;
                    warningBox.Text = "Enter correct numbers in sale field";
                    return;
                }
                else if (!System.Text.RegularExpressions.Regex.IsMatch(Text7.Text, "[^0-9]"))
                { //if user enter just number and these are less between 1 to 3 then we need to check is user enter number 0-100
                    percentage = Int32.Parse(Text7.Text.Trim());
                    if (percentage < 0 || percentage > 100)
                    {
                        warningBox.ForeColor = System.Drawing.Color.OrangeRed;
                        warningBox.Text = "Please enter sale percentage (0-100)";
                        return;
                    }
                }
            }
            // now store data in database
            
            string extension = System.IO.Path.GetExtension(FileUpload1.FileName);
            //set conditon to make sure that user just enter image
            if (extension == ".eps" || extension == ".png" || extension == ".tif" || extension == ".jpeg" || extension == ".jpg" || extension == ".bmp" || extension == ".tiff")
            {
                uploadProduct_DAL tempproduct = new uploadProduct_DAL ();
                //get server folder path where we wanna store imagesC:\Users\HP\Desktop\freshCart\freshCart\home.aspx
                string path= Server.MapPath("assets\\img\\product\\size-normal\\");
                string temppath = "assets/img/product/size-normal/" + FileUpload1.FileName;
                int returnValue = tempproduct.storeProduct(Text1.Text.Trim(), Int32.Parse(Text2.Text.Trim()), Text3.Text.Trim(), Text4.Text.Trim(), Text5.InnerText.Trim(), Int32.Parse(Text6.Text.Trim()), percentage, temppath);
                if (returnValue == 1)
                {
                    Response.Write("<script>alert('Product inserted successfully')</script>");
                    FileUpload1.SaveAs(path + FileUpload1.FileName);
                }
                else {

                    warningBox.ForeColor = System.Drawing.Color.OrangeRed;
                    warningBox.Text = "Please Enter correct supplier CNIC";
                }
                
            }
            else {
                warningBox.ForeColor = System.Drawing.Color.OrangeRed;
                warningBox.Text = "Please upload images with .tif .tiff .bmp .jpg .jpeg .png and .eps extensions";
            }
                
            

        }
        
    }
}