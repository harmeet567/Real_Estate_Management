using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace RealEstateDemo.Admin
{
    public partial class UploadProperties : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                DropDown_Region.DataSource = GetData("spGetRegions", null);
                DropDown_Region.DataBind();

                ListItem liRegions = new ListItem("Select Region", "-1");
                DropDown_Region.Items.Insert(0, liRegions);

                ListItem liSubRegions = new ListItem("Select SubRegion", "-1");
                DropDown_SubRegion.Items.Insert(0, liSubRegions);
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            string PathName = "";
            if (BrowseImage.HasFile)
            {
                string Extn = System.IO.Path.GetExtension(BrowseImage.FileName);
                /* Check the file extension, if extension is not in .png,.jpg,.jpeg,.gif
                   throw a popup to user to select the correct image format */
                if (Extn.ToLower() != ".gif" && Extn.ToLower() != ".jpg" && Extn.ToLower() != ".jpeg" && Extn.ToLower() != ".png")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Invalid Image format');", true);
                }
                else
                {
                    int FileSize = BrowseImage.PostedFile.ContentLength;
                    /* If filesize greater than 1MB give a popup message */
                    if (FileSize > 1048576)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Filesize exceeds 1 MB,Please upload image with less size');", true);
                    }
                    else
                    {
                         PathName = "~/Images/" + Path.GetFileName(BrowseImage.PostedFile.FileName);
                    }
                }
               
            }
            else
            {
                /* This part is not working as of now. Will fix later */
                ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Please Select a Image to Upload ....');", true);
                /*ClearInputs(Page.Controls);
                Response.Redirect("~/Admin/UploadProperties.aspx");*/
            }

            
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(CS);
            con.Open();

            string st_Today = DateTime.Now.ToString("dd-MMM-yy");

            string InsertProp_Query = "Insert into PropertyList_Mst "
             + "(ID,Region_Name,SubRegion_Name,Purpose_Type,Property_Type,No_Of_Bedrooms,"
             + "No_Of_Bathrooms,Price,Image,PostedDate,Property_Address,Property_Area )"
             + " values (NEXT VALUE for PropertyId_Seq,@Reg,@SubReg,@Purp,@PropTyp,@Beds,"
             + " @Bath,@Price,@ImageLocation,@PostedDate,@Address,@AreaInSft)";

            SqlCommand command = new SqlCommand(InsertProp_Query, con);
            command.Parameters.AddWithValue("@Reg", DropDown_Region.SelectedItem.Text);
            command.Parameters.AddWithValue("@SubReg", DropDown_SubRegion.SelectedItem.Text);
            command.Parameters.AddWithValue("@Purp", DropDown_Purpose.SelectedValue);
            command.Parameters.AddWithValue("@PropTyp", DropDown_PropType.SelectedValue);
            command.Parameters.AddWithValue("@Beds", DropDown_Beds.SelectedValue);
            command.Parameters.AddWithValue("@Bath", DropDown_Bath.SelectedValue);
            command.Parameters.AddWithValue("@Price",txtPrice.Text);
            command.Parameters.AddWithValue("@PostedDate", st_Today);
            command.Parameters.AddWithValue("@ImageLocation", PathName);
            command.Parameters.AddWithValue("@Address", txtAddress.Text);
            command.Parameters.AddWithValue("@AreaInSft", txtAreaInSft.Text);


            int count = command.ExecuteNonQuery();
            con.Close();

            ClearInputs(Page.Controls);
            BrowseImage.SaveAs(Server.MapPath("~/Images/" + BrowseImage.FileName));
            ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('FileUploaded Succesfully ....');", true);

        }
        /* Function to clear the text boxes and dropdowns after submit */
        void ClearInputs(ControlCollection ctrls)
        {
            foreach(Control ctrl in ctrls)
            {
                if (ctrl is TextBox)
                    ((TextBox)ctrl).Text = string.Empty;
                
                /*else if (ctrl is DropDownList)
                    DropDown_Region.Items.clear();
                    DropDown_SubRegion.Items.Clear();
                    DropDown_Purpose.Items.Clear();*/
                DropDown_Bath.SelectedIndex = -1;
                DropDown_Beds.SelectedIndex = -1;
                DropDown_Region.SelectedIndex = -1;
                DropDown_SubRegion.SelectedIndex = -1;
                DropDown_Purpose.SelectedIndex = -1;

                ClearInputs(ctrl.Controls);
            }

        }

        protected void DropDown_Region_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDown_SubRegion.Enabled = true; // To Enable the dropdown
            SqlParameter Param = new SqlParameter("@RegionId", DropDown_Region.SelectedValue);
            DataSet DS = GetData("sPGetSubRegionsByRegionId", Param);

            DropDown_SubRegion.DataSource = DS;
            DropDown_SubRegion.DataBind();
        }
    }
}