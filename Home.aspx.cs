using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace RealEstateDemo
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                Calendar1.Visible = false;

                RegionsList.DataSource = GetData("spGetRegions", null);
                RegionsList.DataBind();

                ListItem liRegions = new ListItem("Select Region", "-1");
                RegionsList.Items.Insert(0, liRegions);

                ListItem liSubRegions = new ListItem("Select SubRegion", "-1");
                SubRegionsList.Items.Insert(0, liSubRegions);

                PropertyTypeList.DataSource = GetData("sPGetPropertyType", null);
                PropertyTypeList.DataBind();

                // To Populate Bedroom count from DB
                Bedrooms.DataSource = GetData("sPGetNoOfBedrooms", null);
                Bedrooms.DataBind();

                ListItem liBedrooms = new ListItem("Select Bedrooms", "-1");
                Bedrooms.Items.Insert(0, liBedrooms);

                // To Populate Bathroom count from DB
                Bathrooms.DataSource = GetData("sPGetNoOfBathrooms", null);
                Bathrooms.DataBind();

                ListItem liBathrooms = new ListItem("Select Bathrooms", "-1");
                Bathrooms.Items.Insert(0, liBathrooms);

                // To Populate  LowerPrice  from DB
                LowerPriceLimit.DataSource = GetData("sPGetPriceLimit", null);
                LowerPriceLimit.DataBind();

                ListItem liPrice = new ListItem("Lower Price Limit", "-1");
                LowerPriceLimit.Items.Insert(0, liPrice);

                // To Populate  UpperPrice  from DB
                UpperPriceLimit.DataSource = GetData("sPGetPriceLimit", null);
                UpperPriceLimit.DataBind();

                ListItem liUpPrice = new ListItem("Upper Price Limit", "-1");
                UpperPriceLimit.Items.Insert(0, liUpPrice);
            }
        }
        private  DataSet GetData(string SpName,SqlParameter SpParam)
        {
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(CS);

            SqlDataAdapter da = new SqlDataAdapter(SpName,con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            if(SpParam!=null)
            {
                da.SelectCommand.Parameters.Add(SpParam);

            }
            DataSet DS = new DataSet();
            da.Fill(DS);

            return DS;
        }

        // The below function will get called on changing the region name from first drop down
        protected void RegionsList_SelectedIndexChanged1(object sender, EventArgs e)
        {
            SubRegionsList.Enabled = true; // To Enable the dropdown
            SqlParameter Param = new SqlParameter("@RegionId", RegionsList.SelectedValue);
            DataSet DS = GetData("sPGetSubRegionsByRegionId", Param);

            SubRegionsList.DataSource = DS;
            SubRegionsList.DataBind();
        }

        protected void Search_Click(object sender, EventArgs e)
        {
            //Session["Region"] = RegionsList.SelectedValue;
            //Session["SubRegion"] = SubRegionsList.SelectedValue;
            Session["Region"] = RegionsList.SelectedItem.Text;
            Session["SubRegion"] = SubRegionsList.SelectedItem.Text;
            Session["Purpose"] = Purpose.SelectedValue;
            Session["PropertyType"] = PropertyTypeList.SelectedValue;
            Session["BedRooms"] = Bedrooms.SelectedValue;
            Session["BathRooms"] = Bathrooms.SelectedValue;
            Session["LowerPrice"] = LowerPriceLimit.SelectedValue;
            Session["UpperPrice"] = UpperPriceLimit.SelectedValue;
          
          
            Response.Redirect("~/WebForm4.aspx");
            
        }

        protected void CalendarIcon_Click(object sender, ImageClickEventArgs e)
        {
            if(Calendar1.Visible)
            {
                Calendar1.Visible = false;
            }
            else
            {
                Calendar1.Visible = true;
            }
         }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            txtCalendarValue.Text = Calendar1.SelectedDate.ToString("d");
            Calendar1.Visible = false;
        }


                     

    }
}
