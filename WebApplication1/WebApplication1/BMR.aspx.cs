using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using WebApplication1.App_Code;

namespace WebApplication1
{
    public partial class BMR : System.Web.UI.Page
    {

        double BMRResult;
        Plan plan = new Plan();
        double calorie;
        int PlanID;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CustomerID"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }

            if (!IsPostBack)
            {
                calorie = 0;
                PlanID = 0;
                BMRResult = 0;
            }
            if (Convert.ToDouble(Request.QueryString["BMR"]) != 0)
            {
                BMRResult = Convert.ToDouble(Request.QueryString["BMR"]);
            }


        }

        protected void BMRCal_Click(object sender, EventArgs e)
        {


            Regex regex = new Regex("^[0-9]*$");
            double BMR = 0;
            double BMI = 0;
            if (txtAge.Text.Length == 0 || txtHeightcm.Text.Length == 0 || txtWeight.Text.Length == 0)
            {

                //   Response.Write("<script LANGUAGE='JavaScript' >alert('Please enter information')</script>");
                ClientScript.RegisterOnSubmitStatement(this.GetType(),
        "alert", "alert('Please enter information')");

            }
            else if (regex.IsMatch(txtAge.Text) == false || regex.IsMatch(txtHeightcm.Text) == false || regex.IsMatch(txtWeight.Text) == false)
            {

                //  Response.Write("<script LANGUAGE='JavaScript' >alert('Please input the valid information')</script>");
                ClientScript.RegisterOnSubmitStatement(this.GetType(),
       "alert", "alert('Please input the valid information')");
            }
                
               //BMI = ( Weight in Kilograms / ( Height in Meters x Height in Meters ) )

            else if (DropListGender.SelectedValue == "Female")
                {
                  BMR = 655 + (9.6 * Convert.ToDouble(txtWeight.Text)) + (1.8 * Convert.ToDouble(txtHeightcm.Text)) - (4.7 * Convert.ToDouble(txtAge.Text));
                }
               else if (DropListGender.SelectedValue == "Male")
                {
                    
                    BMR = 66 + (13.7 * Convert.ToDouble(txtWeight.Text)) + (5 * Convert.ToDouble(txtHeightcm.Text)) - (6.8 * Convert.ToDouble(txtAge.Text));
                }
            

                if (DropDownList3.SelectedValue == "No exercise")
                {
                    BMR = BMR * 1.2;
                }
                else if (DropDownList3.SelectedValue == "Light exercise (1-3 days per week)")
                {
                    BMR = BMR * 1.375;
                }
                else if (DropDownList3.SelectedValue == "Moderate exercise (3–5 days per week)")
                {
                    BMR = BMR * 1.55;
                }
                else if (DropDownList3.SelectedValue == "Heavy exercise (6–7 days per week)")
                {
                    BMR = BMR * 1.725;
                }
                else if (DropDownList3.SelectedValue == "Very heavy exercise (twice per day, extra heavy workouts)")
                {
                    BMR = BMR * 1.9;
                }
                BMR = Math.Round(BMR, 2);
                txtResult.Text = BMR.ToString();
                txtBMI.Text = getBMI().ToString();

            
       }
        protected double getBMI()
               //BMI = ( Weight in Kilograms / ( Height in Meters x Height in Meters ) )
        {
            double BMI = 0;
            double weight = Convert.ToDouble(txtWeight.Text);
            double height=Convert.ToDouble(txtHeightcm.Text)/100;
           // BMI = (Convert.ToDouble(txtWeight.Text)/((Convert.ToDouble(txtHeightcm.Text)*Convert.ToDouble(txtHeightcm.Text))/10000);
            BMI = weight / (height * height);
            if (BMI <= 18.5)
            {
                lblBMIResult.Text = "UderWeight";
            }
            else if (18.5 < BMI && BMI<= 24.9)
            {
                lblBMIResult.Text = "Normal Weight";
            }
            else if (BMI > 24.9 && BMI < 30)
            {
                lblBMIResult.Text = "OverWeight";
            }
            else if (BMI > 30)
            {
                lblBMIResult.Text = "Obesity";
            }
            return Math.Round(BMI,2);
        }
        

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            BMRResult = Convert.ToDouble(txtResult.Text);
            if (BMRResult != 0)
            {
                choosePlanPanel.Visible = true;
                BtnGain.Text = "To gian weight you need " + (BMRResult + 500);
                BtnMaintain.Text = "To maintain weight you need " + BMRResult;
                BtnLoose.Text = "To loose weight you need " + (BMRResult - 500);
                //Response.Redirect("~/ChoosePlan.aspx?BMR=" + BMRResult);
            }
        }

        protected void BtnMaintain_Click(object sender, EventArgs e)
        {
            calorie = Convert.ToDouble(txtResult.Text);
            PlanID = plan.choosePlanID(calorie);
            if (PlanID != 0)
            {
                Response.Redirect("~/viewProvidedPlans.aspx?PlanID=" + PlanID);
            }

        }

        protected void BtnGain_Click(object sender, EventArgs e)
        {
            calorie = Convert.ToDouble(txtResult.Text) + 500;
            PlanID = plan.choosePlanID(calorie);
            if (PlanID != 0)
            {
                Response.Redirect("~/viewProvidedPlans.aspx?PlanID=" + PlanID);
            }
        }

        protected void btnView_Click(object sender, EventArgs e)
        {

        }

        protected void BtnLoose_Click(object sender, EventArgs e)
        {
            calorie = Convert.ToDouble(txtResult.Text) - 500;
            PlanID = plan.choosePlanID(calorie);
            if (PlanID != 0)
            {
                Response.Redirect("~/viewProvidedPlans.aspx?PlanID=" + PlanID);
            }
        }
    }
}