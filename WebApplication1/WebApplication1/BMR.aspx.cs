using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace WebApplication1
{
    public partial class BMR : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

         protected void BMRCal_Click(object sender, EventArgs e)
         {
             double BMR = 0;
             Regex regex = new Regex("^[0-9]*$");
            
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
            else
            {
                if (DropListGender.SelectedValue=="Female")
                {
                   txtResult.Text = (655 + (4.35 * Convert.ToDouble(txtWeight.Text)) + (4.7 * Convert.ToDouble(txtHeightcm.Text)) - (4.7 * Convert.ToDouble(txtAge.Text))).ToString();
                   BMR = Convert.ToDouble(txtResult.Text);
                }
                if (DropListGender.SelectedValue == "Male")
                {
                    txtResult.Text = (66 + (6.23 * Convert.ToDouble(txtWeight.Text)) + (12.7 * Convert.ToDouble(txtHeightcm.Text)) - (6.8 * Convert.ToDouble(txtAge.Text))).ToString();
                    BMR = Convert.ToDouble(txtResult.Text);
                }
            }
            
        }
    }
}