using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;
using System.Data.SqlClient;
using WebApplication1.App_Code;

namespace WebApplication1
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        string planDesc = null;
        int PlanID = 0, CustID = 0;
        dlPlan dlPlan = new dlPlan();
        dlCustomer dlCustomer = new dlCustomer();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CustomerID"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }

            if (Request.QueryString["PlanID"] != "0")
            {
                PlanID = Convert.ToInt32(Request.QueryString["PlanID"]);
            }
            if (Session["CustomerID"] != null)
            {
                CustID = (int)Session["CustomerID"];
            }

            planDesc = CatalogAccess.getPlanDesc(PlanID);
            lblPlanDesc.Text = planDesc;

            lblMonSumCalorie.Text = Convert.ToString(Math.Round(CatalogAccess.getGridViewSumCalorie(GridViewMonBreak) + CatalogAccess.getGridViewSumCalorie(GridViewMonLunch) + CatalogAccess.getGridViewSumCalorie(GridViewMonDinner) + CatalogAccess.getGridViewSumCalorie(GridViewMonSnack1) + CatalogAccess.getGridViewSumCalorie(GridViewMonSnack2),2));
            lblTueSumCalorie.Text = Convert.ToString(Math.Round(CatalogAccess.getGridViewSumCalorie(GridViewTueBreak) + CatalogAccess.getGridViewSumCalorie(GridViewTueLunch) + CatalogAccess.getGridViewSumCalorie(GridViewTueDinner) + CatalogAccess.getGridViewSumCalorie(GridViewTueSnack1) + CatalogAccess.getGridViewSumCalorie(GridViewTueSnack2),2));
            lblWesSumCalorie.Text = Convert.ToString(Math.Round(CatalogAccess.getGridViewSumCalorie(GridViewWedBreak) + CatalogAccess.getGridViewSumCalorie(GridViewWedLunch) + CatalogAccess.getGridViewSumCalorie(GridViewWedDinner) + CatalogAccess.getGridViewSumCalorie(GridViewWedSnack1) + CatalogAccess.getGridViewSumCalorie(GridViewWedSnack2),2));
            lblThurSumCalorie.Text = Convert.ToString(Math.Round(CatalogAccess.getGridViewSumCalorie(GridViewThurBreak) + CatalogAccess.getGridViewSumCalorie(GridViewThurLunch) + CatalogAccess.getGridViewSumCalorie(GridViewThurDinner) + CatalogAccess.getGridViewSumCalorie(GridViewThurSnack1) + CatalogAccess.getGridViewSumCalorie(GridViewThurSnack2),2));
            lblFriSumCalorie.Text = Convert.ToString(Math.Round(CatalogAccess.getGridViewSumCalorie(GridViewFriBreak) + CatalogAccess.getGridViewSumCalorie(GridViewFriLunch) + CatalogAccess.getGridViewSumCalorie(GridViewFriDinner) + CatalogAccess.getGridViewSumCalorie(GridViewFriSnack1) + CatalogAccess.getGridViewSumCalorie(GridViewFriSnack2),2));
            lblSatSumCalorie.Text = Convert.ToString(Math.Round(CatalogAccess.getGridViewSumCalorie(GridViewSatBreak) + CatalogAccess.getGridViewSumCalorie(GridViewSatLunch) + CatalogAccess.getGridViewSumCalorie(GridViewSatDinner) + CatalogAccess.getGridViewSumCalorie(GridViewSatSnack1) + CatalogAccess.getGridViewSumCalorie(GridViewSatSnack2),2));
            lblSunSumCalorie.Text = Convert.ToString(Math.Round(CatalogAccess.getGridViewSumCalorie(GridViewSunBreak) + CatalogAccess.getGridViewSumCalorie(GridViewSunLunch) + CatalogAccess.getGridViewSumCalorie(GridViewSunDinner) + CatalogAccess.getGridViewSumCalorie(GridViewSunSnack1) + CatalogAccess.getGridViewSumCalorie(GridViewSunSnack2), 2));
        }
       
        protected void Button1_Click(object sender, EventArgs e)
        {
              Response.Redirect("~/BMR.aspx");    
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnCopy_Click(object sender, EventArgs e)
        {
            int planNumber = dlPlan.getPlanNumberByCustomerID(CustID);
            Customer customer = dlCustomer.getCustomerByCustID(CustID);
            String custFirstName = customer.FirstName;
            String custLastName = customer.LastName;
            String planName = txbPlanName.Text;
            if (String.IsNullOrEmpty(planName))
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(),
                        "err_msg",
                        "alert('Please give a name to your plan!');",
                        true);
            }
            else
            {

                //The maximun Plan number per customer is 3
                if (planNumber >= 3)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(),
             "err_msg",
             "alert('Sorry, you can only have at most 3 plans!');",
             true);
                }
                else
                {
                    int rowEffected = CatalogAccess.convertSystemPlanToUserPlan(PlanID, CustID, planName);

                    if (rowEffected > 0)
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(),
            "err_msg",
            "alert('Congratulations! your plan has been successfully generated!');",
            true);
                        lblCopyResult.Text = "Congratulations!" + custFirstName + " " + custLastName + ", " + planName + " has been successfully generated!";
                        PlaceHolder1.Visible = true;
                    }
                }
            }

        }

        protected void btnConvertPlan_Click(object sender, EventArgs e)
        {
            lblPlanName.Visible = true;
            txbPlanName.Visible = true;
            btnCopy.Visible = true;
        }

        protected void btnManagePlan_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ViewMyPlan.aspx"); 
        }

    }
}