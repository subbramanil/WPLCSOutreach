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
            Person person;
               
            try
            {
                using (DBCSEntities entity = new DBCSEntities())
                {
                    person = new Person();
                    person = (from personRecord in entity.People where personRecord.Email == username select personRecord).FirstOrDefault();
                }
            }
            catch(Exception ex) 
            {
                person = new Person();
                person.FirstName = ex.Message; 
               
            }
            return person;
        }

    }
}
