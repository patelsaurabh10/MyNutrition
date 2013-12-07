using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.App_Code;

namespace WebApplication1
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            String account = txbAccount.Text;
            String inputPassword = txbPassword.Text;

            if (CatalogAccess.authorizeCustomer(account, inputPassword))
            {
                Customer customer = dlCustomer.getCustomerByAccount(account);
                Session["CustomerID"] = customer.CustID;
                Response.Redirect("~/MainPage.aspx");
            }
        }
    }
}