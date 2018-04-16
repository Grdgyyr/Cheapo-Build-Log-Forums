using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using CBLServer.Models;

namespace CBLServer
{
    [ServiceContract]
    public interface ICBLService
    {
        [OperationContract]
        int AddUser(int user_id, string user_first, string user_last, string user_username, string user_nickname, string user_password,
            string user_address, int user_rating_useful, string user_gender, DateTime user_registered_date, DateTime user_birthday, string user_email,
            byte[] user_picture, int user_age, string user_bio, string user_mobile, int user_rating_helpful, int user_rating_like, int user_thread_count);

        [OperationContract]
        void UpdateUser(int user_id, string user_first, string user_last, string user_username, string user_nickname, string user_password,
            string user_address, int user_rating_useful, string user_gender, DateTime user_registered_date, DateTime user_birthday, string user_email,
            byte[] user_picture, int user_age, string user_bio, string user_mobile, int user_rating_helpful, int user_rating_like, int user_thread_count);

        [OperationContract]
        void DeleteUser(int user_id);

        [OperationContract]
        IEnumerable<user> GetAllUser();

        [OperationContract]
        IEnumerable<user> GetUser(string userEmail);

        [OperationContract]
        IEnumerable<thread> GetThreads(int id);

        [OperationContract]
        int GetTotalThreads();

        [OperationContract]
        int GetUserCount();

        [OperationContract]
        IEnumerable<ThreadModel.ForumThread> GetCurrentThread(int id);

        [OperationContract]
        IEnumerable<ThreadModel.ForumThread> GetCurrentThreadForum();

        [OperationContract]
        int CreateThread(int user_id, int forum_id, string thread_title, string thread_description);

        [OperationContract]
        IEnumerable<user> GetUserByID(int userID);

        [OperationContract]
        IEnumerable<CommentModel.ThreadComment> getThreadComment(int thread_id);

        [OperationContract]
        void AddComment(string comment_descrption, int user_id, int thread_id);

        [OperationContract]
        IEnumerable<ThreadModel.ForumThread> GetCurrentThreadByThread(int id);

        [OperationContract]
        int GetCommentCount();
    }
    
}
