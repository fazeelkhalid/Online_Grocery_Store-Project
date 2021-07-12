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
    public class myDAL
    {
        //conection string
        private static readonly string constr = System.Configuration.ConfigurationManager.ConnectionStrings["FreshCart_connection"].ConnectionString;

        public int InsertUserData(string name, string PhoneNumber, string email, string Password, int Role)
        {
            DataSet table = new DataSet();
            SqlConnection FortCart_sql_Connection = new SqlConnection(constr);
            FortCart_sql_Connection.Open();
            SqlCommand insertCommand = new SqlCommand("insert_customer", FortCart_sql_Connection);

            insertCommand.CommandType = CommandType.StoredProcedure;
            insertCommand.Parameters.AddWithValue("@cName", name);
            insertCommand.Parameters.AddWithValue("@cEmail", email);
            insertCommand.Parameters.AddWithValue("@cNo", PhoneNumber);
            insertCommand.Parameters.AddWithValue("@cPass", Password);
            insertCommand.Parameters.AddWithValue("@cRole", Role);

            SqlParameter returnValue = new SqlParameter();
            returnValue.ParameterName = "@result"; // get return value from procedure
            returnValue.SqlDbType = SqlDbType.Int;
            returnValue.Direction = ParameterDirection.Output;
            insertCommand.Parameters.Add(returnValue);
            insertCommand.ExecuteNonQuery();
            int tempvalue = Convert.ToInt16(returnValue.Value);
            FortCart_sql_Connection.Close();// close connection
            return tempvalue;

        }

        public string Loginuser(string phoneNumber,string password,out int role) {

            SqlConnection FortCart_sql_Connection = new SqlConnection(constr);
            FortCart_sql_Connection.Open();

            SqlCommand cm = new SqlCommand("select * from Customer_table where contact# = '" + phoneNumber + "' AND password = '" + password + "'", FortCart_sql_Connection);
            SqlDataReader sdr = cm.ExecuteReader();

            if (sdr.Read())
            {
                role = sdr.GetByte(6);
                string loginId = sdr.GetString(3);
                sdr.Close(); // close connection
                return loginId;
            }
            role = 0;
            return"Invalid mobile number or Password<br/>";
        }
    }
}