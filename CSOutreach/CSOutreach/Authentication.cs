using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CSOutreach
{
    public class Authentication
    {
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

        public static bool hasRequiredRole(Role role) 
        {
            // TODO: Add real checking.
            return true;
        }


        public static void login(string username, string password)
        {
            //TODO: Add real code (or redirect) to log in or log out as appropriate.
            if (HttpContext.Current.Session[Authentication.SessionVariable.USERNAME.ToString()] == null)
            {
                if (Authentication.isValidUsername(username))
                {
                    if (Authentication.isCorrectPassword(username, password)){
                        HttpContext.Current.Session[Authentication.SessionVariable.USERNAME.ToString()] = username;
                    }
                }
            }

        }

        public static void logout()
        {
            // TODO: add real code to sign out
            HttpContext.Current.Session[Authentication.SessionVariable.USERNAME.ToString()] = null;
        }

        public static bool isValidUsername(string username)
        {
            //TODO: add real code to check

            return true;
        }

        public static bool isCorrectPassword(string username, string password)
        {
            //TODO: add real code to check
            return true;
        }

    }
}