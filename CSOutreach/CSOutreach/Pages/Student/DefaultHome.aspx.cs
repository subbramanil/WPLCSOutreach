using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataOperations.DBEntityManager;
using DataOperations.DBEntity;


namespace CSOutreach.Pages
{
    public partial class DefaultHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            StudentEventDBManager studentevent = new StudentEventDBManager();
             repRegisteredEvents.DataSource=   studentevent.GetStudentEvent(5);
             repRegisteredEvents.DataBind();
        }
    }
}