using DataOperations.DBEntity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace DataOperations.DBEntityManager
{ 
    public class PersonDBManager
    {
        /// <summary>
        /// Get the user details
        /// </summary>
        /// <param name="username"></param>
        /// <returns>Returns person Object</returns>
        public Person GetUser(string username)
        {
            Person person = new Person();   
               
            try
            {
                using (DBCSEntities entity = new DBCSEntities())
                {
                    person = (from personRecord in entity.People where personRecord.Email == username 
                              select personRecord).FirstOrDefault();
                }
            }
            catch(Exception ex) 
            {

            }
            return person;
        }

        /// <summary>
        /// Add New User in database
        /// </summary>
        /// <param name="person"></param>
        /// <returns></returns>
        public bool AddNewUserDetails(Person person)
        {
            try
            {
                using (DBCSEntities entity = new DBCSEntities())
                {
                    person.Password = Encrypt(person.Password != null ? person.Password : "");
                    entity.AddToPeople(person);
                    entity.SaveChanges();
                }
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }

        /// <summary>
        /// Encrypt the Password
        /// </summary>
        /// <param name="inputPassword">input String</param>
        /// <returns>Encrypted String</returns>
        public string Encrypt(string inputPassword)
        {
            MD5 md5 = MD5.Create();
            return Encoding.ASCII.GetString(md5.ComputeHash(ASCIIEncoding.Default.GetBytes(inputPassword)));

    }
}
}
