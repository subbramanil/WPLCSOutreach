using StudentEntity.CrossPageInformation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CSOutreach.Pages.Student
{
    public partial class DetailedEventsListing : StudentBasePage
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
                CrossPageInfo = this.CrossPageInformation as CrossPageDetailedEventsListing;
            }
        }
    }
}