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
    
    public partial class FilterSetFilters
    {
        public int FilterSetFilterId { get; set; }
        public int FilterSetId { get; set; }
        public int FilterId { get; set; }
        public bool IsActive { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public string CreatedBy { get; set; }
        public System.DateTime ModifiedOn { get; set; }
        public string ModifiedBy { get; set; }
    
        public virtual Filters Filters { get; set; }
        public virtual FilterSets FilterSets { get; set; }
    }
}
