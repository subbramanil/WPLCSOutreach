using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using DataOperations.DBEntity;

namespace DataOperations.DBEntityManager
{
    public class AdminDBManager
    {
        public List<EventType> GetEventTypes()
        {
            List<EventType> eventTypes = new List<EventType>();
            try
            {
                using (DBCSEntities entity = new DBCSEntities())
                {
                    eventTypes = (from eventTypeTemp in entity.EventTypes select eventTypeTemp).ToList();
                }
            }
            catch (Exception)
            {
               
               
            }
            return eventTypes;
        }

        public List<Course> GetCourseTypes()
        {
            List<Course> courseTypes = new List<Course>();
            try
            {
                using (DBCSEntities entity = new DBCSEntities())
                {
                    courseTypes = (from courseTypeTemp in entity.Courses select courseTypeTemp).ToList();
                }
            }
            catch (Exception)
            {


            }
            return courseTypes;
        }


    }
}
