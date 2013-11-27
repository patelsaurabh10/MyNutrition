using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.OleDb;
using System.Data;
using System.Data.SqlClient;
using WebApplication1.App_Code;

namespace WebApplication1
{
    public class dlPlan
    {
        private static SqlConnection GetConnection(SqlConnectionStringBuilder builder)
        {
            builder.DataSource = ".\\SQLEXPRESS";
            builder.IntegratedSecurity = true;
            builder.InitialCatalog = "MyNutrition";
            SqlConnection conn = new SqlConnection(builder.ConnectionString);
            return conn;
        }

        public DataTable getPlanTable(int PlanID)
        {
            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
            SqlConnection conn = GetConnection(builder);

            //Create a SqlDataAdapter for the Suppliers table.
            SqlDataAdapter adapter = new SqlDataAdapter();

            // A table mapping names the DataTable.
            // adapter.TableMappings.Add("Table", "MealDetail");

            conn.Open();

            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "SELECT * FROM [Plan] WHERE (PlanID = @PlanID)";

            SqlParameter param1 = cmd.CreateParameter();
            param1.ParameterName = "@PlanID";
            param1.Value = PlanID;
            cmd.Parameters.Add(param1);

            // Set the SqlDataAdapter's SelectCommand.
            adapter.SelectCommand = cmd;

            // Fill the DataSet.
            DataTable Plan = new DataTable("Plan");
            adapter.Fill(Plan);
            return Plan;
        }

        public DataTable getMealTable(int PlanID)
        {
            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
            SqlConnection conn = GetConnection(builder);

            //Create a SqlDataAdapter for the Suppliers table.
            SqlDataAdapter adapter = new SqlDataAdapter();

            // A table mapping names the DataTable.
            // adapter.TableMappings.Add("Table", "MealDetail");

            conn.Open();

            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "SELECT * FROM Meal WHERE (Meal.PlanID = @PlanID)";

            SqlParameter param1 = cmd.CreateParameter();
            param1.ParameterName = "@PlanID";
            param1.Value = PlanID;
            cmd.Parameters.Add(param1);

            // Set the SqlDataAdapter's SelectCommand.
            adapter.SelectCommand = cmd;

            // Fill the DataSet.
            DataTable Meal = new DataTable("Meal");
            adapter.Fill(Meal);
            return Meal;
        }

        public DataTable getFoodDetailTable(int PlanID)
        {
            List<int> MealIDS = CatalogAccess.getMealIDsInMeal(PlanID);
            DataTable FoodDetail = null;
            DataTable FoodDetailFinal = null;

            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
            SqlConnection conn = GetConnection(builder);

            //Create a SqlDataAdapter for the Suppliers table.
            SqlDataAdapter adapter = new SqlDataAdapter();

            // A table mapping names the DataTable.
            // adapter.TableMappings.Add("Table", "MealDetail");

            conn.Open();
            foreach (int MealID in MealIDS)
            {
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "SELECT * FROM FoodDetail WHERE (FoodDetail.MealID = @MealID)";
           
                SqlParameter param1 = cmd.CreateParameter();
                param1.ParameterName = "@MealID";
                param1.Value = MealID;
                cmd.Parameters.Add(param1);

                // Set the SqlDataAdapter's SelectCommand.
                adapter.SelectCommand = cmd;

                // Fill the DataSet.
                FoodDetail = new DataTable("FoodDetail");
                adapter.Fill(FoodDetail);

                cmd.Dispose();
                cmd = null;

                if (FoodDetailFinal != null)
                {
                    FoodDetailFinal.Merge(FoodDetail);
                }

                if (FoodDetailFinal == null)
                {
                    FoodDetailFinal = FoodDetail;
                }


            }
            return FoodDetailFinal;
        }

        public int getMaxPlanID()
        {
            int planIDMax = 0;

            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();

            SqlConnection conn = GetConnection(builder);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "select MAX(PlanID) from [Plan]";

            cmd.CommandType = CommandType.Text;
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    planIDMax = reader.GetInt32(0);
                }
            }
            conn.Close();
            return planIDMax;
        }
    }
}