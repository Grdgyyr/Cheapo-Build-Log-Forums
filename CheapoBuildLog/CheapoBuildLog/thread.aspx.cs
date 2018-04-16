using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CheapoBuildLog
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        CBLService.CBLServiceClient web = new CBLService.CBLServiceClient();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadThread();
                
            }

            if (Session["id"] == null)
            {
                btnSubmit.Attributes.Add("data-toggle", "tooltip");
                btnSubmit.Attributes.Add("title", "Login Required");
                btnSubmit.Enabled = false;
                txtDescription.Attributes.Add("data-toggle", "tooltip");
                txtDescription.Attributes.Add("title", "Login Required");
                txtDescription.Enabled = false;
            }            
        }

        protected void LoadThread()
        {
            var thread = web.GetCurrentThreadByThread((Convert.ToInt32(Request["id"])));

            lblTitle.Text = thread[0].thread_title;
            lblContent.Text = thread[0].thread_description;
            lblDate.Text = thread[0].thread_created.Value.ToString("dd-MM-yyyy");
            lblLikes.Text = thread[0].thread_rating_like.Value.ToString();
            lblHelpful.Text = thread[0].thread_rating_helpful.Value.ToString();
            lblUser.Text = thread[0].user_username;
            body_avatar.ImageUrl = "data:image;base64," + Convert.ToBase64String(thread[0].user_picture);

            var comment = web.getThreadComment((Convert.ToInt32(Request["id"])));

            int user;

            if (Session["id"] == null)
                user = 0;
            else
                user = (int)(Session["id"]);

            for (int x = 0; x < comment.Count(); x++)
            {
                LoadComment("", comment[x].comment_description, 0, comment[x].user_username, "", 0, 0, user, comment[x].user_picture);
            }

        }

        protected void LoadComment(String title, String content, int threadID, string username,
            string created, int like, int helps, int userID, byte[] img)
        {
            Panel container = new Panel();
            Panel heading = new Panel();
            Panel body = new Panel();
            Panel footer = new Panel();

            Panel row = new Panel();
            Label caption = new Label();
            Label date = new Label();

            Label likes = new Label();
            Label helpful = new Label();

            Image avatar = new Image();

            HtmlGenericControl a = new HtmlGenericControl("a");
            HtmlGenericControl a1 = new HtmlGenericControl("a");
            HtmlGenericControl h3 = new HtmlGenericControl("h3");
            HtmlGenericControl p = new HtmlGenericControl("p");
            HtmlGenericControl p1 = new HtmlGenericControl("p");
            HtmlGenericControl i1 = new HtmlGenericControl("i");
            HtmlGenericControl i2 = new HtmlGenericControl("i");
            HtmlGenericControl figure = new HtmlGenericControl("figure");
            HtmlGenericControl figcaption = new HtmlGenericControl("figcaption");

            container.CssClass = "panel panel-default";
            container.ID = "panels";

            heading.CssClass = "panel-heading";

            row.ID = "row";
            row.CssClass = "col-sm-2 col-md-2";

            figure.ID = "figure";

            avatar.CssClass = "center-block";
            avatar.ID = "avatar";
            avatar.ImageUrl = "data:image;base64," + Convert.ToBase64String(img);

            figure.Controls.Add(avatar);
            avatar.Visible = true;

            a1.ID = "a1";
            a1.Attributes.Add("href", "user.aspx?id=" + userID);
            a1.Controls.Add(caption);

            caption.CssClass = "center-block text-center";
            caption.Text = username;

            figcaption.Controls.Add(a1);
            figure.Controls.Add(figcaption);

            row.Controls.Add(figure);

            heading.Controls.Add(row);

            a.ID = "a";
            a.Attributes.Add("href", "thread.aspx?id=" + threadID);
            h3.Attributes.Add("class", "col-sm-10 col-md-10");
            heading.Controls.Add(a);

            h3.ID = "h3";
            h3.Attributes.Add("class", "");
            h3.InnerText = title;
            a.Controls.Add(h3);

            body.CssClass = "panel-body";
            p.ID = "p";
            p.InnerText = content;
            body.Controls.Add(p);

            footer.CssClass = "panel-footer";

            p1.ID = "p1";
            p1.InnerText = "Date Posted: ";
            p1.Attributes.Add("class", " fa");
            footer.Controls.Add(p1);

            date.Text = created;
            footer.Controls.Add(date);

            likes.Text = like.ToString();
            likes.ID = "likes";
            likes.CssClass = "pull-right";
            footer.Controls.Add(likes);

            i1.ID = "i1";
            i1.Attributes.Add("class", "glyphicon glyphicon-thumbs-up pull-right");
            i1.Attributes.Add("data-toggle", "tooltip");
            i1.Attributes.Add("title", "Likes Received");
            footer.Controls.Add(i1);

            helpful.Text = helps.ToString();
            helpful.ID = "helpful";
            helpful.CssClass = "pull-right";
            footer.Controls.Add(helpful);

            i2.ID = "i1";
            i2.Attributes.Add("class", "glyphicon glyphicon glyphicon-wrench pull-right");
            i2.Attributes.Add("data-toggle", "tooltip");
            i2.Attributes.Add("title", "Helpfuls Received");
            footer.Controls.Add(i2);



            container.Controls.Add(heading);
            container.Controls.Add(body);
            container.Controls.Add(footer);


            panelComments.Controls.Add(container);
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Session["id"] != null)
            {
                string comment = txtDescription.Text;
                web.AddComment(comment, (int)(Session["id"]), (Convert.ToInt32(Request["id"])));
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "MessageBox", "alert('Comment Submitted');", true);
                Response.Redirect(HttpContext.Current.Request.Url.ToString(), true);
            }
            else
            {               
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "MessageBox", "alert('Login Required');", true);
                Response.Redirect("index.aspx");
            }           
        }
    }
}