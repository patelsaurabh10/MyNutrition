using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.App_Code;

namespace WebApplication1
{
    public partial class ViewMyPlan : System.Web.UI.Page
    {
        int custID, planID = 0;
        List<String> planDescs = new List<String>();
        List<int> planIDs = new List<int>();
        String message = null;
        dlPlan dlP = new dlPlan();
        protected void Page_Load(object sender, EventArgs e)
        {


            if (Session["CustomerID"] != null)
            {
                custID = (int)Session["CustomerID"];
            }

            planIDs = dlP.getCustomerPlanIDs(custID);

            foreach (int planIDa in planIDs)
            {
                String planDesc = CatalogAccess.getPlanDesc(planIDa);
                planDescs.Add(planDesc);
            }
            if (planDescs.Count >= 1)
            {
                if (!String.IsNullOrEmpty(planDescs[0]))
                {
                    Button1.Visible = true;
                    Button1.Text = "Plan: " + planDescs[0];
                }
            }
            if (planDescs.Count >= 2)
            {
                if (!String.IsNullOrEmpty(planDescs[1]))
                {
                    Button2.Visible = true;
                    Button2.Text = "Plan: " + planDescs[1];
                }

            } if (planDescs.Count >= 3)
            {
                if (!String.IsNullOrEmpty(planDescs[2]))
                {
                    Button3.Visible = true;
                    Button3.Text = "Plan: " + planDescs[2];
                }

            }
            if (!IsPostBack)
            {
                //  planID = 0 means no plan is tracked for this Customer
                planID = CatalogAccess.getTrackedPlanByCustID((int)Session["CustomerID"]);
                ddlCustomer.DataTextField = "Text";
                ddlCustomer.DataValueField = "Value";
                ddlCustomer.DataSource = CatalogAccess.GetCustomers();

                ddlCustomer.DataBind();
            }
            if (Request.QueryString["PlanID"] != null && Request.QueryString["PlanID"] != "0")
            {
                planID = Convert.ToInt32(Request.QueryString["PlanID"]);
            }

            GridView1.DataSource = CatalogAccess.GetCastomerPlans(planID.ToString());
            GridView1.DataBind();

        }

        protected void ddlCustomer_SelectedIndexChanged(object sender, EventArgs e)
        {
            // int planID = CatalogAccess.GetCustomerPlanID(ddlCustomer.SelectedValue);

        }

        protected void btnDeletePlan_Click(object sender, EventArgs e)
        {
            //never delete system plan
            if (planID > 10)
            {
                message = CatalogAccess.deleteCustomerPlan(planID, custID);
                if (message.StartsWith("Effeced"))
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(),
           "err_msg",
           "alert('your plan" + planID + " has been deleted!');",
           true);
                else
                {
                    Response.Write("<script>alert('" + message + "');</script>");

                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(),
                             "err_msg",
                             message,
                             true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(),
       "err_msg",
       "alert('Plan ID must be more than 10!');",
       true);
            }

        }

        protected void btnTrack_Click(object sender, EventArgs e)
        {

            dlPlan opln = new dlPlan();
            bool flag = opln.trackDietPlan(planID);
            if (flag == true)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(),
                    "err_msg",
                    "alert('your plan has been tracked!');",
                    true);
                lbltest.Text = "your plan has been tracked!";
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(),
                   "err_msg",
                   "alert('You can't track more plan, becuase it has already tracked before');",
                   true);
                lbltest.Text = "You can't track more plan, becuase it has already tracked before";
            }


        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            Response.Redirect("~/viewMyPlan.aspx?PlanID=" + planIDs[0]);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/viewMyPlan.aspx?PlanID=" + planIDs[1]);
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/viewMyPlan.aspx?PlanID=" + planIDs[2]);
        }
    }

    public class Plans
    {
        public string Day { get; set; }
        public string MealType { get; set; }
        public string Quantity { get; set; }
        public string Weight { get; set; }
        public string FoodName { get; set; }
        public string FoodCalorie { get; set; }
        public string FoodCategory { get; set; }
    }
}