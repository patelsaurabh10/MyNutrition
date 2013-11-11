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
        int PlanID = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["PlanID"] = 1;

            lblMonSumCalorie.Text = Convert.ToString(CatalogAccess.getGridViewSumCalorie(GridViewMonBreak) + CatalogAccess.getGridViewSumCalorie(GridViewMonLunch) + CatalogAccess.getGridViewSumCalorie(GridViewMonDinner));
            lblTueSumCalorie.Text = Convert.ToString(CatalogAccess.getGridViewSumCalorie(GridViewTueBreak) + CatalogAccess.getGridViewSumCalorie(GridViewTueLunch) + CatalogAccess.getGridViewSumCalorie(GridViewTueDinner));
            lblWesSumCalorie.Text = Convert.ToString(CatalogAccess.getGridViewSumCalorie(GridViewWedBreak) + CatalogAccess.getGridViewSumCalorie(GridViewWedLunch) + CatalogAccess.getGridViewSumCalorie(GridViewWedDinner));
            lblThurSumCalorie.Text = Convert.ToString(CatalogAccess.getGridViewSumCalorie(GridViewThurBreak) + CatalogAccess.getGridViewSumCalorie(GridViewThurLunch) + CatalogAccess.getGridViewSumCalorie(GridViewThurDinner));
            lblFriSumCalorie.Text = Convert.ToString(CatalogAccess.getGridViewSumCalorie(GridViewFriBreak) + CatalogAccess.getGridViewSumCalorie(GridViewFriLunch) + CatalogAccess.getGridViewSumCalorie(GridViewFriDinner));
            lblSatSumCalorie.Text = Convert.ToString(CatalogAccess.getGridViewSumCalorie(GridViewSatBreak) + CatalogAccess.getGridViewSumCalorie(GridViewSatLunch) + CatalogAccess.getGridViewSumCalorie(GridViewSatDinner));
            lblSunSumCalorie.Text = Convert.ToString(CatalogAccess.getGridViewSumCalorie(GridViewSunBreak) + CatalogAccess.getGridViewSumCalorie(GridViewSunLunch) + CatalogAccess.getGridViewSumCalorie(GridViewSunDinner));
        }
        //for button btnView clicked
        protected void Button1_Click(object sender, EventArgs e)
        {
            // Session["PlanID"] = txbPlanID.Text;
            PlanID = Convert.ToInt32(txbPlanID.Text);
            /*if (Session["PlanID"] != null)
            {
                PlanID = (int)Session["PlanID"];
            }*/
            planDesc = CatalogAccess.getPlanDesc(PlanID);
            lblPlanDesc.Text = planDesc;

        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

    }
}