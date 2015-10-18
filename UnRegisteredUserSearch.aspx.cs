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
    public partial class UnRegisteredUserSearch : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            gvPropertyList.PageSize = 5;
            gvPropertyList.AllowPaging = true;

            gvPropertyList.AllowSorting = true;
            ViewState["SortExpression"] = "Price ASC";
            /*To retain the state of Quoted price,this postback check is required*/
            if (!IsPostBack)
            {
                ViewState["sortOrder"] = "";
                BindGridView("", "");
            }
        }
        protected void BindGridView(string sortExp, string sortDir)
        {
            string P1 = (string)Session["Region"];
            string P2 = (string)Session["SubRegion"];
            string P3 = (string)Session["Purpose"];
            string P4 = (string)Session["PropertyType"];
            int P5 = Convert.ToInt32((string)Session["BedRooms"]);
            int P6 = Convert.ToInt32((string)Session["BathRooms"]);
            int P7 = Convert.ToInt32((string)Session["LowerPrice"]);
            int P8 = Convert.ToInt32((string)Session["UpperPrice"]);
            string P9 = (string)Session["Facilities"];

            int Facilities_Flag = 0;
            if (P9 == "True")
            {
                Facilities_Flag = 1;
            }
            else
                Facilities_Flag = 0;


            SqlCommand command = new SqlCommand();
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(CS);
            con.Open();

            /* Start: First delete the records in temp table on every search */

            SqlCommand cmd_trunc = new SqlCommand();
            cmd_trunc.CommandText = "Truncate table Temp_PropertyList";
            cmd_trunc.Connection = con;
            cmd_trunc.ExecuteNonQuery();
            con.Close();
            /* End: First delete the records in temp table on every search */

            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("sp_SelectApartmentList", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;

            SqlParameter Param1 = new SqlParameter("@Region", P1);
            SqlParameter Param2 = new SqlParameter("@SubRegion", P2);
            SqlParameter Param3 = new SqlParameter("@Purpose", P3);
            SqlParameter Param4 = new SqlParameter("@PropertyType", P4);
            SqlParameter Param5 = new SqlParameter("@NoOfBedrooms", P5);
            SqlParameter Param6 = new SqlParameter("@NoOfBathrooms", P6);
            SqlParameter Param7 = new SqlParameter("@LowerPrice", P7);
            SqlParameter Param8 = new SqlParameter("@UpperPrice", P8); 
            SqlParameter Param9 = new SqlParameter("@Facilities", Facilities_Flag);


            da.SelectCommand.Parameters.Add(Param1);
            da.SelectCommand.Parameters.Add(Param2);
            da.SelectCommand.Parameters.Add(Param3);
            da.SelectCommand.Parameters.Add(Param4);
            da.SelectCommand.Parameters.Add(Param5);
            da.SelectCommand.Parameters.Add(Param6);
            da.SelectCommand.Parameters.Add(Param7);
            da.SelectCommand.Parameters.Add(Param8);
            da.SelectCommand.Parameters.Add(Param9);

            /* New code to fetch record from temp table */
            da.SelectCommand.ExecuteNonQuery();

            String SelectQuery = "Select * from Temp_PropertyList";
            SqlCommand cmd = new SqlCommand(SelectQuery, con);

            SqlDataAdapter dTemp = new SqlDataAdapter(cmd);
            DataSet DT = new DataSet();
            dTemp.Fill(DT);

            con.Close();

            //if (DT.Tables.Count > 0)
            if (DT.Tables[0].Rows.Count > 0)
            {
                DataView myDataView = new DataView();
                myDataView = DT.Tables[0].DefaultView;

                if (sortExp != string.Empty)
                {
                    myDataView.Sort = string.Format("{0} {1}", sortExp, sortDir);
                }

                //gvPropertyList.DataSource = DT;
                gvPropertyList.DataSource = myDataView;
                gvPropertyList.DataBind();

                /* Display facitlites based on check box selection */
                if (Facilities_Flag > 0)
                {
                    gvPropertyList.HeaderRow.Cells[7].Visible = true;
                    gvPropertyList.Columns[7].Visible = true;
                }
                else
                {
                    gvPropertyList.HeaderRow.Cells[7].Visible = false;
                    gvPropertyList.Columns[7].Visible = false;
                }


            }
            else
            {
                string script = Popup_And_Redirect("No Properties matches your search,Please try another options !!", "GuestLogin.aspx");
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "alert", script, true);
            }

        }


        protected void gvPropertyList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string Address, QuotedPrice;
            int ActualPrice, PropertyId;
            string CurrentCommand = e.CommandName;


            if (e.CommandName == "MakeOffer")
            {
                int CurrentRowIndex = Convert.ToInt32(e.CommandArgument.ToString());
                string Purpose = (string)Session["Purpose"];
                /* When Purpose is not selected during search,its value comes as "-1" */
                //if(String.IsNullOrEmpty(Purpose) || Purpose == "-1")
                if (String.IsNullOrEmpty(Purpose))
                {
                    /* Read Purpose from Gridview which is coming from PropertyList Master and take decision to allow offer*/
                    string Posted_PropertyPurp = gvPropertyList.Rows[CurrentRowIndex].Cells[7].Text;
                    if (Posted_PropertyPurp == "Rent")
                    {
                        string script = Popup_And_Redirect("Property you are trying to make offer is not for Buying,Please check !!", "UserPage.aspx");

                        ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "alert", script, true);
                    }
                }
                /* Start: To Prevent making offers on properties ,which are posted for Rent */
                if (Purpose == "Rent")
                {
                    string script = Popup_And_Redirect("Offers can be made when you want to Buy a property,Please change search options and try again!!", "UserPage.aspx");

                    ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "alert", script, true);
                }
                /* End : To Prevent making offers on properties ,which exist for Rent */

                else if ((Purpose == "Buy") || Purpose == "-1")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert(' Only Registered users can buy a property');", true);
                } // Closing of elseif condition
            } //closing of if condition check for makeoffer
        }

        private static string Popup_And_Redirect(string PromptMsg, string Page_to_Redirect)
        {
            //string Prompt_Message = "Offers can be made when you want to Buy a property,Please change search options and try again!!";
            //string url = "UserPage.aspx";
            string url = Page_to_Redirect;
            string script = "{ alert('";
            script += PromptMsg;
            script += "');";
            script += "window.location = '";
            script += url;
            script += "'; }";
            return script;
        }

        protected void gvPropertyList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            GridViewRow row = e.Row;
            if (row.RowType == DataControlRowType.DataRow)
            {
                /* Find the status of property. If property is SOLD,disable the textbox to make offer */
                string Stat = DataBinder.Eval(e.Row.DataItem, "Property_Status").ToString();
                string Purp = DataBinder.Eval(e.Row.DataItem, "Purpose_Type").ToString();
                //Button btnVal = (Button)(e.Row.FindControl("button"));
                TextBox txtOff = (TextBox)e.Row.FindControl("txtOffer");
                if ((Stat == "SOLD") || (Purp == "Rent"))
                {
                    //txtOff.Enabled = false;
                    //btnBuy.Enabled = false;
                }
            }

        }
        /*  Start :21-3-2015 Code added to sort price and datelisted values from search details of the property */
        protected void gvPropertyList_Sorting(object sender, GridViewSortEventArgs e)
        {

            BindGridView(e.SortExpression, sortOrder);

        }

        public string sortOrder
        {
            get
            {
                if (ViewState["sortOrder"].ToString() == "desc")
                {
                    ViewState["sortOrder"] = "asc";
                }
                else
                {
                    ViewState["sortOrder"] = "desc";
                }

                return ViewState["sortOrder"].ToString();
            }
            set
            {
                ViewState["sortOrder"] = value;
            }
        }  
    }
}