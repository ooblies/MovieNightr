//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MovieNightr.Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class MovieLists
    {
        public int MovieListId { get; set; }
        public int UserId { get; set; }
        public int MovieId { get; set; }
        public Nullable<int> Rank { get; set; }
        public int MovieListStatusId { get; set; }
        public bool IsActive { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public string CreatedBy { get; set; }
        public System.DateTime ModifiedOn { get; set; }
        public string ModifiedBy { get; set; }
    
        public virtual Movies Movies { get; set; }
        public virtual MovieListStatus MovieListStatus { get; set; }
        public virtual Users Users { get; set; }
    }
}