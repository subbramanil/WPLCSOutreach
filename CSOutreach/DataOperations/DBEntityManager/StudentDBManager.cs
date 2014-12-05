using DataOperations.DBEntity;
using System;
using System.Collections.Generic;
using System.Data.Objects;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataOperations.DBEntityManager
{
    public class StudentDBManager
    {
        DBCSEntities Entities;
        public StudentDBManager()
        {
            Entities = new DBCSEntities();
        }
        public ObjectSet<Course> AllCourses
        {
            get
            {
                List<string> courses = new List<string>();
                return Entities.Courses;
            }
        }

        public ObjectSet<StudentEvent> AllStudentEvents
        {
            get
            {
               
                return Entities.StudentEvents;
                
            }
        }

        public ObjectSet<Event> AllEvents
        {
            get
            {
                return Entities.Events;
            }
        }
    }
}
