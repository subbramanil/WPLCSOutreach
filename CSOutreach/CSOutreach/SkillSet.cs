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
    
    public partial class SkillSet
    {
        public SkillSet()
        {
            this.Familiars = new HashSet<Familiar>();
        }
    
        public int SkillSetId { get; set; }
        public string SkillName { get; set; }
    
        public virtual ICollection<Familiar> Familiars { get; set; }
    }
}
