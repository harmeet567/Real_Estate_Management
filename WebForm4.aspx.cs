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
    public partial class WebForm4 : System.Web.UI.Page
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
               BindGridView();
            }
        }
        protected void BindGridView()
        {
            string P1 = (string) Session["Region"];
            string P2 = (string)Session["SubRegion"];
            string P3 = (string)Session["Purpose"];
            string P4 = (string)Session["PropertyType"];
            int P5 = Convert.ToInt32((string) Session["BedRooms"]);
            int P6 = Convert.ToInt32((string) Session["BathRooms"]);
            int P7 = Convert.ToInt32((string) Session["LowerPrice"]);
            int P8 = Convert.ToInt32((string)Session["UpperPrice"]);
            
            SqlCommand command = new SqlCommand();
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(CS);
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

            da.SelectCommand.Parameters.Add(Param1);
            da.SelectCommand.Parameters.Add(Param2);
            da.SelectCommand.Parameters.Add(Param3);
            da.SelectCommand.Parameters.Add(Param4);
            da.SelectCommand.Parameters.Add(Param5);
            da.SelectCommand.Parameters.Add(Param6);
            da.SelectCommand.Parameters.Add(Param7);
            da.SelectCommand.Parameters.Add(Param8);

            DataSet DT = new DataSet();
            da.Fill(DT);

            con.Close();

            if (DT.Tables[0].Rows.Count > 0)
            {
                //GridView gv = new GridView();

                gvPropertyList.DataSource = DT;
                gvPropertyList.DataBind();
            }
            else
            {
                string script = Popup_And_Redirect("No Properties matches your search,Please try another options !!", "UserPage.aspx");
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "alert", script, true);
            }

        }

          protected void gvPropertyList_Sorting(object sender, GridViewSortEventArgs e)
         {
            string SortingDirection = string.Empty;
         }

          protected void gvPropertyList_RowCommand(object sender, GridViewCommandEventArgs e)
          {
              string Address, QuotedPrice;
              int ActualPrice, PropertyId;
              string CurrentCommand = e.CommandName;

              int CurrentRowIndex = Convert.ToInt32(e.CommandArgument.ToString());

              if (e.CommandName == "MakeOffer")
              {

                  string Purpose = (string)Session["Purpose"];
                  /* When Purpose is not selected during search,its value comes as "-1" */
                  //if(String.IsNullOrEmpty(Purpose) || Purpose == "-1")
                  if (String.IsNullOrEmpty(Purpose))
                  {
                      /* Read Purpose from Gridview which is coming from PropertyList Master and take decision to allow offer*/
                      string Posted_PropertyPurp = gvPropertyList.Rows[CurrentRowIndex].Cells[6].Text;
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
                      /* Check if any Price is quoted or not in the check box */
                      TextBox txt = (TextBox)gvPropertyList.Rows[CurrentRowIndex].Cells[7].FindControl("txtOffer");
                      QuotedPrice = txt.Text.ToString().Trim();
                      if (String.IsNullOrEmpty(QuotedPrice))
                      {
                          string script = Popup_And_Redirect("Please quote a valid price to submit your offer!!", "WebForm4.aspx");

                          ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "alert", script, true);
                          //ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Please quote a valid price to submit your offer');", true);
                      }
                      /* If has some valid price then update database with the offer price*/
                      else
                      {
                          PropertyId = Convert.ToInt16(gvPropertyList.Rows[CurrentRowIndex].Cells[0].Text);
                          Address = gvPropertyList.Rows[CurrentRowIndex].Cells[2].Text;
                          ActualPrice = Convert.ToInt32(gvPropertyList.Rows[CurrentRowIndex].Cells[3].Text);

                          string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                          using (SqlConnection con = new SqlConnection(CS))
                          {

                              SqlCommand Command = new SqlCommand();
                              Command.Connection = con;
                              Command.CommandText = "sp_MakeOfferOnProperty";
                              Command.CommandType = CommandType.StoredProcedure;

                              Command.Parameters.Add("@PropertyId", SqlDbType.Int).Value = PropertyId;
                              Command.Parameters.Add("@UName", SqlDbType.VarChar).Value = (string)Session["UserName"];
                              Command.Parameters.Add("@ActualPrice", SqlDbType.Int).Value = ActualPrice;
                              Command.Parameters.Add("@OfferPrice", SqlDbType.VarChar).Value = QuotedPrice;
                              Command.Parameters.Add("@PropAddress", SqlDbType.VarChar).Value = Address;

                              try
                              {
                                  con.Open();
                                  Command.ExecuteNonQuery();

                                  SqlDataReader reader = Command.ExecuteReader();
                                  if ((reader.RecordsAffected > 0))/*&& (int.Parse(QuotedPrice) > 0) && (QuotedPrice != null ))*/
                                  {
                                      ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert(' offer succesfully made on property ');", true);

                                  }
                                  else
                                  {
                                      ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert(' Please quote a valid price to submit your offer ');", true);
                                  }

                              }
                              catch (SqlException ex)
                              {
                                  System.Diagnostics.Debug.Write("SqlException Error" + ex.Number + ":" + ex.Message);
                              }
                              finally
                              {
                                  con.Close();
                              }
                          } //closing of using 
                      } // Closing of else condition.
                  } // Closing of elseif condition
              } //closing of if condition check for makeoffer
          }

          private static string Popup_And_Redirect(string PromptMsg,string Page_to_Redirect)
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
              if(row.RowType == DataControlRowType.DataRow)
              {
                  /* Find the status of property. If property is SOLD,disable the textbox to make offer */
                  string Stat = DataBinder.Eval(e.Row.DataItem, "Property_Status").ToString();
                  string Purp = DataBinder.Eval(e.Row.DataItem, "Purpose_Type").ToString();
                  TextBox txtOff = (TextBox)e.Row.FindControl("txtOffer");
                  if ((Stat == "SOLD") || (Purp == "Rent"))
                      txtOff.Enabled = false;
               }

          }

          protected void gvPropertyList_SelectedIndexChanged(object sender, EventArgs e)
          {

          }
        }     

    }
