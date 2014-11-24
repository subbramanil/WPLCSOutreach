using DataOperations.DBEntity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataOperations.DBEntityManager
{ 
    public class PersonDBManager
    {
        /// <summary>
        /// Get a user by email address, if they exist in the database.
        /// </summary>
        /// <param name="email"></param>
        /// <returns>Person or null</returns>
        public Person GetUser(string email)
        {
            Person person = new Person();
               
            try
            {
                using (DBCSEntities entity = new DBCSEntities())
                {
                    person = (from personRecord in entity.People where personRecord.Email == email select personRecord).FirstOrDefault();
                }
            }
            catch(Exception ex) 
            {
                person = null;
                //person.Email = ex.Message; // use this to debug.
            }
            return person; // null if not found.
        }

    }
}
