using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class ViewMyPlan : System.Web.UI.Page
    {
        string strCon = ConfigurationManager.ConnectionStrings["MyNutritionConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection oCon = new SqlConnection(strCon);
            SqlCommand cmd = new SqlCommand("select CustID,FirstName from Customer",oCon);
            oCon.Open();
            //cmd.Parameters.Add(ddlCustomer.se);
            SqlDataReader dr = cmd.ExecuteReader();
            while(dr.Read())
            {
                ListItem oItem = new ListItem();
                oItem.Text = dr["FirstName"].ToString();
                oItem.Value=dr["CustID"].ToString();
                ddlCustomer.Items.Add(oItem);
                //ddlCustomer.s
            }
        }

        protected void ddlCustomer_SelectedIndexChanged(object sender, EventArgs e)
        {
            List<Plans> lstPlans = new List<Plans>();
            SqlConnection oCon = new SqlConnection(strCon);
            SqlCommand cmd = new SqlCommand("Select PlanID,CreatedDate,LastModifiedDate,Categories,PlanDesc,Tracked from Plans where CustID=@CustID", oCon);
            cmd.Parameters.AddWithValue("@CustID", ddlCustomer.SelectedValue);
            oCon.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                Plans oPlans = new Plans();
                oPlans.PlanID =Convert.ToInt32(dr["PlanID"].ToString());
                oPlans.CreatedDate = dr["CreatedDate"].ToString();
                oPlans.LastModifiedDate = dr["LastModifiedDate"].ToString();
                oPlans.Categories = dr["Categories"].ToString();
                oPlans.PlanDesc = dr["PlanDesc"].ToString();
                oPlans.Tracked = dr["Tracked"].ToString();
                lstPlans.Add(oPlans);
            }
            GridView1.DataSource = lstPlans;
            GridView1.DataBind();

        }
    }

    public class Plans
    {
        public int PlanID { get; set; }
        public string CreatedDate { get; set; }
        public string LastModifiedDate { get; set; }
        public string Categories { get; set; }
        public string PlanDesc { get; set; }
        public string Tracked { get; set; }
    }
}