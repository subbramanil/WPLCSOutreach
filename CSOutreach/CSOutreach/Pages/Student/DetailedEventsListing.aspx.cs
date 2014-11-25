using StudentEntity.CrossPageInformation;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CSOutreach.Pages.Student
{

    //This page temporarily inherits System.Web.UI.page as against StudentBasePage
    public partial class DetailedEventsListing : Page
    {
        private CrossPageDetailedEventsListing CrossPageInfo;
        protected void Page_Load(object sender, EventArgs e)
        {

            Initialize();
        }


        private void Initialize()
        {
            if (!IsPostBack)
            {
                //Temporarily disabled for demo purpose
              //  CrossPageInfo = this.CrossPageInformation as CrossPageDetailedEventsListing;
                RenderPageData();
            }
           
        }

        private void RenderPageData()
        {
            RenderEventDetails();
        }

        private void RenderEventDetails()
        {
            DataTable EventListingsTable = new DataTable();
            EventListingsTable.Columns.Add("EventNo");
            EventListingsTable.Columns.Add("EventName");
            EventListingsTable.Columns.Add("EventDate");
            EventListingsTable.Columns.Add("EventTime");
            EventListingsTable.Columns.Add("EventVenue");
            for (int i = 1; i <= 20; ++i)
            {
                DataRow row = EventListingsTable.NewRow();
                row[0] = i.ToString();
                row[1] = "Sample Event "+i.ToString();
                row[2] = DateTime.Today.Date.ToString("MM-dd-yyyy");
                row[3] = DateTime.Now.ToString("H:mm");
                row[4] = "University of Texas at Dallas";
                EventListingsTable.Rows.Add(row);
            }
            EventDetailsRepeater.DataSource = EventListingsTable;
            EventDetailsRepeater.DataBind();
        }
    }
}