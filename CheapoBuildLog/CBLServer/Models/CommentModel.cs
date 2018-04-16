using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CBLServer.Models
{
    public class CommentModel
    {
        CBL_Entities db = new CBL_Entities();

        public void AddComment(string comment_descrption, int user_id, int thread_id)
        {
            comment newComment = new comment
            {
                comment_description = comment_descrption
            };

            db.comments.Add(newComment);
            db.SaveChanges();

            thread_comment threadComment = new thread_comment
            {
                user_id = user_id,
                thread_id = thread_id,
                comment_id = newComment.comment_id
            };

            db.thread_comment.Add(threadComment);
            db.SaveChanges();
        }

        public int GetCommentCount()
        {
            db.Configuration.ProxyCreationEnabled = false;

            var comment = (from c in db.comments
                           select c);
            return comment.Count();
        }

        public class ThreadComment
        {
            public string comment_description { get; set; }
            public int comment_id { get; set; }
            public int user_id { get; set; }
            public string user_username { get; set; }
            public byte[] user_picture { get; set; }
        }

        public IEnumerable<ThreadComment> getThreadComment(int thread_id)
        {
            var comment = (from c in db.comments
                           join tc in db.thread_comment on c.comment_id equals tc.comment_id
                           join u in db.users on tc.user_id equals u.user_id
                           where tc.thread_id == thread_id
                           select new ThreadComment
                           {
                               comment_description = c.comment_description,
                               comment_id = c.comment_id,
                               user_id = u.user_id,
                               user_username = u.user_username,
                               user_picture = u.user_picture
                           });

            return comment;
        }


    }
}
