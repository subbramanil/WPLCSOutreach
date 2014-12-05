using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using DataOperations.DBEntity;
using DataOperations.DBEntityManager;
using StudentEntity.CrossPageInformation;

namespace CSOutreach.Pages.Student
{
    public partial class EventRegistration : StudentBasePage
    {
        EventDBManager eventDBMgr = new EventDBManager();
        PersonDBManager personDBMgr = new PersonDBManager();
        StudentDBManager studentDBMgr = new StudentDBManager();
        StudentEventDBManager studEventDBMgr = new StudentEventDBManager();
        CrossPageEventRegistration crossEventData;
        Person loggedInStudent;
        DataOperations.DBEntity.Student student;
        Event selectedEvent;
        StudentEvent studentEvent;

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                Page.Title = "Event Registration";
                this.crossEventData = this.CrossPageInformation as CrossPageEventRegistration;
                
                studentEvent = new StudentEvent();

                // Get student details from session
                string username = (string)HttpContext.Current.Session[SessionVariable.USERNAME.ToString()];
                // Call DB to get the student details
                loggedInStudent = personDBMgr.GetUser(username);
                // Setup values in the screen

                if (loggedInStudent != null)
                {
                    FirstName.Value = loggedInStudent.FirstName;
                    LastName.Value = loggedInStudent.LastName;
                }                

                student = studentDBMgr.GetStudent(loggedInStudent.PersonId);

                if (student != null)
                {
                    EmergConName.Value = student.EmergencyName;
                    EmergConRelation.Value = student.EmergencyRelation;
                    EmergPhoneArea.Value = student.EmergencyNumber.Substring(0, 3);
                    EmergPhoneFirst.Value = student.EmergencyNumber.Substring(3, 3);
                    EmergPhoneSecond.Value = student.EmergencyNumber.Substring(6, 4);
                }

                // Get Selected Event details from DB
                //crossEventData.eventID = 20000;
                selectedEvent = eventDBMgr.GetSelectedEventDetails(20001);            
                if (selectedEvent != null)
                {
                    EventTitle.Text = selectedEvent.Name;
                    EventType.Text = selectedEvent.EventType.TypeName;
                    EventTime.Text = selectedEvent.StartDate.Add(selectedEvent.StartTime).ToString();
                   // EventDetails.Text = selectedEvent.Course.Description;                    
                }

                EventRegistration test = new EventRegistration();

                conflictsRepeater.DataSource = test.getEventConflicts(loggedInStudent.PersonId, selectedEvent);
                conflictsRepeater.DataBind();

                List<Event> eventsList = studEventDBMgr.GetStudentRegisteredEvent(loggedInStudent.PersonId);
                List<Event> preReqEventsList = test.getEventPrerequisites(loggedInStudent.PersonId, selectedEvent);
                preReqRepeater.DataSource = preReqEventsList;
                preReqRepeater.DataBind();

            }
            
        }

        
        private List<Event> getEventConflicts(int userID, Event selectedEvent)
        {

            List<Event> eventsList = studEventDBMgr.GetStudentRegisteredEvent(userID);
            List<Event> conflictEventsList = new List<Event>();

            DateTime selectedEventStart = selectedEvent.StartDate.Add(selectedEvent.StartTime);
            DateTime selectedEventEnd = selectedEvent.EndDate.Add(selectedEvent.EndTime);

            if (eventsList != null)
            {
                foreach (Event eventItem in eventsList) // Loop through List with foreach
                {
                    if ((selectedEvent.StartDate.CompareTo(eventItem.StartDate) >= 0) || (selectedEvent.EndDate.CompareTo(eventItem.EndDate) <= 0))
                    {
                        if((selectedEvent.StartTime.CompareTo(eventItem.StartTime) >=0) || (selectedEvent.EndTime.CompareTo(eventItem.EndTime) <= 0)){                            
                            conflictEventsList.Add(eventItem);
                        }                      
                    }               
                }
            }

            return conflictEventsList;
        }

        public List<Event> getEventPrerequisites(int userID, Event selectedEvent)
        {
            List<Event> eventsList = studEventDBMgr.GetEventPrereq(userID, selectedEvent);
            if (eventsList != null)
            {
                foreach (Event eventItem in eventsList) // Loop through List with foreach
                {
                    Console.WriteLine();
                    //Process if needed
                }
            }
            return eventsList;
        }


        protected void registerEvent(object sender, EventArgs e)
        {
            String statusMsg = "";
            // Get student details from session
            string username = (string)HttpContext.Current.Session[SessionVariable.USERNAME.ToString()];
            // Call DB to get the student details
            loggedInStudent = personDBMgr.GetUser(username);
            selectedEvent = eventDBMgr.GetSelectedEventDetails(20001);            
            studentEvent = new StudentEvent();
    
            if (loggedInStudent != null && selectedEvent != null)
            {
                studentEvent.StudentId = loggedInStudent.PersonId;
                studentEvent.EventId = selectedEvent.EventId;
                studentEvent.RegistrationDate = DateTime.Now;
                statusMsg = studEventDBMgr.registerEvent(studentEvent);
            }
            
            if (statusMsg.CompareTo("success")==0)
            {
                Console.WriteLine(); 
            }
            Response.Redirect("DefaultHome.aspx");
        }
    }
}