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
        int bmr = 0;
        double calorie = 0;
        int PlanID = 0;
        Plan plan = new Plan();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            bmr = 0;
            BtnGain.Text = "To gian weight you need " + (bmr + 500);
            BtnMaintain.Text = "To maintain weight you need " + bmr;
            BtnLoose.Text = "To loose weight you need " + (bmr - 500);
        }

        protected void BtnLoose_Click(object sender, EventArgs e)
        {
            calorie = bmr - 500;
            PlanID = plan.choosePlanID(calorie);
            
        }

        protected void BtnMaintain_Click(object sender, EventArgs e)
        {
            calorie = bmr;
            PlanID = plan.choosePlanID(calorie);
            
        }

        protected void BtnGain_Click(object sender, EventArgs e)
        {
            calorie = bmr + 500;
            PlanID = plan.choosePlanID(calorie);        
           
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}