using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CBLServer.Models
{
    public class UserModel
    {
        CBL_Entities db = new CBL_Entities();

        public int AddUser(int user_id, string user_first, string user_last, string user_username, string user_nickname, string user_password,
            string user_address, int user_rating_useful, string user_gender, DateTime user_registered_date, DateTime user_birthday, string user_email,
            byte[] user_picture, int user_age, string user_bio, string user_mobile, int user_rating_helpful, int user_rating_like, int user_thread_count)
        {
            user newUsr = new user
            {
                
                user_first = user_first,
                user_last = user_last,
                user_username = user_username,
                user_nickname = user_nickname,
                user_password = user_password,
                user_address = user_address,
                user_rating_useful = user_rating_useful,
                user_gender = user_gender,
                user_registered_date = user_registered_date,
                user_birthday = user_birthday,
                user_email = user_email,
                user_picture = user_picture,
                user_age = user_age,
                user_bio = user_bio,
                user_mobile = user_mobile,
                user_rating_helpful = user_rating_helpful,
                user_rating_like = user_rating_like,
                user_thread_count = user_thread_count
            };

            db.users.Add(newUsr);
            db.SaveChanges();

            return newUsr.user_id;
        }

        public void UpdateUser(int user_id, string user_first, string user_last, string user_username, string user_nickname, string user_password,
            string user_address, int user_rating_useful, string user_gender, DateTime user_registered_date, DateTime user_birthday, string user_email,
            byte[] user_picture, int user_age, string user_bio, string user_mobile, int user_rating_helpful, int user_rating_like, int user_thread_count)
        {
            user updUsr = db.users.Find(user_id);

            updUsr.user_first = user_first;
            updUsr.user_last = user_last;
            updUsr.user_username = user_username;
            updUsr.user_nickname = user_nickname;
            updUsr.user_password = user_password;
            updUsr.user_address = user_address;
            updUsr.user_rating_useful = user_rating_useful;
            updUsr.user_gender = user_gender;
            updUsr.user_registered_date = user_registered_date;
            updUsr.user_birthday = user_birthday;
            updUsr.user_email = user_email;
            updUsr.user_picture = user_picture;
            updUsr.user_age = user_age;
            updUsr.user_bio = user_bio;
            updUsr.user_mobile = user_mobile;
            updUsr.user_rating_helpful = user_rating_helpful;
            updUsr.user_rating_like = user_rating_like;
            updUsr.user_thread_count = user_thread_count;

            db.SaveChanges();
    }
        

        public void DeleteUser(int user_id)
        {
            user delUsr = db.users.Find(user_id);
            db.users.Attach(delUsr);
            db.users.Remove(delUsr);
            db.SaveChanges();
        }

        public IEnumerable<user> GetAllUser()
        {
            db.Configuration.ProxyCreationEnabled = false;
            try
            {
                
                var user = (from u in db.users
                            select u).ToList();
                return user;
            }
            catch (Exception)
            {
                return null;
            }
            
        }

        public IEnumerable<user> GetUser(string userEmail)
        {
            db.Configuration.ProxyCreationEnabled = false;
            try
            {
                var user = (from u in db.users
                            where userEmail == u.user_email
                            select u);
                return user;
            }
            catch (Exception)
            {

                return null;
            }
            
        }

        public IEnumerable<user> GetUserByID(int userID)
        {
            db.Configuration.ProxyCreationEnabled = false;
            try
            {
                var user = (from u in db.users
                            where userID == u.user_id
                            select u);
                return user;
            }
            catch (Exception)
            {

                return null;
            }

        }

        public int GetUserCount()
        {
            var user = (from u in db.users select u).Count();

            return Convert.ToInt32(user);
        }
    }
}