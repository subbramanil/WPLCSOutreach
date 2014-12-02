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
    public partial class UpdateEvent : System.Web.UI.Page
    {
        AdminDBManager db = new AdminDBManager();

        protected void Page_Load(object sender, EventArgs e)
        {
            List<EventType> eventTypes = new List<EventType>();

            eventTypes = db.GetEventTypes();
            drpEventName.DataSource = eventTypes;
            drpEventName.DataBind();

            List<Course> courseTypes = new List<Course>();

            courseTypes = db.GetCourseTypes();
            drpCourseName.DataSource = courseTypes;
            drpCourseName.DataBind();

        }
    }
}