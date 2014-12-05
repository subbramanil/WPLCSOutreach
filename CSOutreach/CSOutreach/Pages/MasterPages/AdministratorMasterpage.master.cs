using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CSOutreach.Pages.MasterPages
{
    public partial class AdministratorMasterpage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Code to check if the user role is Admin

            //Get the current role from the session
            var currentUserRole = HttpContext.Current.Session["ROLE"];

            if (currentUserRole!=null)
            {
                if (currentUserRole.ToString().CompareTo("ADMIN") != 0)
                {
                    //Redirect if user is not admin
                    Session["error_message"] = "Restricted Access: You are not logged in as Administrator!";
                    Response.Redirect("../Common/Default.aspx");

                }
            }
            else {
                //Redirect if user has not logged in
                Session["error_message"] = "Restricted Access: You are not logged in as Administrator!";
                Response.Redirect("../Common/Default.aspx");
            
            }
        }
    }
}