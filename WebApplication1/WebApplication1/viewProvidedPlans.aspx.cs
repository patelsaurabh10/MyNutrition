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
            //delete the below line when deploy
            Session["CustID"] = 2;

            if (Request.QueryString["PlanID"] != "0")
            {
                PlanID = Convert.ToInt32(Request.QueryString["PlanID"]);
            }
            if (Session["CustID"] != null)
            {
                CustID = (int)Session["CustID"];
            }

            planDesc = CatalogAccess.getPlanDesc(PlanID);
            lblPlanDesc.Text = planDesc;

            lblMonSumCalorie.Text = Convert.ToString(CatalogAccess.getGridViewSumCalorie(GridViewMonBreak) + CatalogAccess.getGridViewSumCalorie(GridViewMonLunch) + CatalogAccess.getGridViewSumCalorie(GridViewMonDinner));
            lblTueSumCalorie.Text = Convert.ToString(CatalogAccess.getGridViewSumCalorie(GridViewTueBreak) + CatalogAccess.getGridViewSumCalorie(GridViewTueLunch) + CatalogAccess.getGridViewSumCalorie(GridViewTueDinner));
            lblWesSumCalorie.Text = Convert.ToString(CatalogAccess.getGridViewSumCalorie(GridViewWedBreak) + CatalogAccess.getGridViewSumCalorie(GridViewWedLunch) + CatalogAccess.getGridViewSumCalorie(GridViewWedDinner));
            lblThurSumCalorie.Text = Convert.ToString(CatalogAccess.getGridViewSumCalorie(GridViewThurBreak) + CatalogAccess.getGridViewSumCalorie(GridViewThurLunch) + CatalogAccess.getGridViewSumCalorie(GridViewThurDinner));
            lblFriSumCalorie.Text = Convert.ToString(CatalogAccess.getGridViewSumCalorie(GridViewFriBreak) + CatalogAccess.getGridViewSumCalorie(GridViewFriLunch) + CatalogAccess.getGridViewSumCalorie(GridViewFriDinner));
            lblSatSumCalorie.Text = Convert.ToString(CatalogAccess.getGridViewSumCalorie(GridViewSatBreak) + CatalogAccess.getGridViewSumCalorie(GridViewSatLunch) + CatalogAccess.getGridViewSumCalorie(GridViewSatDinner));
            lblSunSumCalorie.Text = Convert.ToString(CatalogAccess.getGridViewSumCalorie(GridViewSunBreak) + CatalogAccess.getGridViewSumCalorie(GridViewSunLunch) + CatalogAccess.getGridViewSumCalorie(GridViewSunDinner));
        }
        //for button btnView clicked
        protected void Button1_Click(object sender, EventArgs e)
        {


            //if (PlanID != 0)
            //{
            //    Response.Redirect("~/ChoosePlan.aspx?PlanID=" + PlanID);
            //}
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
                int rowEffected = CatalogAccess.convertSystemPlanToUserPlan(PlanID, CustID,planName);

                if (rowEffected > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(),
        "err_msg",
        "alert('Congratulations! your plan has been successfully generated!');",
        true);
                    lblCopyResult.Text = "Congratulations!" + custFirstName+" " + custLastName + ", " + planName+ " has been successfully generated!";
                }
            }

        }

        protected void btnConvertPlan_Click(object sender, EventArgs e)
        {
            lblPlanName.Visible = true;
            txbPlanName.Visible = true;
            btnCopy.Visible = true;
        }

    }
}