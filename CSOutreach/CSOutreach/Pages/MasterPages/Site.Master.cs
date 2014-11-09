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
            string MenuContent = MenuRender.DynamicMenu;

            return MenuContent;
        }

        protected string getLoginButtonText()
        {
            if (Session["username"] != null){
                return "Log Out";
            }
            return "Log In";
        }

        protected void login_ServerClick(object sender, EventArgs e){
            //TODO: Add real code (or redirect) to log in or log out as appropriate.
            if (Session["username"] == null)
            {
                Session["username"] = "user";
            }
            else
            {
                Session["username"] = null;
            }
        }
    }
}