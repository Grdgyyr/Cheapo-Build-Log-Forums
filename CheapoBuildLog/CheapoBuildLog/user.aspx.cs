using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CheapoBuildLog
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        CBLService.CBLServiceClient web = new CBLService.CBLServiceClient();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUser();
            }
        }

        protected void LoadUser()
        {
            var user = web.GetUserByID(Convert.ToInt32(Request["id"]));

            txtFName.Text = user[0].user_first;
            txtLName.Text = user[0].user_last;
            txtUsername.Text = user[0].user_username;
            txtAddress.Text = user[0].user_address;
            txtEmail.Text = user[0].user_email;
            txtBio.Text = user[0].user_bio;
            txtContact.Text = user[0].user_mobile;
            txtNickname.Text = user[0].user_nickname;

            if (user[0].user_gender.Equals("M"))            
                txtGender.Text = "Male";           
            else if (user[0].user_gender.Equals("F"))            
                txtGender.Text = "Female";           
            else
                txtGender.Text = "Unspecified";

            txtDay.Text = user[0].user_birthday.Value.ToString("yyyy-MM-dd");

            byte[] imgByte = user[0].user_picture;
            string base64String = Convert.ToBase64String(imgByte, 0, imgByte.Length);
            Image1.ImageUrl = "data:image/png;base64," + base64String;
            Image1.Visible = true;
        }
    }
}