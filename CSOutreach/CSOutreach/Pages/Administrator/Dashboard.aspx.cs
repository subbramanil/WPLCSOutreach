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
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            AdminDBManager db = new AdminDBManager();
            List<Event> upCommingEvents = db.GetUpcommingEvents();

            
            menu_ul_1.DataSource = upCommingEvents;
            menu_ul_1.DataBind();
        }
    }
}