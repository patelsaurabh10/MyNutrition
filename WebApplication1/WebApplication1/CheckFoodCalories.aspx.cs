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
    public partial class WebForm1 : System.Web.UI.Page
    {
        double unit = 0;
        decimal calorie = 0;
        double quantity = 0;
        double totalCalorie = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            calorie = CatalogAccess.getFoodCalorie(ddlFoodName.Text);
            unit = CatalogAccess.getFoodUnit(ddlFoodName.Text);
            
        }
        protected void ddlFoodName_SelectedIndexChanged(object sender, EventArgs e)
        {

            calorie = CatalogAccess.getFoodCalorie(ddlFoodName.Text);
            unit = CatalogAccess.getFoodUnit(ddlFoodName.Text);
            if (unit == 1)
            {
                rbtnWeight.Checked = false;
                rbtnQuantity.Checked = true;
                ddlUnit.Visible = false;
            }
            else if (unit != 1)
            {
                rbtnQuantity.Checked = false;
                rbtnWeight.Checked = true;
                ddlUnit.Visible = true;
            }
        }

        protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void btnCheck_Click(object sender, EventArgs e)
        {


            if (unit == 1)
            {
                rbtnWeight.Checked = false;
                rbtnQuantity.Checked = true;
                ddlUnit.Visible = false;
            }
            else if (unit != 1)
            {
                rbtnQuantity.Checked = false;
                rbtnWeight.Checked = true;
                ddlUnit.Visible = true;
            }
            //This is for food unit as number
            //The default food unit as number is 1 in database
            if (rbtnQuantity.Checked)
            {
                if (!String.IsNullOrEmpty(tbxQuantity.Text) && double.TryParse(tbxQuantity.Text, out quantity))
                {
                    totalCalorie = (double)calorie * quantity;
                    lblQuantityResult.Text = tbxQuantity.Text;
                }
            }
            //This is for food unit as 'g' or 'oz'
            //The default unit in database is 'g'
            else if (rbtnWeight.Checked)
            {
                if (!String.IsNullOrEmpty(tbxQuantity.Text) && double.TryParse(tbxQuantity.Text, out quantity))
                {
                    lblQuantityResult.Text = tbxQuantity.Text + ddlUnit.Text;
                    if (ddlUnit.Text == "g")
                    {
                      
                    }
                    else if (ddlUnit.Text == "oz")
                    {
                        quantity = quantity* 28.3495;
                    }
                    totalCalorie = (double)calorie * quantity / unit;
                }
            }

            lblCalories.Text = Convert.ToString(totalCalorie);
            lblFoodName.Text = ddlFoodName.Text;
        }
        protected void ddlFoodCategory_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void tbxQuantity_TextChanged(object sender, EventArgs e)
        {
            unit = CatalogAccess.getFoodUnit(ddlFoodName.Text);
            if (unit == 1)
            {
                rbtnWeight.Checked = false;
                rbtnQuantity.Checked = true;
                ddlUnit.Visible = false;
            }
            else if (unit != 1)
            {
                rbtnQuantity.Checked = false;
                rbtnWeight.Checked = true;
                ddlUnit.Visible = true;
            }
        }


    }
}