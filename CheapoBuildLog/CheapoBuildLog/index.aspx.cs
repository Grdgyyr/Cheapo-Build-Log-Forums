using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CheapoBuildLog
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        CBLService.CBLServiceClient web = new CBLService.CBLServiceClient();
        protected void Page_Load(object sender, EventArgs e)
        {
            populatePortal();
            populateLatest();
        }

        protected void LoadPortal(String title, String content, int threadID, string username, 
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


            panelPortal.Controls.Add(container);
        }

        private void populatePortal()
        {
            var content = web.GetCurrentThreadForum();           

            for(int x = 0; x < content.Count(); x++)
            {
                string date = content[x].thread_created.Value.ToString("dd-MM-yyyy");
                int like = Convert.ToInt32(content[x].thread_rating_like);
                int help = Convert.ToInt32(content[x].thread_rating_helpful);

                LoadPortal(content[x].thread_title, content[x].thread_description, content[x].thread_id, 
                    content[x].user_username, date, like, help, content[x].user_id, content[x].user_picture);
            }

            lblTotalThreads.Text = web.GetTotalThreads().ToString();
            lblTotalUser.Text = web.GetUserCount().ToString();
            lblTotalComments.Text = web.GetCommentCount().ToString();

        }

        protected void loadLatest(int threadID, string title)
        {
            HtmlGenericControl a = new HtmlGenericControl("a");
            HtmlGenericControl h3 = new HtmlGenericControl("h3");

            h3.ID = "h3";
            h3.InnerText = title;
            a.Controls.Add(h3);

            a.ID = "a";
            a.Attributes.Add("href", "thread.aspx?id=" + threadID);
            h3.Attributes.Add("class", "col-sm-10 col-md-10");
            panelLatestThreads.Controls.Add(a);
        }

        private void populateLatest()
        {
            var content = web.GetCurrentThreadForum().OrderByDescending(x => x.thread_created).ToList();

            for (int x = 0; x < 3; x++)
            {
                loadLatest(content[x].thread_id, content[x].thread_title);
            }
        }
        
    }
}