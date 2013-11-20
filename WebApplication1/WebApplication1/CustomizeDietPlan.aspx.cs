using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Configuration;
using System.Collections;
using WebApplication1.App_Code;
using System.Data.SqlClient;
using System.Data.OleDb;

namespace WebApplication1
{
    public partial class CustomizeDietPlan : System.Web.UI.Page
    {
        //DataTable MealDetail = null;
        String FoodName = null;
        int MealID = 0;
        String Day = null;
        String MealType = null;
        int FoodID = 0;
        int PlanID = 0;

        double unit = 0;
        decimal calorie = 0;
        double quantity=0;
        double weight=0;

        double mealCalorie = 0;
        double dailyCalorie = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["PlanID"] = 1;
            PlanID = (int)Session["PlanID"];
            

            if (!IsPostBack)
            {
                DropDownList1.Text = Request.QueryString["Day"];
                DropDownList2.Text = Request.QueryString["MealType"];
                lblAddDisplay.Text = "";
                lblDeleteResult.Text = "";
                Table3.Visible = false;
                Table4.Visible = false;

                
            }
        }

       /* protected void Button1_Click(object sender, EventArgs e)
        {
            MealDetail = CatalogAccess.getMealDetail(PlanID, "Monday", "Breakfast");
        }*/

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
           

        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            FoodName = DropDownList3.Text;
            Day = DropDownList1.Text;
            MealType = DropDownList2.Text;
            PlanID = (int)Session["PlanID"];
            if (FoodName == null)
            {
                lblDeleteResult.Text = "Please select an item to delete";
            }
            MealID = CatalogAccess.getMealID(Day,MealType,PlanID);


           int a = CatalogAccess.deleteFoodInMeal(FoodName, MealID);
           if (a != 0)
           {
               lblDeleteResult.Text = FoodName + " has been deleted from your meal";
           }
           else
           {
               lblDeleteResult.Text = "OOooppps!";
           }
           Response.Redirect("CustomizeDietPlan.aspx?Day=" + DropDownList1.Text + "&MealType=" +
            DropDownList2.Text);
        }

        protected void btnShowAdd_Click(object sender, EventArgs e)
        {
            Table4.Visible = true;
            Table3.Visible = false;
        }

        protected void btnShowDelete_Click(object sender, EventArgs e)
        {
            Table3.Visible = true;
            Table4.Visible = false;
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

        protected void btnAddConfirm_Click(object sender, EventArgs e)
        {
            int a = 0;
            FoodName = ddlFoodName.Text;
            FoodID = CatalogAccess.getFoodID(FoodName);

            Day = DropDownList1.Text;
            MealType = DropDownList2.Text;
            MealID = CatalogAccess.getMealID(Day, MealType,PlanID);

            if (rbtnQuantity.Checked)
            {
                if (!String.IsNullOrEmpty(tbxQuantity.Text) && double.TryParse(tbxQuantity.Text, out quantity))
                {
                    a = CatalogAccess.insert_Into_FoodDetail(MealID, FoodID, quantity);
                }
            }
            //This is for food unit as 'g' or 'oz'
            //The default unit in database is 'g'
            else if (rbtnWeight.Checked)
            {
                if (!String.IsNullOrEmpty(tbxQuantity.Text) && double.TryParse(tbxQuantity.Text, out weight))
                {
                    if (ddlUnit.Text == "g")
                    {

                    }
                    else if (ddlUnit.Text == "oz")  
                    {
                        weight = weight * 28.3495;
                    }
                    a = CatalogAccess.insert_Into_FoodDetail(MealID, weight, FoodID);
                }
            }

            if (a != 0)
            {
                lblAddDisplay.Text = FoodName + " has been added to your meal " + Day + " " + MealType;
            }
            else
            {
                lblAddDisplay.Text = " Woooooops";
            }
            Response.Redirect("CustomizeDietPlan.aspx?Day=" + DropDownList1.Text + "&MealType=" +
                DropDownList2.Text);
        }
        //dailyCalorie not finish yet
        protected void btnCheckCalorie_Click(object sender, EventArgs e)
        {
            List<String> MealTypes = new List<String>();
            MealTypes = (List<String>)DropDownList2.DataSource;
            Day = DropDownList1.Text;

            PlanID = (int)Session["PlanID"];

            mealCalorie = CatalogAccess.getGridViewSumCalorieWithSelection(GridView1);
        //    for (int i = 0; i < MealTypes.Count; i++)
          //  {
                //dailyCalorie += CatalogAccess.getMealCalorie(Day, PlanID, MealTypes[0]) ;
          //  }

           // dailyCalorie += CatalogAccess.getMealCalorie(Day, PlanID, "Lunch");
            lblMealCalorie.Text = "This meal's total calorie is:" + mealCalorie;

            //lblTotalCalorie.Text = "Today's total calorie is:" + dailyCalorie;
        }


    }
}