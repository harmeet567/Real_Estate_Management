using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace RealEstateDemo.RegisteredUser
{
    public partial class SendFeedback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnSubmitFeedback_Click(object sender, EventArgs e)
        {
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(CS);
            SqlDataAdapter da = new SqlDataAdapter();
            con.Open();

            //string InsertQuery = "Insert into User_Feedback values (@strFirstName,@strLastName,@strEmail,@strComments)";
            //SqlCommand cmd = new SqlCommand(InsertQuery, con);
            da.InsertCommand = new SqlCommand("Insert into User_Feedback values (@strFirstName,@strLastName,@strEmail,@strComments)", con);
            da.InsertCommand.Parameters.Add("@strFirstName", SqlDbType.VarChar).Value = txtFirstName.Text;
            da.InsertCommand.Parameters.Add("@strLastName", SqlDbType.VarChar).Value = txtLastName.Text;
            da.InsertCommand.Parameters.Add("@strEmail", SqlDbType.VarChar).Value = txtEmail.Text;
            da.InsertCommand.Parameters.Add("@strComments", SqlDbType.VarChar).Value = txtComments.Text;

            int Rec_Inserted = da.InsertCommand.ExecuteNonQuery();
            con.Close();

            if (Rec_Inserted > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert(' Feedback succesfully sent');", true);
            }
            txtComments.Text = "";
            txtEmail.Text = "";
            txtFirstName.Text = "";
            txtLastName.Text = "";

        }
}
}