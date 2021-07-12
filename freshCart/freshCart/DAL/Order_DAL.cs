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
       
    public class Order_DAL
    {
        private static readonly string constr = System.Configuration.ConfigurationManager.ConnectionStrings["FreshCart_connection"].ConnectionString;
        
        public void OrderDone(int custometrId){

            DataSet table = new DataSet();
            SqlConnection FortCart_sql_Connection = new SqlConnection(constr);
            FortCart_sql_Connection.Open();
            SqlCommand insertCommand = new SqlCommand("deliver_order", FortCart_sql_Connection);

            insertCommand.CommandType = CommandType.StoredProcedure;
            insertCommand.Parameters.AddWithValue("@in_customer_id", custometrId);
            insertCommand.ExecuteNonQuery();
            FortCart_sql_Connection.Close();// close connection
        }

        public List<order_class> displayOrder() // return all orders inforamtion
        {
            List<order_class> orderList = new List<order_class>();
            DataSet table = new DataSet();
            SqlConnection FortCart_sql_Connection = new SqlConnection(constr);
            FortCart_sql_Connection.Open();
            SqlCommand cm = new SqlCommand("select Product_table.Product_id, Product_table.Product_name,Order_table.Customer_id, order_table.Quantity, order_table.Order_date, order_table.Address, Customer_table.Customer_name  from order_table join customer_table on order_table.Customer_id = customer_table.Customer_id join Product_table on order_table.Product_id = Product_table.Product_id where order_table.isDeliver = 0", FortCart_sql_Connection);
            SqlDataReader sdr = cm.ExecuteReader();

            while (sdr.Read()) {
                order_class temp= new order_class();
                temp.address = sdr.GetString(5);
                temp.CID = Convert.ToString(sdr.GetInt32(2));
                temp.pName= sdr.GetString(1);
                temp.Oid = Convert.ToString(sdr.GetInt32(0));
                temp.quantity = Convert.ToString(sdr.GetInt32(3));
                temp.cName = sdr.GetString(6);
                orderList.Add(temp);
            }
            sdr.Close();

            return orderList;
        }




    }
}