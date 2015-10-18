using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace RealEstateDemo.RegisteredUser
{
    public partial class DetailsOfProp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(CS);
            con.Open();
            //int PropertyId = Convert.ToInt32((string)Request.QueryString["ID"]);

            string getDetails_Query = "Select No_Of_Bedrooms,No_Of_Bathrooms from PropertyList_Mst where Id = 17";

            SqlCommand command = new SqlCommand(getDetails_Query, con);

            SqlDataReader myDetails = null;
            myDetails = command.ExecuteReader();

            while(myDetails.Read())
            {
                txtBed.Text = (myDetails["No_Of_Bedrooms"].ToString());
                txtBath.Text = (myDetails["No_Of_Bathrooms"].ToString());
                txtParking.Text = "Available";
                txtPool.Text = "Not Available";
                txtChildPlay.Text = "Available";
                txtGym.Text = "Available";
                
            }


        }
    }
}