using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using CBLServer.Models;

namespace CBLServer
{
    public class CBLService : ICBLService
    {
        RigModel RigModel = new RigModel();
        UserModel UserModel = new UserModel();
        ThreadModel ThreadModel = new ThreadModel();
        CommentModel CommentModel = new CommentModel();

        public int AddUser(int user_id, string user_first, string user_last, string user_username, string user_nickname, string user_password,
            string user_address, int user_rating_useful, string user_gender, DateTime user_registered_date, DateTime user_birthday, string user_email,
            byte[] user_picture, int user_age, string user_bio, string user_mobile, int user_rating_helpful, int user_rating_like, int user_thread_count)
        {
            return UserModel.AddUser(user_id, user_first, user_last, user_username, user_nickname, user_password,
                user_address, user_rating_useful, user_gender, user_registered_date, user_birthday, user_email,
                user_picture, user_age, user_bio, user_mobile, user_rating_helpful, user_rating_like, user_thread_count);
        }

        public void UpdateUser(int user_id, string user_first, string user_last, string user_username, string user_nickname, string user_password,
            string user_address, int user_rating_useful, string user_gender, DateTime user_registered_date, DateTime user_birthday, string user_email,
            byte[] user_picture, int user_age, string user_bio, string user_mobile, int user_rating_helpful, int user_rating_like, int user_thread_count)
        {
            UserModel.UpdateUser(user_id, user_first, user_last, user_username, user_nickname, user_password,
                user_address, user_rating_useful, user_gender, user_registered_date, user_birthday, user_email,
                user_picture, user_age, user_bio, user_mobile, user_rating_helpful, user_rating_like, user_thread_count);
        }

        public void DeleteUser(int user_id)
        {
            UserModel.DeleteUser(user_id);
        }

        public IEnumerable<user> GetAllUser()
        {
            return UserModel.GetAllUser();
        }

        public IEnumerable<user> GetUser(string userEmail)
        {
            return UserModel.GetUser(userEmail);
        }

        public IEnumerable<thread> GetThreads(int id)
        {
            return ThreadModel.GetThreads();
        }

        public int GetTotalThreads()
        {
            return ThreadModel.GetTotalThreads();
        }

        public int GetUserCount()
        {
            return UserModel.GetUserCount();
        }
        public IEnumerable<ThreadModel.ForumThread> GetCurrentThread(int id)
        {
            return ThreadModel.GetCurrentThread(id);
        }
        public IEnumerable<ThreadModel.ForumThread> GetCurrentThreadForum()
        {
            return ThreadModel.GetCurrentThreadForum();
        }

        public int CreateThread(int user_id, int forum_id, string thread_title, string thread_description)
        {
            return ThreadModel.CreateThread(user_id, forum_id, thread_title, thread_description);
        }

        public IEnumerable<user> GetUserByID(int userID)
        {
            return UserModel.GetUserByID(userID);
        }

        public IEnumerable<CommentModel.ThreadComment> getThreadComment(int thread_id)
        {
            return CommentModel.getThreadComment(thread_id);
        }

        public void AddComment(string comment_descrption, int user_id, int thread_id)
        {
            CommentModel.AddComment(comment_descrption, user_id, thread_id);
        }

        public IEnumerable<ThreadModel.ForumThread> GetCurrentThreadByThread(int id)
        {
            return ThreadModel.GetCurrentThreadByThread(id);
        }

        public int GetCommentCount()
        {
            return CommentModel.GetCommentCount();
        }
    }
}
