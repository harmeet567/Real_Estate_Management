using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RealEstateDemo.Admin
{
    public partial class ViewOffers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void ListView_Offers_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            string UserName;
            int PropertyId;
            string CurrentCommand = e.CommandName;
            int CurrentRowIndex = Convert.ToInt32(e.CommandArgument.ToString());

            if (e.CommandName == "AcceptOffer")
            {
                /*PropertyId = Convert.ToInt16(ListView_Offers.DataKeys[e.ItemIndex].;*/
               
                /*Rows[CurrentRowIndex].Cells[0].Text);
                Label lbText = (Label)e.Item.FindControl("Label2");
                string email = lbText.Text;
                Response.Redirect("ViewOffers.aspx");*/

            }
        }
    }
}