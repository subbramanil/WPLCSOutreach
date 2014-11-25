//This page holds the authentication of all student pages.

using StudentEntity.PageTraversal;
using StudentEntity.Session;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace CSOutreach.Pages.Student
{
    public class StudentBasePage:Page
    {

        protected override void OnInit(EventArgs e)
        {
         if(!AuthenticateUser())
         {
             LogOffUser();
         }
        }

        private bool AuthenticateUser()
        {
            if(Session["USERNAME"]!=null)
            {
                if(Session["ROLE"]=="Student")
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }

        private void LogOffUser()
        {
            Response.Redirect(TraverseManager.GetPage(PageData.LoginPage));
        }

        /*This property can be used to store intermediate informations across page transitions. View 
         * "DetailedEventsListing.cs page for example usage
         * */
        protected object CrossPageInformation
        {
            get
            {
               return Session[StudentSession.CROSS_PAGE_INFORMATION] as object;
            }
            set
            {
                Session[StudentSession.CROSS_PAGE_INFORMATION] = value;
            }
        }


    }
}