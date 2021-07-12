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
    public class Shop_DAL
    {
        public List<product_class> itemsList { get; set; } 
        
        public List<product_class> takeAllProduct(){
        
            /*if (Session["Phone_number"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else*/
            {
                itemsList = new List<product_class>();
                String constr = @ConfigurationManager.ConnectionStrings["FreshCart_connection"].ToString();
                SqlConnection FortCart_sql_Connection = new SqlConnection(constr);
                FortCart_sql_Connection.Open();

                SqlCommand cm = new SqlCommand("select * from Product_table ", FortCart_sql_Connection);
                SqlDataReader sdr = cm.ExecuteReader();

                while (sdr.Read())
                {
                    product_class temp = new product_class();
                    temp.Pid = Convert.ToString(sdr.GetInt32(0));
                    temp.productname = sdr.GetString(2);
                    temp.price = Convert.ToString(sdr.GetDouble(3));
                    temp.Description = sdr.GetString(4);
                    temp.Category_name = sdr.GetString(5);
                    temp.totalSale = Convert.ToString(sdr.GetInt32(10));
                    temp.ImgSrc = sdr.GetString(11);
                    temp.totalStock = Convert.ToString(sdr.GetInt32(6));
                    temp.remainingstock = Convert.ToString(sdr.GetInt32(7));
                    float afterDis = (float)sdr.GetDouble(3) * ((float)sdr.GetInt32(10) / 100);
                    temp.Discount = Convert.ToString((float)sdr.GetDouble(3) - afterDis);
                    itemsList.Add(temp);
                }
            }
            return itemsList;
        }
    }
}