//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CBLServer.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class thread
    {
        public thread()
        {
            this.forum_thread = new HashSet<forum_thread>();
            this.thread_comment = new HashSet<thread_comment>();
        }
    
        public int thread_id { get; set; }
        public string thread_title { get; set; }
        public string thread_description { get; set; }
        public string thread_permission { get; set; }
        public Nullable<int> thread_rating_like { get; set; }
        public Nullable<int> thread_rating_helpful { get; set; }
        public Nullable<System.DateTime> thread_created { get; set; }
        public Nullable<int> thread_islocked { get; set; }
        public Nullable<int> thread_iscommentlock { get; set; }
    
        public virtual ICollection<forum_thread> forum_thread { get; set; }
        public virtual ICollection<thread_comment> thread_comment { get; set; }
        public int forum_id { get; internal set; }
    }
}
