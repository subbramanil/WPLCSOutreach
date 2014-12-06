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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        static string hashvaluepassword, emailId;
        protected void btn_update_Click(object sender, EventArgs e)
        {
            
            int up = 0;
            PersonDBManager personDBMgr = new PersonDBManager();
            try
            {
                List<Person> personelist = new List<Person>();
                using (DBCSEntities entity = new DBCSEntities())
                {
                    string userName = CSOutreach.Authentication.Username;
                    Person person = personDBMgr.GetUser(userName);
                    hashvaluepassword = person.Password;
                    emailId = person.Email;
                    //Password.Value = person.Password;
                    //CPassword.Value = person.Password;

                }
            }
            catch (Exception ex)
            {
            }

            if (personDBMgr.Encrypt(txt_cpassword.Text) == hashvaluepassword)
            {
                    up = 1;
            }
            if (up == 1)
            {
                
                
                Person password_user = new Person();
                password_user.Password = txt_npassword.Text;
                password_user.Email = emailId;
                bool result = personDBMgr.UpdateUserPassword(password_user);
                if (result == true)
                {
                    lbl_msg.Text = "Password changed Successfully";
                }
            }
            else
            {
                lbl_msg.Text = "Please enter correct Current password";
            }
        }
    }
}