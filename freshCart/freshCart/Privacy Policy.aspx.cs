using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace freshCart
{
    public partial class Privacy_Policy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Phone_number"] == null)
            {
                Response.Redirect("login.aspx");
            }
        }
        protected void Refresh(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }
    }
}