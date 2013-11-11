using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.OleDb;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.App_Code
{

    public class CatalogAccess
    {
        public CatalogAccess()
        {

        }
        private static SqlConnection GetConnection(SqlConnectionStringBuilder builder)
        {
            builder.DataSource = ".\\SQLEXPRESS";
            builder.IntegratedSecurity = true;
            builder.InitialCatalog = "MyNutrition";
            SqlConnection conn = new SqlConnection(builder.ConnectionString);
            return conn;
        }
        public static string getPlanDesc(int PlanID)
        {
            string planDesc = null;

            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();

            SqlConnection conn = GetConnection(builder);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "select PlanDesc from [Plan] where PlanID=@PlanID";
            SqlParameter param = cmd.CreateParameter();
            param.ParameterName = "@PlanID";
            param.Value = PlanID;

            cmd.Parameters.Add(param);
            cmd.CommandType = CommandType.Text;
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    planDesc = reader.GetString(0);
                }
            }
            conn.Close();
            return planDesc;
        }
        public static decimal getFoodCalorie(string foodName)
        {
            decimal calorie = 0;
            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
            SqlConnection conn = GetConnection(builder);
            conn.Open();

            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "select FoodCalorie from Food where FoodName=@FoodName";
            SqlParameter param = cmd.CreateParameter();
            param.ParameterName = "@FoodName";
            param.Value = foodName;

            cmd.Parameters.Add(param);
            cmd.CommandType = CommandType.Text;
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    calorie = reader.GetDecimal(0);
                }
            }
            conn.Close();
            return calorie;
        }
        public static double getFoodUnit(string foodName)
        {
            double unit = 0;
            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
            SqlConnection conn = GetConnection(builder);
            conn.Open();

            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "select FoodUnit from Food where FoodName=@FoodName";
            SqlParameter param = cmd.CreateParameter();
            param.ParameterName = "@FoodName";
            param.Value = foodName;

            cmd.Parameters.Add(param);
            cmd.CommandType = CommandType.Text;
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    unit = Convert.ToDouble(reader.GetString(0));
                }
            }
            conn.Close();
            return unit;
        }
        public static double getGridViewSumCalorie(GridView GridView1)
        {
            decimal foodCalorie = 0;
            int quantity = 0;
            decimal weight = 0;
            double totalCalorie = 0;
            double unit = 0;
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                if (decimal.TryParse(GridView1.Rows[i].Cells[3].Text, out foodCalorie) && int.TryParse(GridView1.Rows[i].Cells[1].Text, out quantity))
                {
                    totalCalorie += (double)foodCalorie * quantity;
                }
                else if (decimal.TryParse(GridView1.Rows[i].Cells[3].Text, out foodCalorie) && decimal.TryParse(GridView1.Rows[i].Cells[2].Text, out weight))
                {
                    unit = CatalogAccess.getFoodUnit(GridView1.Rows[i].Cells[0].Text);
                    totalCalorie += (double)(foodCalorie * weight) / unit;
                }
            }
            return totalCalorie;
        }
    }
}