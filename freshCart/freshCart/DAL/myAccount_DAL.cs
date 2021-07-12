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

namespace freshCart.DAL
{
    public class myAccount_DAL
    {
        private static readonly string constr = System.Configuration.ConfigurationManager.ConnectionStrings["FreshCart_connection"].ConnectionString;

        //retrive all neccessary information from the database
        public bool showAccountInfo(out string name,out string email,string PhoneNumber,out string Purchase) {
            SqlConnection FortCart_sql_Connection = new SqlConnection(constr);
            FortCart_sql_Connection.Open();

            SqlCommand cm = new SqlCommand("select * from Customer_table where contact# = '" + PhoneNumber + "'", FortCart_sql_Connection);
            SqlDataReader sdr = cm.ExecuteReader();
            if (sdr.Read())
            {
                name = sdr.GetString(1);
                email = sdr.GetString(2);
                Purchase = Convert.ToString(sdr.GetDouble(5));
                sdr.Close();//close database link 
                return false;
            }
            name = "";
            email = "";
            Purchase = "";
            return true; // some error occur so we will redirect the page through this value
        }

        //update account password
        public bool updatePassword(string current_Password,string new_password, string phoneNUmber) {
            SqlConnection FortCart_sql_Connection = new SqlConnection(constr);
            FortCart_sql_Connection.Open();

            //check is old password match in our dataBase.
            SqlCommand cm = new SqlCommand("select * from Customer_table where contact# = '" + phoneNUmber + "' AND password = '" + current_Password + "'", FortCart_sql_Connection);
            SqlDataReader sdr = cm.ExecuteReader();

            if (sdr.Read())
            {
                sdr.Close();
                cm = new SqlCommand("update Customer_table set Password = '" + new_password + "' where Contact# = '" + phoneNUmber + "'", FortCart_sql_Connection);
                sdr = cm.ExecuteReader();
                sdr.Close();
                return true;// = "Password Updated";
            }
            else {
                return false; //"New and Confirm password are not match";
                
            }
        }

        //update other information like name and password
        public bool updateEmailPassword(string email, string password, string name, string phoneNumber)
        {
            SqlConnection FortCart_sql_Connection = new SqlConnection(constr);
            FortCart_sql_Connection.Open();

            //check is old password match in our dataBase.
            SqlCommand cm = new SqlCommand("select * from Customer_table where contact# = '" + phoneNumber + "' AND password = '" + password + "'", FortCart_sql_Connection);
            SqlDataReader sdr = cm.ExecuteReader();

            if (sdr.Read())
            {
                sdr.Close();
                if (email != "")
                {
                    cm = new SqlCommand("update Customer_table set Customer_email = '" + email + "' where Contact# = '" + phoneNumber+ "'", FortCart_sql_Connection);
                    sdr = cm.ExecuteReader();
                    sdr.Close();
                    return true;//"Information updated";
            
                }
                if (name != "")
                {
                    cm = new SqlCommand("update Customer_table set Customer_name = '" + name + "' where Contact# = '" + phoneNumber + "'", FortCart_sql_Connection);
                    sdr = cm.ExecuteReader();
                    sdr.Close();//close 2nd connection
                    return true;//"Information updated";
                }
            }

            return false; // Password not match;
        }
      
        public List<product_class> productList()
        {
            List<product_class> pList = new List<product_class>();

            SqlConnection FortCart_sql_Connection = new SqlConnection(constr);
            FortCart_sql_Connection.Open();

            SqlCommand cm = new SqlCommand("select * from Product_table", FortCart_sql_Connection);
            SqlDataReader sdr = cm.ExecuteReader();

            while (sdr.Read())
            {
                product_class temp = new product_class();
                temp.Pid = Convert.ToString(sdr.GetInt32(0));
                temp.productname = sdr.GetString(2);
                temp.price = Convert.ToString(sdr.GetDouble(3));
                temp.Discount = Convert.ToString(sdr.GetInt32(10)); // sale or discount
                temp.totalStock = Convert.ToString(sdr.GetInt32(6));
                temp.totalSale = Convert.ToString(sdr.GetInt32(6) - sdr.GetInt32(7));
                temp.supplierId = Convert.ToString(sdr.GetInt32(1));
                pList.Add(temp);
            }
            return pList;
        }

        public List<Customer_class> customer_List() { //return customer list

            List<Customer_class> CList = new List<Customer_class>();

            SqlConnection FortCart_sql_Connection = new SqlConnection(constr);
            FortCart_sql_Connection.Open();

            SqlCommand cm = new SqlCommand("select * from Customer_table", FortCart_sql_Connection);
            SqlDataReader sdr = cm.ExecuteReader();

            while (sdr.Read())
            {
                Customer_class temp = new Customer_class();
                temp.Cid = Convert.ToString(sdr.GetInt32(0));
                temp.name = sdr.GetString(1);
                temp.email = sdr.GetString(2);
                temp.phone = sdr.GetString(3);
                temp.purchase = Convert.ToString(sdr.GetDouble(5));
                temp.role = Convert.ToString(sdr.GetByte(6));
                CList.Add(temp);
            }
            return CList;
        
        }
        
        public List<supplier_class> supplier_List()
        { //return customer list

            List<supplier_class> SList = new List<supplier_class>();

            SqlConnection FortCart_sql_Connection = new SqlConnection(constr);
            FortCart_sql_Connection.Open();

            SqlCommand cm = new SqlCommand("select * from Supplier_table", FortCart_sql_Connection);
            SqlDataReader sdr = cm.ExecuteReader();

            while (sdr.Read())
            {
                supplier_class temp = new supplier_class();
                temp.id = Convert.ToString(sdr.GetInt32(0));
                temp.name = sdr.GetString(1);
                temp.company = sdr.GetString(2);
                temp.contact = sdr.GetString(4);
                temp.CNIC = sdr.GetString(5);
                SList.Add(temp);
            }
            return SList;

        }
    }
}