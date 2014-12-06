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
                       if (!IsPostBack)
            {
                //To hide the success and error messages initially
                //HtmlGenericControl divsuccess = Master.FindControl("BodyContent").FindControl("divsuccess") as HtmlGenericControl;
                if (divsuccess != null)
                    divsuccess.Style["display"] = "none";
                //HtmlGenericControl diverror = Master.FindControl("BodyContent").FindControl("diverror") as HtmlGenericControl;
                if (diverror != null)
                    diverror.Style["display"] = "none";


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
                    Address.Value = person.Address;
                    Contact_Number.Value = person.ContactNumber;
                    Email.Value = person.Email;
                    Email.Disabled = true;

                    Password.Value = person.Password;
                    CPassword.Value = person.Password;

                }


            

            }
            catch (Exception ex)
            {
            }
        }



        }

        protected void ClearValues()
        {
            //Clear all the textboxes.
            foreach (Control ctrl in Master.FindControl("BodyContent").Controls)
            {
                if (ctrl.GetType().Name == "HtmlInputText")
                {
                    ((HtmlInputText)ctrl).Value = string.Empty;
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            PersonDBManager persondb = new PersonDBManager();
 
                Person signed_user = new Person();
                signed_user.FirstName = First_Name.Value;
                signed_user.LastName = Last_Name.Value.Trim();
                signed_user.Address = Address.Value.Trim();
                signed_user.Email = Email.Value.Trim();
                signed_user.ContactNumber = Contact_Number.Value.Trim();
                signed_user.Password = Password.Value;

                bool result = persondb.AddNewUserDetails(signed_user);
                if (result == true)
                {
                    if (divsuccess != null)
                        divsuccess.Style["display"] = "block";
                }
                else
                {
                    if (diverror != null)
                        diverror.Style["display"] = "block";
                }
                            
            }

        }
    }

