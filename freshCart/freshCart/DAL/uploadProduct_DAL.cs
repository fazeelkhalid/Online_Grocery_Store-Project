using System;
using System.Collections.Generic;
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
    public class uploadProduct_DAL
    {
        //conection string
        private static readonly string constr = System.Configuration.ConfigurationManager.ConnectionStrings["FreshCart_connection"].ConnectionString;

        public int storeProduct(string supplierCNIC, int price, string productName, string ProductCategaory, string Description, int TotalStock, int saleOnStock, string URL) {

            DataSet table = new DataSet();
            SqlConnection FortCart_sql_Connection = new SqlConnection(constr);
            FortCart_sql_Connection.Open();
            SqlCommand insertCommand = new SqlCommand("new_product_in_store", FortCart_sql_Connection);

            insertCommand.CommandType = CommandType.StoredProcedure;
            insertCommand.Parameters.AddWithValue("@in_supplier_CNIC", supplierCNIC);
            insertCommand.Parameters.AddWithValue("@in_product_price", price);
            insertCommand.Parameters.AddWithValue("@in_product_name", productName);
            insertCommand.Parameters.AddWithValue("@in_product_catagory", ProductCategaory);
            insertCommand.Parameters.AddWithValue("@in_product_description", Description);
            insertCommand.Parameters.AddWithValue("@in_product_total_stock", TotalStock);
            insertCommand.Parameters.AddWithValue("@in_product_stock_sale", saleOnStock);
            insertCommand.Parameters.AddWithValue("@in_product_image", URL);
            SqlParameter returnValue = new SqlParameter();
            returnValue.ParameterName = "@status"; // get return value from procedure
            returnValue.SqlDbType = SqlDbType.Int;
            returnValue.Direction = ParameterDirection.Output;
            insertCommand.Parameters.Add(returnValue);
            insertCommand.ExecuteNonQuery();
            int value = Convert.ToInt16(returnValue.Value);
            FortCart_sql_Connection.Close();// close connection
            return value;
        }

        public void storeSupplier(string name, string companyName, string email, string contact, string CNIC, string address)
        {
            DataSet table = new DataSet();
            SqlConnection FortCart_sql_Connection = new SqlConnection(constr);
            FortCart_sql_Connection.Open();
            SqlCommand insertCommand = new SqlCommand("Add_supplier", FortCart_sql_Connection);

            insertCommand.CommandType = CommandType.StoredProcedure;
            insertCommand.Parameters.AddWithValue("@name", name);
            insertCommand.Parameters.AddWithValue("@company", companyName);
            insertCommand.Parameters.AddWithValue("@email", email);
            insertCommand.Parameters.AddWithValue("@contact", contact);
            insertCommand.Parameters.AddWithValue("@cnic", CNIC);
            insertCommand.Parameters.AddWithValue("@company_Address", address);
            insertCommand.ExecuteNonQuery();
           FortCart_sql_Connection.Close();// close connection
        }

    }
}