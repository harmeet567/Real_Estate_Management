using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
namespace RealEstateDemo.home_page
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(CS);
            con.Open();

            //VerifyLogin(con)User_Type);
            VerifyLogin(con);

        }


        private void VerifyLogin(SqlConnection con)
        {
            string VerifyUser_Query = "Select count(*) from UserDetails where UserName ='" + txtUname.Text + "'";

            SqlCommand command = new SqlCommand(VerifyUser_Query, con);

            int UserName_Count = Convert.ToInt32(command.ExecuteScalar().ToString().Replace(" ", ""));
            con.Close();
            if (UserName_Count == 1)
            {
                con.Open();
                string VerifyPasswd_Query = "Select Password from UserDetails where UserName ='" + txtUname.Text + "'"; ;
                SqlCommand Pass_command = new SqlCommand(VerifyPasswd_Query, con);
                string Passwd = Pass_command.ExecuteScalar().ToString().Replace(" ", "");
                if (Passwd == txtPasswd.Text)
                {
                    string ChkUser_Query = "Select Usr_Adm_Flg from UserDetails where UserName ='" + txtUname.Text + "'";
                    SqlCommand Chk_Flg_Cmd = new SqlCommand(ChkUser_Query, con);
                    string Admin_Usr_Flag = Chk_Flg_Cmd.ExecuteScalar().ToString().Replace(" ", "");

                    if (Admin_Usr_Flag == "U")
                    {
                        Session["UserName"] = txtUname.Text;
                        Response.Redirect("~/RegisteredUser/UserPage.aspx");
                    }
                    else
                    {
                        Response.Redirect("~/Admin/AdminDefault.aspx");
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert(' Invalid Password ');", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert(' Invalid UserName ');", true);
            }
        }


    }
}