using DataOperations.DBEngine;
using DataOperations.DBEntity;
using DataOperations.DBEntityManager;
using System;
using System.Collections.Generic;
using System.Data.Objects;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CSOutreach.Pages.Student
{


    public partial class EventDetails : System.Web.UI.Page
    {
        private Event _event;
        private Event SelectedEvent
        {
            get
            {
                return _event;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int EventID = int.Parse(Request.QueryString["eventid"]);
                ObjectSet<Event> AllEvents = new StudentDBManager().AllEvents;
                bool EventFound=false;
               foreach(Event EventElement in AllEvents)
               {
                   if(EventElement.EventId==EventID)
                   {
                       EventFound = true;
                       _event = EventElement;
                       break;
                   }
               }
                if(!EventFound)
                {
                    throw new ApplicationException("Invalid Event Specified");
                }
                
                RenderPageElements();
            }


        }

        private void RenderPageElements()
        {
            LabelEventName.Text = SelectedEvent.Name;
            CourseName.Text = SelectedEvent.Course.CourseName;
            EventDescLabel.Text = SelectedEvent.Description;
            StartTimeLabel.Text = SelectedEvent.StartTime.ToString(@"hh\:mm");
            EndTimeLabel.Text = SelectedEvent.EndTime.ToString(@"hh\:mm");
            Date1.Text = SelectedEvent.StartDate.ToString("MM-dd-yyyy");
            Date2.Text = SelectedEvent.EndDate.ToString("MM-dd-yyyy");
        }

    }
}