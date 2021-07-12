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
    public class coupon_DAL
    {
        private static readonly string constr = System.Configuration.ConfigurationManager.ConnectionStrings["FreshCart_connection"].ConnectionString;
       
        public void addcoupon(int customerId, float percentage)
        {
            DataSet table = new DataSet();
            SqlConnection FortCart_sql_Connection = new SqlConnection(constr);
            FortCart_sql_Connection.Open();
            SqlCommand insertCommand = new SqlCommand("Add_coupon", FortCart_sql_Connection);

            insertCommand.CommandType = CommandType.StoredProcedure;
            insertCommand.Parameters.AddWithValue("@customer_id", customerId);
            insertCommand.Parameters.AddWithValue("@amount", percentage);
            insertCommand.ExecuteNonQuery();
            FortCart_sql_Connection.Close();// close connection

        }

        public void removeCoupon_(int custId)
        {
            DataSet table = new DataSet();
            SqlConnection FortCart_sql_Connection = new SqlConnection(constr);
            FortCart_sql_Connection.Open();
            SqlCommand cm = new SqlCommand("delete from Coupon_table where Customer_id ='" + custId + "'", FortCart_sql_Connection);
            SqlDataReader sdr = cm.ExecuteReader();
            sdr.Close();

        }
    }
}