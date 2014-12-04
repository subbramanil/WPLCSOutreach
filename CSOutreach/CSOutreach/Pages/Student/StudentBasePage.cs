//This page holds the authentication of all student pages.

using DataOperations.DBEntity;
using DataOperations.DBEntityManager;
using StudentEntity.PageTraversal;
using StudentEntity.Session;
using System;
using System.Collections.Generic;
using System.Data.Objects.DataClasses;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace CSOutreach.Pages.Student
{
    public class StudentBasePage : Page
    {

        protected override void OnInit(EventArgs e)
        {
            if (!AuthenticateUser())
            {
                LogOffUser();
            }
        }

        private bool AuthenticateUser()
        {
            if (Session["USERNAME"] != null)
            {
                if (Session["ROLE"].ToString().CompareTo("Student") == 0)
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

        protected Person StudentDetails
        {
            get
            {
                string ID = Session[Authentication.SessionVariable.USERNAME.ToString()].ToString();
                PersonDBManager StudentPerson = new PersonDBManager();
                return StudentPerson.GetUser(ID);
            }
        }

        protected EntityCollection<StudentEvent> StudentEvents
        {
            get
            {
               return this.StudentDetails.Student.StudentEvents;

            }
        }

        protected EntityCollection<Course> StudentCourses
        {
            get
            {
                EntityCollection<Course> AllStudentCourses=new EntityCollection<Course>();
                foreach(StudentEvent Event in StudentEvents)
                {
                    if (!AllStudentCourses.Contains(Event.Event.Course))
                    {
                        AllStudentCourses.Add(Event.Event.Course);
                    }
                }
                return AllStudentCourses;
            }
        }

        protected int StudentLevel
        {
            get
            {
                int MaxCourseLevel = -1;
                foreach (Course CourseEntity in StudentCourses)
                {
                   if(CourseEntity.CourseLevel>MaxCourseLevel)
                   {
                       MaxCourseLevel = CourseEntity.CourseLevel;
                   }
                }
                return MaxCourseLevel;
            }
        }


    }
}