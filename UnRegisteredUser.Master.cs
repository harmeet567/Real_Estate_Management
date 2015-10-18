using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace RealEstateDemo
{
    public partial class UnRegisteredUser : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                //Calendar1.Visible = false;

                DropDown_Region.DataSource = GetData("spGetRegions", null);
                DropDown_Region.DataBind();

                ListItem liRegions = new ListItem("Select Region", "-1");
                DropDown_Region.Items.Insert(0, liRegions);

                ListItem liSubRegions = new ListItem("Select SubRegion", "-1");
                DropDown_SubRegion.Items.Insert(0, liSubRegions);

                DropDown_PropType.DataSource = GetData("sPGetPropertyType", null);
                DropDown_PropType.DataBind();

                ListItem liPropType = new ListItem("Select PropertyType", "-1");
                DropDown_PropType.Items.Insert(0, liPropType);


                // To Populate Bedroom count from DB
                DropDown_NoOfBedRooms.DataSource = GetData("sPGetNoOfBedrooms", null);
                DropDown_NoOfBedRooms.DataBind();

                ListItem liBedrooms = new ListItem("Select Bedrooms", "-1");
                DropDown_NoOfBedRooms.Items.Insert(0, liBedrooms);

                // To Populate Bathroom count from DB
                DropDown_NoOfBathRooms.DataSource = GetData("sPGetNoOfBathrooms", null);
                DropDown_NoOfBathRooms.DataBind();

                ListItem liBathrooms = new ListItem("Select Bathrooms", "-1");
                DropDown_NoOfBathRooms.Items.Insert(0, liBathrooms);

                // To Populate  LowerPrice  from DB
                //DropDown_LowerPriceLimit.DataSource = GetData("sPGetPriceLimit", null);
                //DropDown_LowerPriceLimit.DataBind();

                ListItem liPrice = new ListItem("Lower Price Limit", "-1");
                DropDown_LowerPriceLimit.Items.Insert(0, liPrice);

                ListItem liUpPrice = new ListItem("Upper Price Limit", "-1");
                DropDown_UpperPriceLimit.Items.Insert(0, liUpPrice);
            }
        }
        public DataSet GetData(string SpName, SqlParameter SpParam)
        {
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(CS);

            SqlDataAdapter da = new SqlDataAdapter(SpName, con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (SpParam != null)
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
            DropDown_SubRegion.Enabled = true; // To Enable the dropdown
            SqlParameter Param = new SqlParameter("@RegionId", DropDown_Region.SelectedValue);
            DataSet DS = GetData("sPGetSubRegionsByRegionId", Param);

            DropDown_SubRegion.DataSource = DS;
            DropDown_SubRegion.DataBind();
        }

        protected void Search_Click(object sender, EventArgs e)
        {
            //Session["Region"] = RegionsList.SelectedValue;
            //Session["SubRegion"] = SubRegionsList.SelectedValue;
            Session["Region"] = DropDown_Region.SelectedItem.Text;
            Session["SubRegion"] = DropDown_SubRegion.SelectedItem.Text;
            Session["Purpose"] = DropDown_Purpose.SelectedValue;
            Session["PropertyType"] = DropDown_PropType.SelectedValue;
            Session["BedRooms"] = DropDown_NoOfBedRooms.SelectedValue;
            Session["BathRooms"] = DropDown_NoOfBathRooms.SelectedValue;
            Session["LowerPrice"] = DropDown_LowerPriceLimit.SelectedValue;
            Session["UpperPrice"] = DropDown_UpperPriceLimit.SelectedValue;
            
            if (Facilities.Checked)
            {
                Session["Facilities"] = "True";
            }
            else
                Session["Facilities"] = "False";

            Response.Redirect("~/UnRegisteredUserSearch.aspx");

        }

        protected void DropDown_Purpose_SelectedIndexChanged(object sender, EventArgs e)
        {

            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(CS);
            con.Open();

            DropDown_LowerPriceLimit.Enabled = true;
            DropDown_UpperPriceLimit.Enabled = true; // To Enable the Pricedropdowns

            string sortorder = "asc";
            SqlDataAdapter da = new SqlDataAdapter("sPGetPriceLimit", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;

            SqlParameter Param1 = new SqlParameter("@Purpose", DropDown_Purpose.SelectedValue);
            SqlParameter Param2 = new SqlParameter("@sortorder", sortorder);

            da.SelectCommand.Parameters.Add(Param1);
            da.SelectCommand.Parameters.Add(Param2);

            //da.SelectCommand.ExecuteNonQuery();

            DataSet DS = new DataSet();
            da.Fill(DS);

            con.Close();

            ListItem liPrice = new ListItem("Lower Price Limit", "-1");
            DropDown_LowerPriceLimit.Items.Insert(0, liPrice);


            DropDown_LowerPriceLimit.DataSource = DS;
            DropDown_LowerPriceLimit.DataBind();

            /* For Upper Price Limit */
            string up_sortorder = "desc";
            SqlDataAdapter da_upp = new SqlDataAdapter("sPGetPriceLimit", con);
            da_upp.SelectCommand.CommandType = CommandType.StoredProcedure;

            SqlParameter Param3 = new SqlParameter("@Purpose", DropDown_Purpose.SelectedValue);
            SqlParameter Param4 = new SqlParameter("@sortorder", up_sortorder);

            da_upp.SelectCommand.Parameters.Add(Param3);
            da_upp.SelectCommand.Parameters.Add(Param4);

            //da_upp.SelectCommand.ExecuteNonQuery();


            ListItem liUpPrice = new ListItem("Upper Price Limit", "-1");
            DropDown_UpperPriceLimit.Items.Insert(0, liUpPrice);

            DataSet DS1 = new DataSet();
            da_upp.Fill(DS1);

            con.Close();

            DropDown_UpperPriceLimit.DataSource = DS1;
            DropDown_UpperPriceLimit.DataBind();

        }     
    }
}