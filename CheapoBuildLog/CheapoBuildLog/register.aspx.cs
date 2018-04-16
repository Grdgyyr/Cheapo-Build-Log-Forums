using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CheapoBuildLog
{
    public partial class WebForm2 : System.Web.UI.Page
    {

        CBLService.CBLServiceClient web = new CBLService.CBLServiceClient();
        private static byte[] imgByte = null;
        private static byte[] imgBT = null;


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            var today = DateTime.Today;
            DateTime Bday = Convert.ToDateTime(txtDay.Text);
            var age = today.Year - Bday.Year;

            String first = txtFName.Text;
            String last = txtLName.Text;
            String username = txtUsername.Text;
            String password = txtPassword.Text;
            String address = txtAddress.Text;
            String gender = "";
            String email = txtEmail.Text;
            String bio = txtBio.Text;
            String mobile = txtContact.Text;
            String nickname = txtNickname.Text; 

            if (txtGender.Text.Equals("Male"))
                gender = "M";
            else if(txtGender.Text.Equals("Female"))
                gender = "F";
            else if (txtGender.Text.Equals("Unspecified"))
                gender = "U";

            

            web.AddUser(0, first, last, username, nickname, password, address, 0, gender, today, Bday, email, imgBT, age, bio, mobile, 0, 0, 0);
        }



        protected void btnUpload_Click(object sender, EventArgs e)
        {
            imgBT = FileUploadProfile.FileBytes;
            System.IO.Stream fs = FileUploadProfile.PostedFile.InputStream;
            System.IO.BinaryReader br = new System.IO.BinaryReader(fs);
            imgByte = br.ReadBytes((Int32)fs.Length);
            string base64String = Convert.ToBase64String(imgByte, 0, imgByte.Length);
            Image1.ImageUrl = "data:image/png;base64," + base64String;
            Image1.Visible = true;
            System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "MessageBox", "alert('Avatar Upload Successful');", true);
        }

        
    }
}