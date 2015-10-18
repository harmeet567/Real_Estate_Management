using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RealEstateDemo
{
    public partial class AdminUser : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Label1.Text = "Welcome " + Session["UserName"].ToString().ToUpper();
        }

        protected void adminbutton_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/home_page/login.aspx");
        }
    }
}