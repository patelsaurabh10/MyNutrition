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
    public partial class WebForm2 : System.Web.UI.Page
    {
        string planDesc = null;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //for button btnView clicked
        protected void Button1_Click(object sender, EventArgs e)
        {
            int PlanID = Convert.ToInt32(txbPlanID.Text);
            planDesc = CatalogAccess.getPlanDesc(PlanID);
            lblPlanDesc.Text = planDesc;
            
        }
    }
}