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
    
    public partial class Course
    {
        public Course()
        {
            this.Events = new HashSet<Event>();
            this.InstructorCourses = new HashSet<InstructorCourse>();
        }
    
        public int CourseId { get; set; }
        public int CourseLevel { get; set; }
        public string Description { get; set; }
    
        public virtual ICollection<Event> Events { get; set; }
        public virtual ICollection<InstructorCourse> InstructorCourses { get; set; }
    }
}
