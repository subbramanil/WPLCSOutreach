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
        public Person GetUser(string username)
        {
            Person person = new Person();
            person = null;
               
            try
            {
                using (DBCSEntities entity = new DBCSEntities())
                {
                    
                    person = (from personRecord in entity.People where personRecord.Email == username select personRecord).FirstOrDefault();
                }
            }
            catch(Exception ex) 
            {
               
               
            }
            return person;
        }

    }
}
