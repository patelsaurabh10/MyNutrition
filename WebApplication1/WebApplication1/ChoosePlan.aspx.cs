using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.App_Code;

namespace WebApplication1
{
    public partial class ChoosePlan : System.Web.UI.Page
    {
        Plan plan = new Plan();
        double bmr;
        double calorie;
        int PlanID;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //  bmr = Convert.ToDouble(Request.QueryString["BMR"]) ;
               
                calorie = 0;
                PlanID = 0;
               
            }

            if (Request.QueryString["BMR"] != "0")
            {
                bmr = Convert.ToDouble(Request.QueryString["BMR"]);
            }
           
            BtnGain.Text = "To gian weight you need " + (bmr + 500);
            BtnMaintain.Text = "To maintain weight you need " + bmr;
            BtnLoose.Text = "To loose weight you need " + (bmr - 500);
            
          
        }

        protected void BtnLoose_Click(object sender, EventArgs e)
        {
            //the number 2000 will be replaced by Convert.ToDouble(Request.QueryString["BMR"]) 
            calorie = bmr - 500;
            PlanID = plan.choosePlanID(calorie);
            if (PlanID != 0)
            {
                Response.Redirect("~/viewProvidedPlans.aspx?PlanID=" + PlanID);
            }

        }

        protected void BtnMaintain_Click(object sender, EventArgs e)
        {
            calorie = bmr;
            PlanID = plan.choosePlanID(calorie);
            if (PlanID != 0)
            {
                Response.Redirect("~/viewProvidedPlans.aspx?PlanID=" + PlanID);
            }

        }

        protected void BtnGain_Click(object sender, EventArgs e)
        {
            calorie = bmr + 500;
            PlanID = plan.choosePlanID(calorie);
            if (PlanID != 0)
            {
                Response.Redirect("~/viewProvidedPlans.aspx?PlanID=" + PlanID);
            }

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnView_Click(object sender, EventArgs e)
        {
           
        }
    }
}