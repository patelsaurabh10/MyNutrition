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
        DataTable MealDetail = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
              

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            MealDetail = CatalogAccess.getMealDetail(1, "Monday", "Breakfast");
            DataTableReader reader = new DataTableReader(MealDetail);
            MealDetail.Load(reader);
            foreach (DataRow row in MealDetail.Rows)
            {
                for (int i = 0; i < MealDetail.Columns.Count; i++)
                {
                    TextBox1.Text += row[i].ToString();
                }
            }
        }
       
    }
}