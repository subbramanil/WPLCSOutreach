//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CSOutreach
{
    using System;
    using System.Collections.Generic;
    
    public partial class Academic
    {
        public Academic()
        {
            this.InstructorAcademics = new HashSet<InstructorAcademic>();
        }
    
        public int AcademicsId { get; set; }
        public string DayOfWeek { get; set; }
        public System.TimeSpan StartTime { get; set; }
        public System.TimeSpan EndTime { get; set; }
    
        public virtual ICollection<InstructorAcademic> InstructorAcademics { get; set; }
    }
}
