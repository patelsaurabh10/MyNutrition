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
        int custID = 0;
        String message = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["CustID"] = 2; // be replaced after deploy
            if (Session["CustID"] != null)
            {
                custID = (int)Session["CustID"];
            }

            if (!IsPostBack)
            {

                ddlCustomer.DataTextField = "Text";
                ddlCustomer.DataValueField = "Value";
                ddlCustomer.DataSource = CatalogAccess.GetCustomers();
                
                ddlCustomer.DataBind();
            }
        }

        protected void ddlCustomer_SelectedIndexChanged(object sender, EventArgs e)
        {
            int planID = CatalogAccess.GetCustomerPlanID(ddlCustomer.SelectedValue);
            GridView1.DataSource = CatalogAccess.GetCastomerPlans(planID.ToString());
            GridView1.DataBind();
        }

        protected void btnDeletePlan_Click(object sender, EventArgs e)
        {

            int planID = Convert.ToInt32(txbPlanID.Text);//be replaced after deploy
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
                    Response.Write("<script>alert('" + message+ "');</script>");

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
            int planID = Convert.ToInt32(txbPlanID.Text);
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