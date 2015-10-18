using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace RealEstateDemo.home_page
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (IsPostBack)
            {
                string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                SqlConnection con = new SqlConnection(CS);
                con.Open();

                string VerifyUserName_Query = "Select count(*) from UserDetails where UserName ='" + txtUserName.Text + "'";

                SqlCommand command = new SqlCommand(VerifyUserName_Query, con);

                //Execute Scalar will return single row single column value (i.e. single value)
                // on execution of SQL Query or Stored procedure using command object. 
                //It’s very fast to retrieve single values from database

                int UserName_Count = Convert.ToInt32(command.ExecuteScalar().ToString());
                con.Close();
                if (UserName_Count == 1)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert(' UserName already Exist,Please select new UserName');", true);
                    //Response.Write("UserName already Exist,Please select new UserName");
                }

            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string PasswordFlag = "";
             try
            {
                Guid newGuid = Guid.NewGuid();
                string ChkPassword;
              

                string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                SqlConnection con = new SqlConnection(CS);
                con.Open();

                /* Code added to check the admin user during registraton */
                if (ddlUserType.SelectedItem.Text == "Admin")
                {
                    ChkPassword = txtAdminPwd.Text;
                    if (ChkPassword == "12345678")
                    {
                         PasswordFlag = "A";
                    }
                }
                else
                {
                    PasswordFlag = "U";
                }


                string InsertUser_Query = "Insert into UserDetails (Id,UserName,Email,Password,Usr_Adm_Flg) values (@Id,@Uname,@Email,@Passwd,@PasswordFlag)";

                SqlCommand command = new SqlCommand(InsertUser_Query, con);
                command.Parameters.AddWithValue("@Id", newGuid.ToString());
                command.Parameters.AddWithValue("@Uname", txtUserName.Text);
                command.Parameters.AddWithValue("@Email", txtEmail.Text);
                command.Parameters.AddWithValue("@Passwd", txtPassword.Text);
                command.Parameters.AddWithValue("@PasswordFlag", PasswordFlag);


                int count= command.ExecuteNonQuery();

                //Response.Write("Registration succesful");
                Response.Redirect("~/home_page/login.aspx");
                con.Close();
            }
            catch(Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert(' UserName already Exist,Please select new UserName');", true);
            
            }
            
        
        }


    }
}