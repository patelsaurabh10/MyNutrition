﻿using System;
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
        
        protected void Page_Load(object sender, EventArgs e)
        {
            bmr = Convert.ToInt32(TextBox1.Text);
            BtnGain.Text = "To gian weight you need " + (bmr + 500);
            BtnMaintain.Text = "To maintain weight you need " + bmr;
            BtnLoose.Text = "To loose weight you need " + (bmr - 500);
        }

        protected void BtnLoose_Click(object sender, EventArgs e)
        {
            calorie = bmr - 500;
            PlanID = Plan.choosePlanID(calorie);
            Label1.Text = Convert.ToString(PlanID);
        }

        protected void BtnMaintain_Click(object sender, EventArgs e)
        {
            calorie = bmr;
            PlanID = Plan.choosePlanID(calorie);
            Label1.Text = Convert.ToString(PlanID);
        }

        protected void BtnGain_Click(object sender, EventArgs e)
        {
            calorie = bmr + 500;
            PlanID = Plan.choosePlanID(calorie);        
            Label1.Text = Convert.ToString(PlanID);
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}