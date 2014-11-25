using DataOperations.DBEntity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataOperations.DBEntityManager
{
   public class StudentEventDBManager
    {
        /// <summary>
        /// Get Student Events
        /// </summary>
        /// <param name="userid"></param>
        /// <returns></returns>
        public List<Event> GetStudentEvent(int userid)
        {
            List<Event> studentEventList = null;

            try
            {
                using (DBCSEntities entity = new DBCSEntities())
                {
                    var query = from Event in entity.Events
                                join studentEvent in entity.StudentEvents on Event.EventId equals studentEvent.EventId  
                                where studentEvent.StudentId == userid
                                select Event;
                    studentEventList = (query).ToList();
                }
            }
            catch (Exception ex)
            {

            }
            return studentEventList;
        }

    }
}
