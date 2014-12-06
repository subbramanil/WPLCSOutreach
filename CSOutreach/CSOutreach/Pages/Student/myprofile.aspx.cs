using DataOperations.DBEntity;
using DataOperations.DBEntityManager;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.ModelBinding;
using DataOperations.DBEntity;
using DataOperations.DBEntityManager;

namespace CSOutreach.Pages.Student
{
    public partial class myprofile : System.Web.UI.Page
    {
        PersonDBManager personDBMgr = new PersonDBManager();
        protected void Page_Load(object sender, EventArgs e)
        {
           // HtmlGenericControl divsuccess = Master.FindControl("BodyContent").FindControl("divsuccess") as HtmlGenericControl;
           // if (divsuccess != null)
              //  divsuccess.Style["display"] = "none";
            //HtmlGenericControl diverror = Master.FindControl("BodyContent").FindControl("diverror") as HtmlGenericControl;
         //   if (diverror != null)
             //   diverror.Style["display"] = "none";
            try
            {
                List<Person> personelist = new List<Person>();
                using (DBCSEntities entity = new DBCSEntities())
                {
                    string userName = CSOutreach.Authentication.Username;
                    Person person = personDBMgr.GetUser(userName);
                    //Person person = personDBMgr.getStudent(username);
                    //var query = from person in entity.People
                    //            where person.Email == userName
                    //            select new { firstname = person.FirstName, lastname = person.LastName, contactnum = person.ContactNumber, email=person.Email, password=person.Password, address=person.Address};
                    First_Name.Value = person.FirstName;
                    Last_Name.Value = person.LastName;

                    HtmlTextArea addressText = Master.FindControl("BodyContent").FindControl("Address") as HtmlTextArea;
                    addressText.Value = person.Address;
                    Contact_Number.Value = person.ContactNumber;
                    Password.Value = person.Password;
                    HtmlInputPassword passwordconfirm = Master.FindControl("BodyContent").FindControl("Cpassword") as HtmlInputPassword;
                    passwordconfirm.Value = person.Password;

                }




            }
            catch (Exception ex)
            {
            }
        }          


      

       protected void Button1_Click(object sender, EventArgs e)
        {
            
        }
    }
}