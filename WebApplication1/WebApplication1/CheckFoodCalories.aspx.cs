using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        double unit = 0;
        decimal calorie = 0;
        double quantity = 0;
        double totalCalorie = 0;
        private static SqlConnection GetConnection(SqlConnectionStringBuilder builder)
        {
            builder.DataSource = ".\\SQLEXPRESS";
            builder.IntegratedSecurity = true;
            builder.InitialCatalog = "MyNutrition";
            SqlConnection conn = new SqlConnection(builder.ConnectionString);
            return conn;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();

            SqlConnection conn = GetConnection(builder);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "select FoodCalorie,FoodUnit from Food where FoodName=@FoodName";
            SqlParameter param = cmd.CreateParameter();
            param.ParameterName = "@FoodName";
            param.Value = ddlFoodName.Text;

            cmd.Parameters.Add(param);
            cmd.CommandType = CommandType.Text;
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    calorie = reader.GetDecimal(0);
                    unit = Convert.ToInt32(reader.GetString(1));
                }
            }
            conn.Close();

        }
        protected void ddlFoodName_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();

            SqlConnection conn = GetConnection(builder);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "select FoodCalorie,FoodUnit from Food where FoodName=@FoodName";
            SqlParameter param = cmd.CreateParameter();
            param.ParameterName = "@FoodName";
            param.Value = ddlFoodName.Text;

            cmd.Parameters.Add(param);
            cmd.CommandType = CommandType.Text;
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    calorie = reader.GetDecimal(0);
                    unit = Convert.ToInt32(reader.GetString(1));
                }
            }
            conn.Close();

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
                if (!String.IsNullOrEmpty(tbxQuantity.Text))
                {
                    quantity = Convert.ToInt32(tbxQuantity.Text);
                    totalCalorie = (double)calorie * quantity;
                    lblQuantityResult.Text = tbxQuantity.Text;
                }
            }
            //This is for food unit as 'g' or 'oz'
            //The default unit in database is 'g'
            else if (rbtnWeight.Checked)
            {
                if (!String.IsNullOrEmpty(tbxQuantity.Text))
                {
                    lblQuantityResult.Text = tbxQuantity.Text + ddlUnit.Text;
                    if (ddlUnit.Text == "g")
                    {
                        quantity = Convert.ToInt32(tbxQuantity.Text);
                    }
                    else if (ddlUnit.Text == "oz")
                    {
                        quantity = Convert.ToInt32(tbxQuantity.Text) * 28.3495;
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
    }
}