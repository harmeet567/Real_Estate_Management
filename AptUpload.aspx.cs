using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RealEstateDemo
{
    public partial class AptUpload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

           protected void Button1_Click(object sender, EventArgs e)
        {
            SqlDataSource1.Insert();
        }

           protected void Button2_Click(object sender, EventArgs e)
           {
               Image1.ImageUrl = "~/ImageHandler.ashx.cs?imgid=" + TextBox2.Text;
           }

    }
}