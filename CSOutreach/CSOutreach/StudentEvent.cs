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
    
    public partial class StudentEvent
    {
        public int StudentEventId { get; set; }
        public System.DateTime RegistrationDate { get; set; }
        public int EventId { get; set; }
        public int StudentId { get; set; }
    
        public virtual Event Event { get; set; }
        public virtual Student Student { get; set; }
    }
}
