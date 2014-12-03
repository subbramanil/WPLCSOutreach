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

        public List<Event> GetUpcommingEvents()
        {
            DateTime thisDay = DateTime.Today;

            //Using this because there are no events that will start from today
            DateTime someDay = new DateTime(2014,9,2);
            List<Event> events = new List<Event>();
            try
            {
                using (DBCSEntities entity = new DBCSEntities())
                {
                    events = (from eventTemp in entity.Events where eventTemp.StartDate>=someDay  select eventTemp).ToList();
                }
            }
            catch (Exception)
            {


            }
            return events;
        }

        public List<Person> GetAvailableInstructors()
        {
            DateTime thisDay = DateTime.Today;

            //Using this because there are no events that will start from today
            DateTime someDay = new DateTime(2014, 9, 2);
            List<Person> instructor = new List<Person>();
            try
            {
                using (DBCSEntities entity = new DBCSEntities())
                {
                    instructor = (from instructorTemp in entity.People where instructorTemp.Role=="Instructor" select instructorTemp).ToList();
                }
            }
            catch (Exception)
            {


            }
            return instructor;
        }


    }
}
