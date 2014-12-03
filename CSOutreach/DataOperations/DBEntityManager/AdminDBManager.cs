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

        public List<String> GetAvailableInstructors()
        {
            DateTime thisDay = DateTime.Today;

            //Using this because there are no events that will start from today
            DateTime someDay = new DateTime(2014, 9, 2);
            List<String> instructor = new List<String>();
            try
            {
                using (DBCSEntities entity = new DBCSEntities())
                {
                    instructor = (from instructorTemp in entity.People
                                  where instructorTemp.Role=="Instructor" 
                                  select instructorTemp.FirstName+" "+instructorTemp.LastName).ToList();
                }
            }
            catch (Exception)
            {


            }
            return instructor;
        }

        public List<Person> GetUpcommingInstructorsOnLeave()
        {
            DateTime thisDay = DateTime.Today;

            //Using this because there are no events that will start from today
            DateTime someDay = new DateTime(2014, 9, 2);
            List<Person> instructor = new List<Person>();
            try
            {
                using (DBCSEntities entity = new DBCSEntities())
                {
                    instructor = (from ei in entity.EventInstructors 
                                  join p in entity.People 
                                  on ei.InstructorId equals p.PersonId
                                  join e in entity.Events
                                  on ei.EventId equals e.EventId
                                  where e.StartDate>=someDay 
                                  && ei.LeaveApplied == true
                                  select p).ToList();
                }
            }
            catch (Exception)
            {


            }
            return instructor;
        }


        public List<Course> GetCurrentCourses()
        {
            DateTime thisDay = DateTime.Today;

            //Using this because there are no events that will start from today
            DateTime someDay = new DateTime(2014, 9, 2);
            List<Course> course = new List<Course>();
            try
            {
                using (DBCSEntities entity = new DBCSEntities())
                {
                    course = (from c in entity.Courses
                                  join e in entity.Events
                                  on c.CourseId equals e.CourseId
                                  where e.StartDate>=someDay
                                  select c).Distinct().ToList();
                }
            }
            catch (Exception)
            {


            }
            return course;
        }



    }
}
