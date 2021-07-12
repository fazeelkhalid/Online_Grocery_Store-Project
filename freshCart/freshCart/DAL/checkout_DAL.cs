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

namespace freshCart.DAL
{
    public class checkout_DAL
    {
        private static readonly string constr = System.Configuration.ConfigurationManager.ConnectionStrings["FreshCart_connection"].ConnectionString;

            
            public int addToOrder(string phoneNumber, string address) { //this function will add things in the order

                Cart_DAL tempCartObj = new Cart_DAL();//for accessing Cart_DAL objects
                DataSet table = new DataSet();
                SqlConnection FortCart_sql_Connection = new SqlConnection(constr);
                FortCart_sql_Connection.Open();
                
                int custId = tempCartObj.getCustomerId(phoneNumber);

                //now open connection for storing product into the cart table
                FortCart_sql_Connection = new SqlConnection(constr);
                FortCart_sql_Connection.Open();

                SqlCommand insertCommand = new SqlCommand("Add_to_order", FortCart_sql_Connection);

                insertCommand.CommandType = CommandType.StoredProcedure;
                insertCommand.Parameters.AddWithValue("@in_customer_id", custId);
                insertCommand.Parameters.AddWithValue("@in_Address", address);

                SqlParameter returnValue = new SqlParameter();
                returnValue.ParameterName = "@status"; // get return value from procedure
                returnValue.SqlDbType = SqlDbType.Int;
                returnValue.Direction = ParameterDirection.Output;
                insertCommand.Parameters.Add(returnValue);
                insertCommand.ExecuteNonQuery();

                int tempvalue = 0;
                if (returnValue.Value == "") // check if the string is null then data not enter correctly
                {
                    tempvalue = Convert.ToInt16(returnValue.Value);
                }
                FortCart_sql_Connection.Close();// close connection
                return tempvalue;
        
            }


            public string getName(string phoneNumber)
            {

                SqlConnection FortCart_sql_Connection = new SqlConnection(constr);
                FortCart_sql_Connection.Open();

                SqlCommand cm = new SqlCommand("select * from Customer_table where contact# = '" + phoneNumber + "'", FortCart_sql_Connection);
                SqlDataReader sdr = cm.ExecuteReader();

                if (sdr.Read())
                {
                   
                    string loginId = sdr.GetString(1);
                    sdr.Close(); // close connection
                    return loginId;
                }
                return "Invalid mobile number or Password<br/>";
            }
    }
}