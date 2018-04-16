using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CheapoBuildLog
{
    public partial class CBLMaster : System.Web.UI.MasterPage
    {
        CBLService.CBLServiceClient web = new CBLService.CBLServiceClient();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack & Session["id"] != null)
            {
                phUserContent.Visible = true;
                phLogin.Visible = false;

                linkUserName.Text = (string)(Session["first"]);

                var test = web.GetUser((string)(Session["email"]));

                avatar.ImageUrl = "data:image;base64," + Convert.ToBase64String(test[0].user_picture);
                avatar.DataBind();
            }
            else
            {
                avatar.ImageUrl = "img/img_avatar1.png";
                phUserContent.Visible = false;
                dvMsg.Visible = false;                                     
            }
                     
        }       

        public void DisplayNotification(string msg)
        {
            lblNotification.Text = msg;
            dvMsg.Visible = true;
            
        }


        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            string password = txtPassword.Text;           

            var user = web.GetUser(email);
           

            if (user[0].user_email.Equals(email) & user[0].user_password.Equals(password))
            {
                Session["email"] = user[0].user_email;
                Session["id"] = user[0].user_id;
                Session["first"] = user[0].user_first;

                phUserContent.Visible = true;
                phLogin.Visible = false;
                linkUserName.Text = user[0].user_first;

                avatar.ImageUrl = "data:image;base64," + Convert.ToBase64String(user[0].user_picture);
              
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "MessageBox", "alert('Successful Login');", true);
                Response.Redirect(HttpContext.Current.Request.Url.ToString(), true);
            }
            else
                lblLoginInfo.Text = "Incorrect Email or Password";


        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "MessageBox", "alert('Successful Logout');", true);
            Response.Redirect("index.aspx");
            
            
        }

        protected void linkUserName_Click(object sender, EventArgs e)
        {
            if ((Session["id"]) != null)
            {
                Response.Redirect("user.aspx?id=" + (int)(Session["id"]));
            }
            
        }
    }
}