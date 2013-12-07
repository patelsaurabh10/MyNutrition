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

        public int insert_Into_CustomerPlan(int PlanID, int CustID)
        {
            int rowsAffected=0;
            DateTime now = DateTime.Now;

            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();

            SqlConnection conn = GetConnection(builder);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "INSERT INTO CustomerPlan (CustID, PlanID, CreatedDate) VALUES (@CustID, @PlanID, @CreatedDate)";


            cmd.Parameters.AddWithValue("@CustID", CustID);
            cmd.Parameters.AddWithValue("@PlanID", PlanID);
            cmd.Parameters.AddWithValue("@CreatedDate", now);


            rowsAffected = cmd.ExecuteNonQuery();

            cmd.Dispose();
            cmd = null;
            conn.Close();
            return rowsAffected;
        }

        public int getPlanNumberByCustomerID(int CustID)
        {
            int PlanNum = 0;

            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();

            SqlConnection conn = GetConnection(builder);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "select COUNT(PlanID) from CustomerPlan WHERE CustID = @CustID";

            SqlParameter param1 = cmd.CreateParameter();
            param1.ParameterName = "@CustID";
            param1.Value = CustID;
            cmd.Parameters.Add(param1);

            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    PlanNum = reader.GetInt32(0);
                }
            }
            conn.Close();

            return PlanNum;
        }
        //not used yet
        public int deletePlan(int planID)
        {
            int a = 0;
            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
            SqlConnection conn = GetConnection(builder);
            conn.Open();

            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "delete from [Plan] where PlanID=@PlanID";
            cmd.Parameters.AddWithValue("@PlanID", planID);

            a += cmd.ExecuteNonQuery();
            conn.Close();
            return a;
        }
        //not used yet
        public int deleteMeal(int planID)
        {
            int a = 0;
            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
            SqlConnection conn = GetConnection(builder);
            conn.Open();

            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "delete from Meal where PlanID=@PlanID";
            cmd.Parameters.AddWithValue("@PlanID", planID);

            a += cmd.ExecuteNonQuery();
            conn.Close();
            return a;
        }
        //not used yet
        public int deleteFoodDetail(int planID)
        {
            int a = 0;
            List<int> mealIDs = CatalogAccess.getMealIDsInMeal(planID);
            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
            SqlConnection conn = GetConnection(builder);
            conn.Open();

            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "delete from FoodDetail where MealID=@MealID";
            foreach (int mealID in mealIDs)
            {
                cmd.Parameters.AddWithValue("@MealID", mealID);
                a += cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();
            }
  
            conn.Close();
            return a;
        }
        //not used yet
        public int deleteCustomerPlan(int planID,int custID)
        {
            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
            SqlConnection conn = GetConnection(builder);
            conn.Open();

            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "delete from CustomerPlan where PlanID=@PlanID and CustID=@CustID";
            cmd.Parameters.AddWithValue("@PlanID", planID);
            cmd.Parameters.AddWithValue("@CustID", custID);

            int a = cmd.ExecuteNonQuery();
            conn.Close();
            return a;
        }

        public bool trackDietPlan(int planID)
        {
            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
            SqlConnection conn = GetConnection(builder);
            conn.Open();
            bool flag = true;
            SqlCommand cmd = conn.CreateCommand();
            
            cmd.CommandText = "select * from [Plan] WHERE Tracked = '1'";
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                flag = false;
                conn.Close();
            }
            else
            {
                conn.Close();
                SqlConnectionStringBuilder builder1 = new SqlConnectionStringBuilder();
                SqlConnection conn1 = GetConnection(builder1);
                conn1.Open();
                SqlCommand cmd1 = conn1.CreateCommand();
                cmd1.CommandText = "UPDATE [Plan] SET Tracked = '1' WHERE PlanID= @PLANID";
                cmd1.Parameters.AddWithValue("@PLANID", planID);
                cmd1.ExecuteNonQuery();
            }
           
           
            conn.Close();
            return flag;
        }
        public int getTrackedDietPlan()
        {
            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
            SqlConnection conn = GetConnection(builder);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "SELECT PlanID FROM [Plan] WHERE Tracked = '1'";
            Int32 planID = (Int32)cmd.ExecuteScalar();
            conn.Close();
            return planID;
 

        }

        public List<int> getTrackedPlanIDs()
        {
            List<int> planIDs = new List<int>();
            int planID = 0;

            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
            SqlConnection conn = GetConnection(builder);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "SELECT PlanID FROM [Plan] WHERE Tracked = '1' ";
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                planID = Convert.ToInt32(dr["PlanID"]);
                planIDs.Add(planID);
            } 
            conn.Close();
            return planIDs;

        }

        public List<int> getCustomerPlanIDs(int custID)
        {
            List<int> planIDs = new List<int>();
            int planID = 0;

            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
            SqlConnection conn = GetConnection(builder);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "SELECT PlanID FROM CustomerPlan WHERE CustID = @CustID ";
            cmd.Parameters.AddWithValue("@CustID", custID);

            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                planID = Convert.ToInt32(dr["PlanID"]);
                planIDs.Add(planID);
            } 
              
            conn.Close();
            return planIDs;

        }

        public int getTotalFollowed()
        {
            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
            SqlConnection conn = GetConnection(builder);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "SELECT PlanFollowed from DailyLog where PlanFollowed='1'";
            SqlDataReader reader = cmd.ExecuteReader();
            int total = 0;
            while (reader.Read())
            {
                total++;
            }
            conn.Close();
            return total;

        }

        public string getstartDays()
        {
            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
            SqlConnection conn = GetConnection(builder);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
<<<<<<< HEAD
            cmd.CommandText = "SELECT MIN([CreatedDate]) FROM [MyNutrition].[dbo].[CustomerPlan]";
=======
            cmd.CommandText = "select MIN(CreatedDate) from CustomerPlan";
>>>>>>> ded548d5ca36a3ed020552b7c5bbe52c17d40870
            DateTime dt1 = (DateTime)cmd.ExecuteScalar();
        

            string datstart = dt1.ToShortDateString();
            conn.Close();
            return datstart;
            
           

        }
        public int gettotaldays()
        {
            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
            SqlConnection conn = GetConnection(builder);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "SELECT DATEDIFF(day,@startdate,@currentdate) AS DiffDate";
            string startdate = getstartDays();
            string currentdate = DateTime.Now.ToString();
            cmd.Parameters.AddWithValue("@startdate", startdate);
            cmd.Parameters.AddWithValue("@currentdate", currentdate);
            int days = Convert.ToInt32(cmd.ExecuteScalar());
            conn.Close();
            return days;
        }

        public void updateDailyLog()
        {
            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
            SqlConnection conn = GetConnection(builder);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "INSERT INTO [MyNutrition].[dbo].[DailyLog] ([LogDay],[PlanFollowed],[PlanID],[LogDesc])VALUES('6','1',1,'none')";
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }
}