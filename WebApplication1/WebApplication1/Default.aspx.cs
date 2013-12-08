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
            String account = null;
            String inputPassword = null;

            if (String.IsNullOrEmpty(txbAccount.Text))
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(),
                                "err_msg",
                                "alert('Account is empty!');",
                                true);
            }
            else if (String.IsNullOrEmpty(txbPassword.Text))
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(),
                                               "err_msg",
                                               "alert('Password is empty!');",
                                               true);

            }
            else
            {
                account = txbAccount.Text;
                inputPassword = txbPassword.Text;
                if (CatalogAccess.authorizeCustomer(account, inputPassword))
                {
                    Customer customer = dlCustomer.getCustomerByAccount(account);

                    Session["CustomerID"] = customer.CustID;
                    Response.Redirect("~/MainPage.aspx");
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(),
                 "err_msg",
                 "alert('Incorrect Password or Account!');",
                 true);
                }
            }



        }
    }
}