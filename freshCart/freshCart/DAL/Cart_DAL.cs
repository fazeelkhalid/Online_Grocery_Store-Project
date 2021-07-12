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
    public class Cart_DAL
    {
        //conection string
        private static readonly string constr = System.Configuration.ConfigurationManager.ConnectionStrings["FreshCart_connection"].ConnectionString;
        public List<Cart_class> itemsList = new List<Cart_class>();

        public int getCustomerId(string phoneNumber) { // it will return customer Id
           
            DataSet table = new DataSet();
            SqlConnection FortCart_sql_Connection = new SqlConnection(constr);
            FortCart_sql_Connection.Open();
            // open connection for getting user Id
            SqlCommand cm = new SqlCommand("select * from Customer_table where contact# = '" + phoneNumber + "'", FortCart_sql_Connection);
            SqlDataReader sdr = cm.ExecuteReader();
            int custId = -1;
            if (sdr.Read())
            {
                custId = sdr.GetInt32(0);
                sdr.Close(); // connection close
            }
            return custId;
        }

        public int addtoCArd(string phoneNumber, int productId){
            
            DataSet table = new DataSet();
            SqlConnection FortCart_sql_Connection = new SqlConnection(constr);
            FortCart_sql_Connection.Open();
            
            int custId = getCustomerId(phoneNumber);
            
            //now open connection for storing product into the cart table
            FortCart_sql_Connection = new SqlConnection(constr);
            FortCart_sql_Connection.Open();
            SqlCommand insertCommand = new SqlCommand("include_in_cart", FortCart_sql_Connection);

            insertCommand.CommandType = CommandType.StoredProcedure;
            insertCommand.Parameters.AddWithValue("@in_custId", custId);
            insertCommand.Parameters.AddWithValue("@in_productId", productId);
            insertCommand.Parameters.AddWithValue("@in_productamt", 1);

            SqlParameter returnValue = new SqlParameter();
            returnValue.ParameterName = "@status"; // get return value from procedure
            returnValue.SqlDbType = SqlDbType.Int;
            returnValue.Direction = ParameterDirection.Output;
            insertCommand.Parameters.Add(returnValue);
            insertCommand.ExecuteNonQuery();
            int tempvalue = 0;
            if (returnValue.Value == "")
            {
                tempvalue = Convert.ToInt16(returnValue.Value);
            }
            FortCart_sql_Connection.Close();// close connection
            return tempvalue;
        }

        public List<Cart_class> getCartProduct(string phoneNumber)
        {
            itemsList.Clear();
            int custId = getCustomerId(phoneNumber); // get login customer Id
            DataSet table = new DataSet();
            SqlConnection FortCart_sql_Connection = new SqlConnection(constr);
            FortCart_sql_Connection.Open();
            
            // open connection for getting user Id
            SqlCommand cm = new SqlCommand(" select Cart_table.Cart_ID, Product_table.Product_id, Product_table.Product_name, Product_table.Price, Product_table.Remaining_stock, Product_table.sales, Product_table.ImgSrc, Cart_table.quantity,Product_table.Description from Product_table join Cart_table	 on Product_table.Product_id = Cart_table.Product_id where Cart_table.Customer_id = '" + custId + "'", FortCart_sql_Connection);
            SqlDataReader sdr = cm.ExecuteReader();
            while (sdr.Read())
            {
                Cart_class temp = new Cart_class();
                temp.cart_id = Convert.ToString(sdr.GetInt32(0));
                temp.product_id= Convert.ToString(sdr.GetInt32(1));
                temp.name= sdr.GetString(2);
                temp.price= Convert.ToString(sdr.GetDouble(3));
                temp.remainingStock= Convert.ToString(sdr.GetSqlInt32(4));
                temp.Discount= Convert.ToString(sdr.GetSqlInt32(5));
                temp.ImgSrc= sdr.GetString(6);
                temp.quantity= sdr.GetString(7).Trim();
                temp.Description = sdr.GetString(8);
                itemsList.Add(temp);
            }
            sdr.Close(); // connection close
            return itemsList;
        }

        public void removeOrderFromCart(string phoneNumber, int cartId) {
            DataSet table = new DataSet();
            SqlConnection FortCart_sql_Connection = new SqlConnection(constr);
            FortCart_sql_Connection.Open();
            // open connection for getting user Id
            int custId = getCustomerId(phoneNumber);
            SqlCommand cm = new SqlCommand("delete from Cart_table where Cart_ID = '" + cartId + "' AND Customer_id = '" + custId + "'", FortCart_sql_Connection);
            SqlDataReader sdr = cm.ExecuteReader();

        }

    }
}