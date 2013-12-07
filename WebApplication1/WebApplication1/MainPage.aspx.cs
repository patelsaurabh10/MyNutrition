using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.App_Code;

namespace WebApplication1
{
    public partial class reserved_by_neo : System.Web.UI.Page
    {
        List<int> planIDs = new List<int>();
        dlPlan dlP = new dlPlan();

        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["CustomerID"] = 2; 
            Customer customer = dlCustomer.getCustomerByCustID((Int32)Session["CustomerID"]);
            String custFirstName = customer.FirstName;
            String custLastName = customer.LastName;
            lblWelcome.Text = "Welcome back, Dear " + custFirstName + " " + custLastName + "!";


            if (!IsPostBack)
            {
                lblDailyTip.Text = CatalogAccess.getRondomDailyTip();
            }
        }

        protected void btnRMRCal_Click(object sender, EventArgs e)
        {
            if (Session["CustomerID"] != null)
            {
                Response.Redirect("~/BMR.aspx");
            }
        }

        protected void btnPlan_Click(object sender, EventArgs e)
        {
            planIDs = dlP.getCustomerPlanIDs((Int32)Session["CustomerID"]);
            if (planIDs.Count == 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(),
                "err_msg",
                "alert('Sorry, you do not have a plan yet, please create your own plan by starting with calculator your BMR');",
                true);
            }
            else
            {
                if (Session["CustomerID"] != null)
                {
                    Response.Redirect("~/ViewMyPlan.aspx");
                }
            }   
        }

        protected void btnDailyLog_Click(object sender, EventArgs e)
        {
            if (Session["CustomerID"] != null)
            {
                Response.Redirect("~/ViewDailyLog.aspx");
            }
        }

        protected void btnCalorieCounter_Click(object sender, EventArgs e)
        {
            if (Session["CustomerID"] != null)
            {
                Response.Redirect("~/CheckFoodCalories.aspx");
            }
        }

        protected void btnReport_Click(object sender, EventArgs e)
        {
            if (Session["CustomerID"] != null)
            {
                Response.Redirect("~/AnualReport.aspx");
            }
        }
    }
}