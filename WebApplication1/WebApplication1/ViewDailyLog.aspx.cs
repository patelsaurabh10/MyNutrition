using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.App_Code;

namespace WebApplication1
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CustomerID"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }
            if (!IsPostBack)
            {

            }

           
        }
        
/*
        public void chkStatus_OnCheckedChanged(object sender, EventArgs e)
        {
            CheckBox chkStatus = (CheckBox)sender;
            GridViewRow row = (GridViewRow)chkStatus.NamingContainer;
            

            string cid = row.Cells[6].Text;
            bool status = chkStatus.Checked;
            if (chkStatus.Checked == true)
            {
                /*SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
                SqlConnection oCon = GetConnection(builder);
                SqlCommand cmd = new SqlCommand("Select FoodCalorie From Food where FoodName = @FoodName", oCon);
                cmd.Parameters.AddWithValue("@FoodName", cid);
                oCon.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                
                    Plans oPlans = new Plans();
                    
                     double cal = Convert.ToDouble(oPlans.FoodCalorie = dr["FoodCalorie"].ToString());
                    
                    
               
                oCon.Close();
                
                
                

            }

           
        }*/
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
        
        protected void btncomment_Click(object sender, EventArgs e)
        {
            Table4.Visible = true;
           
        }

        protected void btnevaluate_Click(object sender, EventArgs e)
        {
            double totale1 = 0;
            for (int i = 0; i < gvDailyLog.Rows.Count; i++)
            {
                totale1 = totale1 + Convert.ToDouble(gvDailyLog.Rows[i].Cells[3].Text) *Convert.ToDouble( gvDailyLog.Rows[i].Cells[6].Text);
            }
            TextBox1.Text = totale1.ToString();
            double j = 0;
            double c = 0;
            for (int i = 0; i < gvDailyLog.Rows.Count; i++)
            {
                CheckBox ch = gvDailyLog.Rows[i].FindControl("chkStatus") as CheckBox;
                if (ch.Checked == true)
                {
                    c = Convert.ToDouble(gvDailyLog.Rows[i].Cells[3].Text) * Convert.ToDouble(gvDailyLog.Rows[i].Cells[6].Text);
                    j += c;
                }

            }
            TextBox2.Text = j.ToString();

            if (Convert.ToDouble(TextBox2.Text) <= (Convert.ToDouble(TextBox1.Text) + 200) || Convert.ToDouble(TextBox2.Text) <= (Convert.ToDouble(TextBox1.Text) + 200))
            {
                dlPlan dlpl = new dlPlan();
                dlpl.updateDailyLog();
            }
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            dlPlan dlpl = new dlPlan();
            int planID = dlpl.getTrackedDietPlan();
            gvDailyLog.DataSource = CatalogAccess.GetCustomerDailyLog(planID.ToString());
            gvDailyLog.DataBind();
        }

       
      

     

      
       

      

        
    }    
}