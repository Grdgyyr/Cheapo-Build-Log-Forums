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
    
    public partial class group
    {
        public group()
        {
            this.user_group = new HashSet<user_group>();
            this.group_perm = new HashSet<group_perm>();
        }
    
        public int group_id { get; set; }
        public string group_name { get; set; }
        public string group_description { get; set; }
        public string group_bio { get; set; }
    
        public virtual ICollection<user_group> user_group { get; set; }
        public virtual ICollection<group_perm> group_perm { get; set; }
    }
}