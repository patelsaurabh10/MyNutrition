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
        public static DataTable getMealDetail(int PlanID, String Day, String MealType)
        {
            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
            SqlConnection conn = GetConnection(builder);

            //Create a SqlDataAdapter for the Suppliers table.
            SqlDataAdapter adapter = new SqlDataAdapter();

            // A table mapping names the DataTable.
            // adapter.TableMappings.Add("Table", "MealDetail");

            conn.Open();

            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = @Day) AND (Meal.MealType = @MealType)";
            SqlParameter param1 = cmd.CreateParameter();
            SqlParameter param2 = cmd.CreateParameter();
            SqlParameter param3 = cmd.CreateParameter();

            param1.ParameterName = "@PlanID";
            param1.Value = PlanID;
            cmd.Parameters.Add(param1);
            param2.ParameterName = "@Day";
            param2.Value = Day;
            cmd.Parameters.Add(param2);
            param3.ParameterName = "@MealType";
            param3.Value = MealType;
            cmd.Parameters.Add(param3);

            // Set the SqlDataAdapter's SelectCommand.
            adapter.SelectCommand = cmd;

            // Fill the DataSet.
            DataTable MealDetail = new DataTable("MealDetail");
            adapter.Fill(MealDetail);

            return MealDetail;
        }
        //delete one row in foodDetail table by FoodName and MealID
        public static int deleteFoodInMeal(String FoodName, int MealID)
        {
            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
            SqlConnection conn = GetConnection(builder);
            conn.Open();

            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "delete from FoodDetail where MealID=@MealID and FoodID = (select FoodID from Food where FoodName=@FoodName)";
            SqlParameter param1 = cmd.CreateParameter();
            SqlParameter param2 = cmd.CreateParameter();

            param1.ParameterName = "@FoodName";
            param1.Value = FoodName;
            cmd.Parameters.Add(param1);

            param2.ParameterName = "@MealID";
            param2.Value = MealID;
            cmd.Parameters.Add(param2);

            int a = cmd.ExecuteNonQuery();  
            conn.Close();
            return a;
        }
        //get MealID by Day and MealType
        public static int getMealID(String Day, String MealType)
        {
            int MealID = 0;
            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
            SqlConnection conn = GetConnection(builder);
            conn.Open();

            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "select MealID from Meal where Day=@Day and MealType=@MealType";
            SqlParameter param1 = cmd.CreateParameter();
            SqlParameter param2 = cmd.CreateParameter();

            param1.ParameterName = "@Day";
            param1.Value = Day;
            cmd.Parameters.Add(param1);

            param2.ParameterName = "@MealType";
            param2.Value = MealType;
            cmd.Parameters.Add(param2);

            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    MealID = Convert.ToInt32(reader.GetInt32(0));
                }
            }
            conn.Close();
            return MealID;
        }

        public static int getFoodID(String FoodName)
        {
            int FoodID = 0;
            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
            SqlConnection conn = GetConnection(builder);
            conn.Open();

            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "select FoodID from Food where FoodName=@FoodName";
            SqlParameter param1 = cmd.CreateParameter();

            param1.ParameterName = "@FoodName";
            param1.Value = FoodName;
            cmd.Parameters.Add(param1);

            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    FoodID = Convert.ToInt32(reader.GetInt32(0));
                }
            }
            conn.Close();
            return FoodID;
        }

        //create new item in a meal with quantity
        public static int insert_Into_FoodDetail(int MealID, int FoodID, double Quantity)
        {
            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
            SqlConnection conn = GetConnection(builder);
            conn.Open();

            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "insert into FoodDetail(MealID, FoodID, Quantity) values (@MealID, @FoodID, @Quantity)";

            cmd.Parameters.AddWithValue("@MealID", MealID);
            cmd.Parameters.AddWithValue("@FoodID", FoodID);
            cmd.Parameters.AddWithValue("@Quantity", Quantity);

            int a = cmd.ExecuteNonQuery();
            cmd.Dispose();
            cmd = null;
            conn.Close();

            return a;
        }

        //create new item in a meal with weight
        public static int insert_Into_FoodDetail(int MealID, double Weight,int FoodID)
        {
            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
            SqlConnection conn = GetConnection(builder);
            conn.Open();

            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "insert into FoodDetail(MealID, FoodID, Weight) values (@MealID, @FoodID, @Weight)";
            cmd.Parameters.AddWithValue("@MealID", MealID);
            cmd.Parameters.AddWithValue("@FoodID", FoodID);
            cmd.Parameters.AddWithValue("@Weight", Weight);

            int a = cmd.ExecuteNonQuery();
            cmd.Dispose();
            cmd = null;
            conn.Close();

            return a;
        }
    }
}