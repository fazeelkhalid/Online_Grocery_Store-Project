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
    public class Remove_DAL
    {
        private static readonly string constr = System.Configuration.ConfigurationManager.ConnectionStrings["FreshCart_connection"].ConnectionString;
       
        public void removeProducrt_DALfun(int productid){

            DataSet table = new DataSet();
            SqlConnection FortCart_sql_Connection = new SqlConnection(constr);
            FortCart_sql_Connection.Open();
            SqlCommand cm = new SqlCommand("delete from Cart_table where Cart_table.Product_id  = '" + productid + "' delete from order_table where order_table.Product_id = '" + productid + "'delete from Product_table where Product_table.Product_id ='" + productid+"'", FortCart_sql_Connection);
            SqlDataReader sdr = cm.ExecuteReader();
            sdr.Close();
        }


        public void removeSupplier_DALfun(int supplierId)
        {

            DataSet table = new DataSet();
            SqlConnection FortCart_sql_Connection = new SqlConnection(constr);
            FortCart_sql_Connection.Open();
            SqlCommand insertCommand = new SqlCommand("delete_supplier", FortCart_sql_Connection);

            insertCommand.CommandType = CommandType.StoredProcedure;
            insertCommand.Parameters.AddWithValue("@in_supplier_id", supplierId);
            insertCommand.ExecuteNonQuery();
            FortCart_sql_Connection.Close();// close connection
            
        }
       
        public void restrictCustomer_DALfun(int custId) // block and unblock the customer
        {

            DataSet table = new DataSet();
            SqlConnection FortCart_sql_Connection = new SqlConnection(constr);
            FortCart_sql_Connection.Open();
            SqlCommand insertCommand = new SqlCommand("block_unblock", FortCart_sql_Connection);

            insertCommand.CommandType = CommandType.StoredProcedure;
            insertCommand.Parameters.AddWithValue("@in_custId", custId);
            insertCommand.ExecuteNonQuery();
            FortCart_sql_Connection.Close();// close connection

        }
    
    }
}