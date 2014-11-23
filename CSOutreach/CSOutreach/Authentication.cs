using DataOperations.DBEntity;
using DataOperations.DBEntityManager;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace CSOutreach
{
    public class Authentication
    {
        private static bool isvalidusername;
        private static bool isvalidpassword;
        public enum Role
        {
            USER,
            ADMIN,
            INSTRUCTOR,
            ANONYMOUS
        }

        public enum SessionVariable
        {
            USERNAME,
            ROLE
        }

        public static bool Authenticated
        {
            get
            {
                if (HttpContext.Current.Session[SessionVariable.USERNAME.ToString()] != null)
                {
                    return true;
                }
                return false;
            }
        }

        public static string Username
        {
            get
            {
                string username = (string) HttpContext.Current.Session[SessionVariable.USERNAME.ToString()];
                if (username != null)
                {
                    return username;
                }
                else { return String.Empty; }
            }
        }
        public static bool IsValidUserName
        {
            get { return isvalidusername; }
        }

        public static bool IsValidPassword
        {
            get { return isvalidpassword; }
        }

        public static bool hasRequiredRole(Role role) 
        {
            // TODO: Add real checking.
            return true;
        }


        public static bool login(string username, string password)
        {
            //TODO: Add real code (or redirect) to log in or log out as appropriate.
            if (HttpContext.Current.Session[Authentication.SessionVariable.USERNAME.ToString()] == null)
            {
                if (Authentication.isValidPerson(username, password))
                {
                      HttpContext.Current.Session[Authentication.SessionVariable.USERNAME.ToString()] = username;
                      return true;
                }
            }
            return false;
        }

        public static void logout()
        {
            // TODO: add real code to sign out
            HttpContext.Current.Session[Authentication.SessionVariable.USERNAME.ToString()] = null;
        }

        public static bool isValidPerson(string username, string password)
        {
            PersonDBManager personDBManager = new PersonDBManager();
            try
            {
                Person person = personDBManager.GetUser(username);
                if (person != null)
                {
                    isvalidusername = true;
                    if (Authentication.isCorrectPassword(password, person.Password))
                    {
                        isvalidpassword = true; 
                        return true; 
                    }
                    else
                    {
                        // Incorrect password : When password doesn't match
                        HttpContext.Current.Session["error_message"] += "<br />Incorrect Password.";
                        isvalidpassword = false; }
                }
                else
                {
                    // Incorrect Username
                    isvalidusername = false;
                    HttpContext.Current.Session["error_message"] += "<br />User name doesn't exist.";
                }
            }
            catch (Exception ex)
            {
                HttpContext.Current.Session["error_message"] += "<br />Error Occured.";
            }

            return false;
        }

        public static bool isValidUsername(string username)
        {
            PersonDBManager personDBManager = new PersonDBManager();
            try
            {
                if (personDBManager.GetUser(username) != null)
                    return true;
            }
            catch(Exception ex)
            { 
            }
             
            return false;
        }

        /// <summary>
        /// Validate the password
        /// </summary>
        /// <param name="inputPassword">Entered password</param>
        /// <param name="personPassword">DB stored password</param>
        /// <returns>Returns true when password matches</returns>
        public static bool isCorrectPassword(string inputPassword, string personPassword)
        {
            // Encrypted password
            string hashedPassword = Encrypt(inputPassword);
            return true ? hashedPassword == personPassword : false;
        }

        /// <summary>
        /// Encrypt the Password
        /// </summary>
        /// <param name="inputPassword">input String</param>
        /// <returns>Encrypted String</returns>
        public static string Encrypt(string inputPassword)
        {
            MD5 md5 = MD5.Create();
            return Encoding.ASCII.GetString(md5.ComputeHash(ASCIIEncoding.Default.GetBytes(inputPassword)));

        }

    }
}