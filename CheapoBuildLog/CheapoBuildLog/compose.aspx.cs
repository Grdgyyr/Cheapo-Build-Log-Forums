using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CheapoBuildLog
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        CBLService.CBLServiceClient web = new CBLService.CBLServiceClient();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string ThreadTitle = txtTitle.Text;
            string ThreadDescription = txtDescription.Text;

            web.CreateThread((int)(Session["id"]), Convert.ToInt32(Request["forumID"]), ThreadTitle, ThreadDescription);

            System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "MessageBox", "alert('Thread Created Succesfully');", true);

            Response.Redirect("forums.aspx");
        }
    }
}