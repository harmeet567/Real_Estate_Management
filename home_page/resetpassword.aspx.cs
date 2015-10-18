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
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(CS);
            con.Open();

            string VerifyUser_Query = "Select count(*) from UserDetails where UserName ='" + txtUserName.Text + "'" + "and Email = '" + txtEmail.Text + "'";

            SqlCommand command = new SqlCommand(VerifyUser_Query, con);

            int UserName_Count = Convert.ToInt32(command.ExecuteScalar().ToString().Replace(" ", ""));
            con.Close();
            if (UserName_Count != 1)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert(' UserName (or) Email is Not correct,Please correct and Try again');", true);
            }
            else
            {
                con.Open();
                string Update_Query = "Update UserDetails set Password = @pwd  where UserName = @Uname";
                SqlCommand Updtcommand = new SqlCommand(Update_Query, con);
                Updtcommand.Parameters.AddWithValue("@pwd", txtPassword.Text);
                Updtcommand.Parameters.AddWithValue("@Uname", txtUserName.Text);

                int Updt_Count = Updtcommand.ExecuteNonQuery();
                con.Close();
                if (Updt_Count == 1)
                {
                    //global::System.Windows.Forms.MessageBox.Show("Password Changed Succesfully");
                    //ScriptManager.RegisterStartupScript (this, this.GetType(), "popup", "alert(' Password Reset Succesful. Please login now');location.href= "~/Login.aspx";", true);
                    //Page.ClientScript.RegisterStartupScript (this, this.GetType(), "message", "alert('Password Reset Succesful. Please login now');location.href = '" + Login.aspx + ";",true);
                    //Response.Write("<script language=javascript>alert('Password Reset Succesful.')</script>");
                    txtUserName.Text = "";
                    txtEmail.Text = "";

                    string message = "Password Upadated Successfully !!";
                    string url = "Login.aspx";
                    string script = "{ alert('";
                    script += message;
                    script += "');";
                    script += "window.location = '";
                    script += url;
                    script += "'; }";
                    ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "alert", script, true);

                }
                //Response.Redirect("~/Login.aspx");
            }
        }
    }
}