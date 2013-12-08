using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.App_Code;

namespace WebApplication1
{
    public partial class ViewMyPlan : System.Web.UI.Page
    {
        int custID;
        List<String> planDescs = new List<String>();
        List<int> planIDs = new List<int>();
        String message = null;
        dlPlan dlP = new dlPlan();


        String FoodName = null;
        int MealID = 0;
        String Day = null;
        String MealType = null;
        int FoodID = 0;
        int PlanID = 0;

        double unit = 0;
        decimal calorie = 0;
        double quantity = 0;
        double weight = 0;

        double mealCalorie = 0;
        double dailyCalorie = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["PlanID"]) != 0)
            {
                PlanID = Convert.ToInt32(Session["PlanID"]); // from customize
            }

            if (Session["CustomerID"] != null)
            {
                custID = (int)Session["CustomerID"];
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(),
                  "err_msg",
                  "alert('Please log in to manage your plans!');",
                  true);
                Response.Redirect("~/Default.aspx");
            }

            if (Request.QueryString["Day"]!=null)
            {
                PlaceHolder1.Visible = true;
            }
            //display tracked plan
            int trackedPlan = CatalogAccess.getTrackedPlanByCustID(custID);
            String planDescription = CatalogAccess.getPlanDesc(trackedPlan);
            lblTrackedPlan.Text = planDescription;


            GridView2.DataSource = CatalogAccess.GetCastomerPlans(PlanID.ToString());
            GridView2.DataBind();

            planIDs = dlP.getCustomerPlanIDs(custID);

            foreach (int planIDa in planIDs)
            {
                String planDesc = CatalogAccess.getPlanDesc(planIDa);
                planDescs.Add(planDesc);
            }
            if (planDescs.Count >= 1)
            {
                if (!String.IsNullOrEmpty(planDescs[0]))
                {
                    Button1.Visible = true;
                    Button1.Text = "Plan: " + planDescs[0];
                }
            }
            if (planDescs.Count >= 2)
            {
                if (!String.IsNullOrEmpty(planDescs[1]))
                {
                    Button2.Visible = true;
                    Button2.Text = "Plan: " + planDescs[1];
                }

            } if (planDescs.Count >= 3)
            {
                if (!String.IsNullOrEmpty(planDescs[2]))
                {
                    Button3.Visible = true;
                    Button3.Text = "Plan: " + planDescs[2];
                }

            }

            if (!IsPostBack)
            {
                //  planID = 0 means no plan is tracked for this Customer

                //ddlCustomer.DataTextField = "Text";
                //ddlCustomer.DataValueField = "Value";
                //  ddlCustomer.DataSource = CatalogAccess.GetCustomers();

                //   ddlCustomer.DataBind();

                DropDownList1.Text = Request.QueryString["Day"];
                DropDownList2.Text = Request.QueryString["MealType"];
                lblAddDisplay.Text = "";
                lblDeleteResult.Text = "";
                Table3.Visible = false;
                Table4.Visible = false;
            }


        }

        protected void ddlCustomer_SelectedIndexChanged(object sender, EventArgs e)
        {
            // int planID = CatalogAccess.GetCustomerPlanID(ddlCustomer.SelectedValue);

        }

        protected void btnDeletePlan_Click(object sender, EventArgs e)
        {
            //never delete system plan
            if (PlanID > 10)
            {
                message = CatalogAccess.deleteCustomerPlan(PlanID, custID);
                if (message.StartsWith("Effeced"))
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(),
           "err_msg",
           "alert('your plan" + PlanID + " has been deleted!');",
           true);
                    Session.Remove("PlanID");
                    Response.Redirect("~/ViewMyPlan.aspx");
                }
                else
                {
                    Response.Write("<script>alert('" + message + "');</script>");

                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(),
                             "err_msg",
                             message,
                             true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(),
       "err_msg",
       "alert('You cannot delete system plan!');",
       true);
            }

        }

        protected void btnTrack_Click(object sender, EventArgs e)
        {

            dlPlan opln = new dlPlan();
            bool flag = opln.trackDietPlan(PlanID,custID);
            if (flag == true)
            {
                Session["PlanID"] = PlanID;
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(),
                    "err_msg",
                    "alert('your plan has been tracked!');",
                    true);
                lbltest.Text = "your plan has been tracked!";

                //display tracked plan
                int trackedPlan = CatalogAccess.getTrackedPlanByCustID(custID);
                String planDescription = CatalogAccess.getPlanDesc(trackedPlan);
                lblTrackedPlan.Text = planDescription;
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(),
                    "err_msg",
                    "alert('You can't track more plan, becuase it has already tracked before!');",
                    true);
                lbltest.Text = "You can't track more plan, becuase it has already tracked before";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["PlanID"] = planIDs[0];
            Response.Redirect("~/viewMyPlan.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Session["PlanID"] = planIDs[1];
            Response.Redirect("~/viewMyPlan.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Session["PlanID"] = planIDs[2];
            Response.Redirect("~/viewMyPlan.aspx");
        }

        protected void btnUpdatePlan_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["PlanID"]) != 0)
            {
                PlanID = Convert.ToInt32(Session["PlanID"]);
            }
            PlaceHolder1.Visible = true;
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            FoodName = DropDownList3.Text;
            Day = DropDownList1.Text;
            MealType = DropDownList2.Text;
            if(Convert.ToInt32(Session["PlanID"]) !=0)
            {
            PlanID = Convert.ToInt32(Session["PlanID"]);
            }

            if (FoodName == null)
            {
                lblDeleteResult.Text = "Please select an item to delete";
            }
            else
            {
                MealID = CatalogAccess.getMealID(Day, MealType, PlanID);


                int a = CatalogAccess.deleteFoodInMeal(FoodName, MealID);
                if (a != 0)
                {
                    lblDeleteResult.Text = FoodName + " has been deleted from your meal";
                }
                else
                {
                    lblDeleteResult.Text = "OOooppps!";
                }
                Response.Redirect("ViewMyPlan.aspx?Day=" + DropDownList1.Text + "&MealType=" +
                 DropDownList2.Text);
            }
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
            btnDelete.Visible = false;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnDelete.Visible = true;
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
            MealID = CatalogAccess.getMealID(Day, MealType, PlanID);

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
            Response.Redirect("ViewMyPlan.aspx?Day=" + DropDownList1.Text + "&MealType=" +
                DropDownList2.Text);
        }
        //dailyCalorie not finish yet
        protected void btnCheckCalorie_Click(object sender, EventArgs e)
        {
            List<String> MealTypes = new List<String>();
            foreach (ListItem li in DropDownList2.Items)
            {
                MealTypes.Add(li.Text);
            }

            Day = DropDownList1.Text;

            if (Convert.ToInt32(Session["PlanID"]) != 0)
            {
                PlanID = Convert.ToInt32(Session["PlanID"]);
            }

            mealCalorie = CatalogAccess.getGridViewSumCalorieWithSelection(GridView1);
            for (int i = 0; i < MealTypes.Count; i++)
            {
                dailyCalorie += CatalogAccess.getMealCalorie(Day, PlanID, MealTypes[i]);
            }

            lblMealCalorie.Text = "This meal's total calorie is:" + Math.Round(mealCalorie, 2);

            lblTotalCalorie.Text = "Today's total calorie is:" + Math.Round(dailyCalorie, 2);
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }

    public class Plans
    {
        public string Day { get; set; }
        public string MealType { get; set; }
        public string Quantity { get; set; }
        public string Weight { get; set; }
        public string FoodName { get; set; }
        public string FoodCalorie { get; set; }
        public string FoodCategory { get; set; }
    }
}