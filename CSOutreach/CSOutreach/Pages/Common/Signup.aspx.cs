using DataOperations.DBEntity;
using DataOperations.DBEntityManager;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CSOutreach.Pages.Common
{
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// Check User Id exist or Not in database.
        /// </summary>
        /// <param name="userName">UserName</param>
        /// <returns></returns>
        [WebMethod()]
        public static int IsUserExists(string userName)
        {
            try
            {
                PersonDBManager user = new PersonDBManager();
                Person personDetails = new Person();
                personDetails = user.GetUser(userName.Trim());
                if (personDetails != null)
                    return 1;
                else
                    return 0;
            }
            catch (Exception e)
            {
                return -1;
            }
        }
    }
}