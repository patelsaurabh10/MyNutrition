using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
            if (calorie < 1300)
            {
                PlanID = 1;
                
            }
            else if (calorie >= 1300 && calorie < 1500)
            {
                PlanID = 2;
                
            }
            else if (calorie >= 1500 && calorie < 1700)
            {
                PlanID = 3;
                
            }
            else if (calorie >= 1700 && calorie < 1900)
            {
                PlanID = 4;
            }
            else if (calorie >= 1900 && calorie < 2100)
            {
                PlanID = 5;
            }
            else if (calorie >= 2100 && calorie < 2300)
            {
                PlanID = 6;
            }
            else if (calorie >= 2300 && calorie < 2500)
            {
                PlanID = 7;
            }
            else if (calorie >= 2500 && calorie < 2700)
            {
                PlanID = 8;
            }
            else if (calorie >= 2700 && calorie < 2900)
            {
                PlanID = 9;
            }
            else if (calorie >= 2900)
            {
                PlanID = 10;
            }
            Label1.Text = Convert.ToString(PlanID);
        }

        protected void BtnMaintain_Click(object sender, EventArgs e)
        {
            calorie = bmr;
            if (calorie < 1300)
            {
                PlanID = 1;
            }
            else if (calorie >= 1300 && calorie < 1500)
            {
                PlanID = 2;
            }
            else if (calorie >= 1500 && calorie < 1700)
            {
                PlanID = 3;
                
                
            }
            else if (calorie >= 1700 && calorie < 1900)
            {
                PlanID = 4;
            }
            else if (calorie >= 1900 && calorie < 2100)
            {
                PlanID = 5;
            }
            else if (calorie >= 2100 && calorie < 2300)
            {
                PlanID = 6;
            }
            else if (calorie >= 2300 && calorie < 2500)
            {
                PlanID = 7;
            }
            else if (calorie >= 2500 && calorie < 2700)
            {
                PlanID = 8;
            }
            else if (calorie >= 2700 && calorie < 2900)
            {
                PlanID = 9;
            }
            else if (calorie >= 2900)
            {
                PlanID = 10;
            }
            Label1.Text = Convert.ToString(PlanID);
        }

        protected void BtnGain_Click(object sender, EventArgs e)
        {
            calorie = bmr + 500;
            if (calorie < 1300)
            {
                PlanID = 1;                
            }
            else if (calorie >= 1300 && calorie < 1500)
            {
                PlanID = 2;
            }
            else if (calorie >= 1500 && calorie < 1700)
            {
                PlanID = 3;
            }
            else if (calorie >= 1700 && calorie < 1900)
            {
                PlanID = 4;
            }
            else if (calorie >= 1900 && calorie < 2100)
            {
                PlanID = 5;
                
            }
            else if (calorie >= 2100 && calorie < 2300)
            {
                PlanID = 6;
            }
            else if (calorie >= 2300 && calorie < 2500)
            {
                PlanID = 7;
            }
            else if (calorie >= 2500 && calorie < 2700)
            {
                PlanID = 8;
            }
            else if (calorie >= 2700 && calorie < 2900)
            {
                PlanID = 9;
            }
            else if (calorie >= 2900)
            {
                PlanID = 10;
            }
            
            Label1.Text = Convert.ToString(PlanID);
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}