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
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlCustomer.DataTextField = "Text";
                ddlCustomer.DataValueField = "Value";
                ddlCustomer.DataSource = CatalogAccess.GetCustomers();
                ddlCustomer.DataBind();
            }
        }

        protected void ddlCustomer_SelectedIndexChanged(object sender, EventArgs e)
        {
            int planID = CatalogAccess.GetCustomerPlanID(ddlCustomer.SelectedValue);
            GridView1.DataSource = CatalogAccess.GetCastomerPlans(planID.ToString());
            GridView1.DataBind();            
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