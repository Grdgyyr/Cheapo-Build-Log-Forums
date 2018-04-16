using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CBLServer.Models
{
    public class ThreadModel
    {
        CBL_Entities db = new CBL_Entities();

        public int CreateThread(int user_id, int forum_id, string thread_title, string thread_description)
        {
            thread newThread = new thread
            {
                thread_title = thread_title,
                thread_description = thread_description,
                thread_permission = "default.permission",
                thread_rating_like = 0,
                thread_rating_helpful = 0,
                thread_created = DateTime.Today,
                thread_islocked = 0,
                thread_iscommentlock = 0              
        };

            db.threads.Add(newThread);
            db.SaveChanges();

            forum_thread newforum_Thread = new forum_thread
            {
                user_id = user_id,
                forum_id = forum_id,
                thread_id = newThread.thread_id
            };

            db.forum_thread.Add(newforum_Thread);
            db.SaveChanges();

            return newThread.thread_id;
        }


        public IEnumerable<thread> GetThreads()
        {
            db.Configuration.ProxyCreationEnabled = false;
            var thread = (from t in db.threads
                          select t);
            return thread;
        }

        public int GetTotalThreads()
        {
            var thread = (from t in db.threads
                          select t).Count();

            return Convert.ToInt32(thread);
        }

        public IEnumerable<ForumThread> GetCurrentThread(int id)
        {
            db.Configuration.ProxyCreationEnabled = false;
            var thread = (from t in db.threads
                          join ft in db.forum_thread on t.thread_id equals ft.thread_id
                          join f in db.forum on ft.forum_id equals f.forum_id
                          join u in db.users on ft.user_id equals u.user_id
                          where u.user_id == id

                          select new ForumThread
                          {
                              forum_id = f.forum_id,
                              forum_name = f.forum_name,
                              forum_description = f.forum_description,
                              forum_permission = f.forum_permission,
                              forum_islocked = f.forum_islocked,
                              thread_id = t.thread_id,
                              thread_title = t.thread_title,
                              thread_description = t.thread_description,
                              thread_permission = t.thread_permission,
                              thread_rating_like = t.thread_rating_like,
                              thread_rating_helpful = t.thread_rating_helpful,
                              thread_created = t.thread_created,
                              thread_islocked = t.thread_islocked,
                              thread_iscommentlock = t.thread_iscommentlock,
                              user_id = u.user_id,
                              user_username = u.user_username,
                              user_nickname = u.user_nickname,
                              user_picture = u.user_picture


                          });
            return thread;
        }

        public IEnumerable<ForumThread> GetCurrentThreadByThread(int id)
        {
            db.Configuration.ProxyCreationEnabled = false;
            var thread = (from t in db.threads
                          join ft in db.forum_thread on t.thread_id equals ft.thread_id
                          join f in db.forum on ft.forum_id equals f.forum_id
                          join u in db.users on ft.user_id equals u.user_id
                          where t.thread_id == id

                          select new ForumThread
                          {
                              forum_id = f.forum_id,
                              forum_name = f.forum_name,
                              forum_description = f.forum_description,
                              forum_permission = f.forum_permission,
                              forum_islocked = f.forum_islocked,
                              thread_id = t.thread_id,
                              thread_title = t.thread_title,
                              thread_description = t.thread_description,
                              thread_permission = t.thread_permission,
                              thread_rating_like = t.thread_rating_like,
                              thread_rating_helpful = t.thread_rating_helpful,
                              thread_created = t.thread_created,
                              thread_islocked = t.thread_islocked,
                              thread_iscommentlock = t.thread_iscommentlock,
                              user_id = u.user_id,
                              user_username = u.user_username,
                              user_nickname = u.user_nickname,
                              user_picture = u.user_picture


                          });
            return thread;
        }

        public class ForumThread
        {
            public int forum_id { get; set; }
            public string forum_name { get;  set; }
            public string forum_description { get;  set; }
            public string forum_permission { get;  set; }
            public int? forum_islocked { get;  set; }
            public int thread_id { get;  set; }
            public string thread_title { get;  set; }
            public string thread_description { get;  set; }
            public string thread_permission { get;  set; }
            public int? thread_rating_like { get;  set; }
            public int? thread_rating_helpful { get;  set; }
            public DateTime? thread_created { get;  set; }
            public int? thread_islocked { get;  set; }
            public int? thread_iscommentlock { get;  set; }
            public int user_id { get;  set; }
            public string user_username { get;  set; }
            public string user_nickname { get;  set; }
            public byte[] user_picture { get;  set; }
        }

        public IEnumerable<ForumThread> GetCurrentThreadForum()
        {
            db.Configuration.ProxyCreationEnabled = false;

            var thread = (from t in db.threads
                          join ft in db.forum_thread on t.thread_id equals ft.thread_id                      
                          join f in db.forum on ft.forum_id equals f.forum_id
                          join u in db.users on ft.user_id equals u.user_id
                          orderby t.thread_rating_helpful descending

                          select new ForumThread
                          {                             
                              forum_id = f.forum_id,
                              forum_name = f.forum_name,
                              forum_description = f.forum_description,
                              forum_permission = f.forum_permission,
                              forum_islocked = f.forum_islocked,
                              thread_id = t.thread_id,
                              thread_title = t.thread_title,
                              thread_description = t.thread_description,
                              thread_permission = t.thread_permission,
                              thread_rating_like = t.thread_rating_like,
                              thread_rating_helpful = t.thread_rating_helpful,
                              thread_created = t.thread_created,
                              thread_islocked = t.thread_islocked,
                              thread_iscommentlock = t.thread_iscommentlock,
                              user_id = u.user_id,                             
                              user_username = u.user_username,
                              user_nickname = u.user_nickname,
                              user_picture = u.user_picture


                          });

            return thread;
        }


       
    }
}
