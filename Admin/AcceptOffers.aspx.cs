using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace RealEstateDemo.Admin
{
    public partial class AcceptOffers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void gvAcceptOffers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string UserName,Decision_Status;
            int  PropertyId;
            string CurrentCommand = e.CommandName;

            int CurrentRowIndex = Convert.ToInt32(e.CommandArgument.ToString());

            if (e.CommandName == "AcceptOffer")
            {
                PropertyId = Convert.ToInt16(gvAcceptOffers.Rows[CurrentRowIndex].Cells[1].Text);
                UserName = gvAcceptOffers.Rows[CurrentRowIndex].Cells[2].Text;
                Decision_Status = gvAcceptOffers.Rows[CurrentRowIndex].Cells[3].Text;

                //ActualPrice = Convert.ToInt16(gvAcceptOffers.Rows[CurrentRowIndex].Cells[3].Text);
                //string QuotedPrice = gvPropertyList.Rows[CurrentRowIndex].Cells[5].Text;
                //int QuotedPrice = Convert.ToInt16(gvPropertyList.Rows[CurrentRowIndex].Cells[5].Text);
                //string UserName = (string)Session["UserName"];
                //TextBox txt = (TextBox)gvAcceptOffers.Rows[CurrentRowIndex].Cells[5].FindControl("txtOffer");
                //QuotedPrice = txt.Text;
                if (Decision_Status == "Accepted")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Property was already offered to others.. Please check');", true);
                }
                else
                {

                        string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(CS))
                        {

                            SqlCommand Command = new SqlCommand();
                            Command.Connection = con;
                            Command.CommandText = "sp_MakeDecision_OnUserOffer";
                            Command.CommandType = CommandType.StoredProcedure;

                            Command.Parameters.Add("@PropertyId", SqlDbType.Int).Value = PropertyId;
                            Command.Parameters.Add("@UName", SqlDbType.VarChar).Value = UserName;
                            Command.Parameters.Add("@OfferStatus", SqlDbType.VarChar).Value = "Accepted";
                            
                            try
                            {
                                con.Open();
                                Command.ExecuteNonQuery();

                                SqlDataReader reader = Command.ExecuteReader();
                                if ((reader.RecordsAffected > 0))/*&& (int.Parse(QuotedPrice) > 0) && (QuotedPrice != null ))*/
                                {
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert(' offer succesfully accepted on property ');", true);
                                    Response.Redirect("~/Admin/AcceptOffers.aspx");
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
                 } //closing else
            }//close of if command check
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }//close of rowcommand function
    }
}