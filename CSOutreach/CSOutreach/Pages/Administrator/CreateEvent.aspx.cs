using System;

using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using System.Web.ModelBinding;
using DataOperations.DBEntity;
using DataOperations.DBEntityManager;

namespace CSOutreach.Pages.Administrator
{
    public partial class CreateEvent : System.Web.UI.Page
    {
        AdminDBManager db = new AdminDBManager();
        

        protected void Page_Load(object sender, EventArgs e)
        {
            PersonDBManager user = new PersonDBManager();
            string password = user.Encrypt("abc");
            Console.WriteLine(password);


            List<EventType> eventTypes = new List<EventType>();
            
            eventTypes = db.GetEventTypes();
            drpEventType.DataSource = eventTypes;
            drpEventType.DataBind();

            List<Course> courseTypes = new List<Course>();
              courseTypes=  db.GetCourseTypes();
            drpCourseType.DataSource = courseTypes;
            drpCourseType.DataBind();



        }
    }
}