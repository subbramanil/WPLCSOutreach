using CSOutreach.UI;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CSOutreach
{
    public partial class Site : System.Web.UI.MasterPage
    {

        

        // Child Pages should set AuthenticationRequired and AuthenticationRole in Page_PreInit
        private bool auth = false;
        public bool AuthenticationRequired { get { return auth; }  set { auth = value; } }

        private Authentication.Role role = Authentication.Role.ANONYMOUS;
        public Authentication.Role Role { get { return role; } set { role = value; } }

        public bool LoggedIn { get { return Authentication.Authenticated; } }
        public string Username
        {
            get
            {
                if (Authentication.Authenticated)
                {
                    return Authentication.Username;
                }
                return "";
            }
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            if (AuthenticationRequired) {
                if (!Authentication.Authenticated 
                    || !Authentication.hasRequiredRole(this.Role))
                {
                    // Save current page to optionally return once log in is completed.
                    Session["return_to_page"] = Request.Url.ToString();
                    Response.Redirect(ResolveClientUrl("~/Pages/Common/Default.aspx"));
                };
            }
        }
        
        protected void Page_Load(object sender, EventArgs e)
        {

           if(! Page.IsPostBack)
           {
               InitPage();
           }
        }

        private void InitPage()
        {
            getDynamicMenuContent();
        }
        protected string getDynamicMenuContent()
        {
           // TODO: Replace this dummy content with html of the same format generated dynamically from the database.
            //string MenuContent = MenuRender.DynamicMenu;

           // return MenuContent;
            return string.Empty;
        }

        protected void login_ServerClick(object sender, EventArgs e){
            //TODO: Add real code (or redirect) to log in or log out as appropriate.
            Authentication.login(inputUsername.Value, inputPassword.Value);
            Response.Redirect(Request.Url.ToString()); // Force full page reload
        }

        protected void logoutButton_ServerClick(object sender, EventArgs e)
        {
            // TODO: add real code to sign out
            Authentication.logout();
            Response.Redirect(Request.Url.ToString()); // Force full page reload
        }
    }
}