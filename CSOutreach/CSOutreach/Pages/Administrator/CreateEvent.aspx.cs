using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
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
            if (IsPostBack)
                return;

            //persondbmanager user = new persondbmanager();
            //string password = user.encrypt("abc");
            //console.writeline(password);

            //To hide the success and error messages initially
            ContentPlaceHolder cp = this.Master.Master.FindControl("BodyContent") as ContentPlaceHolder;
            HtmlGenericControl divsuccess = cp.FindControl("AdminContent").FindControl("divsuccess") as HtmlGenericControl;
            if (divsuccess != null)
                divsuccess.Style["display"] = "none";
            ContentPlaceHolder ce = this.Master.Master.FindControl("BodyContent") as ContentPlaceHolder;
            HtmlGenericControl diverror = ce.FindControl("AdminContent").FindControl("diverror") as HtmlGenericControl;
            if (diverror != null)
                diverror.Style["display"] = "none";
          

            List<EventType> eventTypes = db.GetEventTypes();
            ListItem lst = new ListItem("---SELECT---", "9999");
            drpEventType.Items.Add(lst);
            drpEventType.AppendDataBoundItems = true;
            drpEventType.DataSource = eventTypes;
            drpEventType.DataBind();
            lst = new ListItem("OTHER", "0");
            drpEventType.Items.Add(lst);



            lst = new ListItem("---SELECT---", "9999");
            drpCourseType.Items.Add(lst);
            drpCourseType.AppendDataBoundItems = true;
            List<Course> courseTypes = db.GetCourseTypes();
            drpCourseType.DataSource = courseTypes;
            drpCourseType.DataBind();

            List<String> availInstructors = db.GetAvailableInstructors();
            lstInstructor.DataSource = availInstructors;
            lstInstructor.DataBind();


        }
        bool flag = false;
        protected void btnCreateEvent_Click(object sender, EventArgs e)
        {
            try
            {

                using (DBCSEntities entity = new DBCSEntities())
                {
                    Event even = new Event();
                    
                    even.Name = txtEventName.Text;
                    if (!txtDescription.Text.Equals(""))
                    {
                        even.Description = txtDescription.Text;
                    }
                    if (!txtLocation.Text.Equals(""))
                    {
                        even.Location = txtLocation.Text;
                    }

                    String eventType = drpEventType.SelectedItem.ToString();
                    even.EventTypeId = (from per in entity.EventTypes
                        where per.TypeName == eventType
                        select per.EventTypeId).FirstOrDefault();


                    String courseType = drpCourseType.Text;
                    even.CourseId = (from per in entity.Courses
                        where per.CourseName == courseType
                        select per.CourseId).FirstOrDefault();

                    even.StartDate = Convert.ToDateTime(startDate.Text);
                    even.EndDate = Convert.ToDateTime(endDate.Text);
                    even.StartTime = DateTime.Parse(starttime.Text).TimeOfDay;
                    even.EndTime = DateTime.Parse(endtime.Text).TimeOfDay;


                    even.CreatedDate = DateTime.Today;

                    string userName = CSOutreach.Authentication.Username;
                    even.CreatedBy = (from per in entity.People
                        where per.Email == userName
                        select per.PersonId).FirstOrDefault();
                    //even.CreatedBy = userName
                    entity.AddToEvents(even);
                    entity.SaveChanges();
                    int eventid=even.EventId;
                    foreach (var item in lstSelectedInstructors.Items)
                    {
                        db.InsertEventInstructor(item.ToString(), even.StartDate,eventid);
                        // Console.WriteLine(item.ToString());
                    }
                    flag = true;
                    if (flag)
                    {
                        ContentPlaceHolder cp = this.Master.Master.FindControl("BodyContent") as ContentPlaceHolder;
                        HtmlGenericControl divsuccess = cp.FindControl("AdminContent").FindControl("divsuccess") as HtmlGenericControl;
                        if (divsuccess != null)
                            divsuccess.Style["display"] = "block";
                    }
                }
            }

            catch (Exception k)
            {
                Console.WriteLine(k.ToString());
                ContentPlaceHolder ce = this.Master.Master.FindControl("BodyContent") as ContentPlaceHolder;
                HtmlGenericControl diverror = ce.FindControl("AdminContent").FindControl("diverror") as HtmlGenericControl;
                if (diverror != null)
                    diverror.Style["display"] = "block";
            }
        }

        protected void btnAddInstructor_Click(object sender, EventArgs e)
        {

            List<ListItem> selectedValues = (from item in lstInstructor.Items.Cast<ListItem>()
                                                 where item.Selected
                                                 select item).ToList();
            foreach (ListItem value in selectedValues) {
                lstSelectedInstructors.Items.Add(value);
                lstInstructor.Items.Remove(value);
            
            }
        }

        protected void btnRemoveInstructor_Click(object sender, EventArgs e)
        {
            List<ListItem> selectedValues = (from item in lstSelectedInstructors.Items.Cast<ListItem>()
                                             where item.Selected
                                             select item).ToList();
            foreach (ListItem value in selectedValues)
            {
                lstSelectedInstructors.Items.Remove(value);
                lstInstructor.Items.Add(value);

            }
        }



     

    


    }
    
    }
