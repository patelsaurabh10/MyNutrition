using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class BMR : System.Web.UI.Page
    {
      
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BMRCal_Click(object sender, EventArgs e)
        {
            if (DropListGender.SelectedValue == "Female")
            {
                txtResult.Text = (655 + (4.35 *Convert.ToDouble(txtWeight.Text)) + (4.7 * Convert.ToDouble(txtHeightcm.Text)) - (4.7 * Convert.ToDouble(txtAge.Text))).ToString();
            }
            if (DropListGender.SelectedValue == "Male")
            {
                txtResult.Text = (66 + (6.23 * Convert.ToDouble(txtWeight.Text)) + (12.7 * Convert.ToDouble(txtHeightcm.Text)) - (6.8 * Convert.ToDouble(txtAge.Text))).ToString();
            }
        }

        protected void txtResult_TextChanged(object sender, EventArgs e)
        {

        }
    }
}