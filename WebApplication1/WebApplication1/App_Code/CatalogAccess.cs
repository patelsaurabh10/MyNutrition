using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.OleDb;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.App_Code;

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

        public static List<ListItem> GetCustomers()
        {
            List<ListItem> lstCustomers = new List<ListItem>();
            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
            SqlConnection oCon = GetConnection(builder);
            SqlCommand cmd = new SqlCommand("select CustID,FirstName from Customer", oCon);
            oCon.Open();
            //cmd.Parameters.Add(ddlCustomer.se);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                ListItem oItem = new ListItem();
                oItem.Text = dr["FirstName"].ToString();
                oItem.Value = dr["CustID"].ToString();
                lstCustomers.Add(oItem);

            }
            return lstCustomers;
        }

        public static List<Plans> GetCastomerPlans(string planID)
        {
            List<Plans> lstPlans = new List<Plans>();
            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
            SqlConnection oCon = GetConnection(builder);
            SqlCommand cmd = new SqlCommand("Select Meal.Day,Meal.MealType,FoodDetail.Quantity,FoodDetail.Weight,Food.FoodName,Food.FoodCalorie,Food.FoodCategory from Meal inner join FoodDetail ON Meal.MealID = FoodDetail.MealID inner join Food ON Food.FoodID = FoodDetail.FoodID where Meal.PlanID = @PlanID", oCon);
            cmd.Parameters.AddWithValue("@PlanID", planID);
            oCon.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                Plans oPlans = new Plans();
                oPlans.Day = dr["Day"].ToString();
                oPlans.MealType = dr["MealType"].ToString();
                oPlans.Quantity = dr["Quantity"].ToString();
                oPlans.Weight = dr["Weight"].ToString();
                oPlans.FoodName = dr["FoodName"].ToString();
                oPlans.FoodCalorie = dr["FoodCalorie"].ToString();
                oPlans.FoodCategory = dr["FoodCategory"].ToString();
                lstPlans.Add(oPlans);
            }
            oCon.Close();
            return lstPlans;
        }

        public static List<Plans> GetCustomerDailyLog(string planID)
        {
            string day = System.DateTime.Now.DayOfWeek.ToString();
            List<Plans> lstPlans = new List<Plans>();
            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
            SqlConnection oCon = GetConnection(builder);
            
            SqlCommand cmd = new SqlCommand("Select Meal.Day,Meal.MealType,FoodDetail.Quantity,FoodDetail.Weight,Food.FoodName,Food.FoodCalorie,Food.FoodCategory from Meal inner join FoodDetail ON Meal.MealID = FoodDetail.MealID inner join Food ON Food.FoodID = FoodDetail.FoodID where Meal.PlanID = @PlanID AND Meal.Day = @Day", oCon);
            cmd.Parameters.AddWithValue("@PlanID", planID);
            cmd.Parameters.AddWithValue("@Day", day);
            oCon.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                Plans oPlans = new Plans();
                oPlans.Day = dr["Day"].ToString();
                oPlans.MealType = dr["MealType"].ToString();
                oPlans.Quantity = dr["Quantity"].ToString();
                oPlans.Weight = dr["Weight"].ToString();
                oPlans.FoodName = dr["FoodName"].ToString();
                oPlans.FoodCalorie = dr["FoodCalorie"].ToString();
                oPlans.FoodCategory = dr["FoodCategory"].ToString();
                lstPlans.Add(oPlans);
            }
            oCon.Close();
            return lstPlans;
        }

        public static int GetCustomerPlanID(string customerID)
        {
            int planID = 0;
            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
            SqlConnection oCon = GetConnection(builder);
            SqlCommand cmd = new SqlCommand("Select PlanID from CustomerPlan where CustID=@CustID", oCon);
            cmd.Parameters.AddWithValue("@CustID", customerID);
            oCon.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                planID = Int32.Parse(dr["PlanID"].ToString());
            }
            return planID;
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

        //for gridview with selection function
        public static double getGridViewSumCalorieWithSelection(GridView GridView1)
        {
            decimal foodCalorie = 0;
            int quantity = 0;
            decimal weight = 0;
            double totalCalorie = 0;
            double unit = 0;
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                if (decimal.TryParse(GridView1.Rows[i].Cells[4].Text, out foodCalorie) && int.TryParse(GridView1.Rows[i].Cells[2].Text, out quantity))
                {
                    totalCalorie += (double)foodCalorie * quantity;
                }
                else if (decimal.TryParse(GridView1.Rows[i].Cells[4].Text, out foodCalorie) && decimal.TryParse(GridView1.Rows[i].Cells[3].Text, out weight))
                {
                    unit = CatalogAccess.getFoodUnit(GridView1.Rows[i].Cells[1].Text);
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
        public static int getMealID(String Day, String MealType, int PlanID)
        {
            int MealID = 0;
            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
            SqlConnection conn = GetConnection(builder);
            conn.Open();

            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "select MealID from Meal where Day=@Day and MealType=@MealType and PlanID=@PlanID";
            SqlParameter param1 = cmd.CreateParameter();
            SqlParameter param2 = cmd.CreateParameter();
            SqlParameter param3 = cmd.CreateParameter();

            param1.ParameterName = "@Day";
            param1.Value = Day;
            cmd.Parameters.Add(param1);

            param2.ParameterName = "@MealType";
            param2.Value = MealType;
            cmd.Parameters.Add(param2);

            param3.ParameterName = "@PlanID";
            param3.Value = PlanID;
            cmd.Parameters.Add(param3);

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

        //get MealID by day and PlanID
        public static List<int> getMealID(String Day, int PlanID)
        {
            List<int> MealIDs = new List<int>();
            int MealID = 0;
            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
            SqlConnection conn = GetConnection(builder);
            conn.Open();

            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "select MealID from Meal where Day=@Day and PlanID=@PlanID";
            SqlParameter param1 = cmd.CreateParameter();
            SqlParameter param3 = cmd.CreateParameter();

            param1.ParameterName = "@Day";
            param1.Value = Day;
            cmd.Parameters.Add(param1);

            param3.ParameterName = "@PlanID";
            param3.Value = PlanID;
            cmd.Parameters.Add(param3);

            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    MealID = Convert.ToInt32(reader.GetInt32(0));
                    MealIDs.Add(MealID);
                }
            }
            conn.Close();
            return MealIDs;
        }

        //get MealID in FoodDetail table by PlanID
        /*   public static List<int> getMealIDsInFoodDetail(int newPlanID)
           {
               List<int> MealIDs = new List<int>();
               List<int> newMealIDs = new List<int>();
               MealIDs = getMealIDsInMeal(newPlanID);

               SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
               SqlConnection conn = GetConnection(builder);
               conn.Open();

               foreach (int MealID in MealIDs)
               {
                   SqlCommand cmd = conn.CreateCommand();
                   cmd.CommandText = "select FoodDetail.MealID from FoodDetail where (FoodDetail.MealID = @MealID)";

                   SqlParameter param1 = cmd.CreateParameter();
                   param1.ParameterName = "@MealID";
                   param1.Value = MealID;
                   cmd.Parameters.Add(param1);    

                   SqlDataReader reader = cmd.ExecuteReader();

                   if (reader.HasRows)
                   {
                       while (reader.Read())
                       {
                           newMealIDs.Add(Convert.ToInt32(reader.GetInt32(0)));
                       }
                   }
                   cmd.Dispose();
                   cmd = null;
               }
               conn.Close();
               return newMealIDs;
           }*/

        //get MealID in Meal table by PlanID
        public static List<int> getMealIDsInMeal(int PlanID)
        {
            List<int> MealIDs = new List<int>();
            int MealID = 0;
            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
            SqlConnection conn = GetConnection(builder);
            conn.Open();

            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "select MealID from Meal where PlanID=@PlanID";
            SqlParameter param3 = cmd.CreateParameter();

            param3.ParameterName = "@PlanID";
            param3.Value = PlanID;
            cmd.Parameters.Add(param3);

            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    MealID = Convert.ToInt32(reader.GetInt32(0));
                    MealIDs.Add(MealID);
                }
            }
            conn.Close();
            return MealIDs;
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
        public static int insert_Into_FoodDetail(int MealID, double Weight, int FoodID)
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

        public static double getMealCalorie(String day, int PlanID, String MealType)
        {
            DataTable MealDetail = new DataTable("MealDetail");
            MealDetail = getMealDetail(PlanID, day, MealType);

            double totalCalorie = 0;
            decimal foodCalorie = 0;
            decimal quantity = 0;
            double weight = 0;
            double unit = 0;


            for (int i = 0; i < MealDetail.Rows.Count; i++)
            {
                foodCalorie = (decimal)MealDetail.Rows[i]["FoodCalorie"];
                unit = CatalogAccess.getFoodUnit((String)MealDetail.Rows[i]["FoodName"]);

                // decimal.TryParse((String)MealDetail.Rows[i]["Quantity"], out quantity);
                if (!String.IsNullOrEmpty(MealDetail.Rows[i]["Quantity"].ToString()))
                {
                    quantity = (System.Decimal)MealDetail.Rows[i]["Quantity"];
                }
                else if (!String.IsNullOrEmpty(MealDetail.Rows[i]["Weight"].ToString()))
                {
                    weight = Convert.ToDouble((System.Decimal)MealDetail.Rows[i]["Weight"]);
                }
               // weight = 1;

                if (quantity != 0)
                {
                    totalCalorie += Convert.ToDouble((decimal)foodCalorie * quantity);
                }
                else if (weight != 0)
                {
                    totalCalorie += ((double)foodCalorie * weight) / unit;
                }
            }
            return totalCalorie;
        }

        //copy system provided plan into a new plan owned by user
        public static int convertSystemPlanToUserPlan(int PlanID, int CustID, String planDesc)
        {
            int rowsAffected = 0;
            dlPlan dlP = new dlPlan();

            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
            SqlConnection conn = GetConnection(builder);

            //Create a SqlDataAdapter for the Suppliers table.
            SqlDataAdapter adapter = new SqlDataAdapter();

            conn.Open();

            DataTable FoodDetail = dlP.getFoodDetailTable(PlanID);
            DataTable Meal = dlP.getMealTable(PlanID);
            DataTable Plan = dlP.getPlanTable(PlanID);

            //the planID user is gonig to generate
            int newPlanID = dlP.getMaxPlanID() + 1;
            DateTime now = DateTime.Now;

            for (int i = 0; i < Plan.Rows.Count; i++)
            {
                Plan.Rows[i]["PlanID"] = newPlanID;
                Plan.Rows[i]["CreatedDate"] = now;
                Plan.Rows[i]["LastModifiedDate"] = now;
                Plan.Rows[i]["Customed"] = true;
                Plan.Rows[i]["PlanDesc"] = planDesc;
            }

            for (int i = 0; i < Meal.Rows.Count; i++)
            {
                Meal.Rows[i]["PlanID"] = newPlanID;
                if (Meal.Columns.Contains("MealID"))
                {
                    Meal.Columns.Remove("MealID");
                }
            }
            //populate Plan table
            string sql1 = "INSERT INTO [Plan] (PlanID, CreatedDate, LastModifiedDate, Customed, Categories, PlanDesc, Tracked ) VALUES (@PlanID, @CreatedDate, @LastModifiedDate, @Customed, @Categories, @PlanDesc, @Tracked)";


            foreach (DataRow r in Plan.Rows)
            {
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = sql1;
                cmd.Parameters.AddWithValue("@PlanID", r["PlanID"]);
                cmd.Parameters.AddWithValue("@CreatedDate", r["CreatedDate"]);
                cmd.Parameters.AddWithValue("@LastModifiedDate", r["LastModifiedDate"]);
                cmd.Parameters.AddWithValue("@Customed", r["Customed"]);
                cmd.Parameters.AddWithValue("@Categories", r["Categories"]);
                cmd.Parameters.AddWithValue("@PlanDesc", r["PlanDesc"]);
                cmd.Parameters.AddWithValue("@Tracked", r["Tracked"]);
                rowsAffected += cmd.ExecuteNonQuery();
            }

            //populate Meal table
            string sql2 = "INSERT INTO Meal (MealType, Day, PlanID) VALUES (@MealType, @Day, @PlanID)";


            foreach (DataRow r in Meal.Rows)
            {
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = sql2;
                cmd.Parameters.AddWithValue("@MealType", r["MealType"]);
                cmd.Parameters.AddWithValue("@Day", r["Day"]);
                cmd.Parameters.AddWithValue("@PlanID", r["PlanID"]);

                rowsAffected += cmd.ExecuteNonQuery();
            }
            conn.Close();


            int j = 0;
            //after insert meal table
            List<int> MealIDs = getMealIDsInMeal(newPlanID);
            for (int i = 0; i < FoodDetail.Rows.Count; i++)
            {
                int nextMealID = 0;
                int currentMealID = (int)FoodDetail.Rows[i]["MealID"];
                if (i < FoodDetail.Rows.Count - 1)
                {
                    nextMealID = (int)FoodDetail.Rows[i + 1]["MealID"];
                }
                if (currentMealID != nextMealID)
                {
                    FoodDetail.Rows[i]["MealID"] = MealIDs[j];
                    j++;
                }
                else
                {
                    FoodDetail.Rows[i]["MealID"] = MealIDs[j];
                }
            }
            //populate FoodDetail table
            string sql3 = "INSERT INTO FoodDetail (MealID, FoodID, Quantity, Weight) VALUES (@MealID, @FoodID, @Quantity,@Weight)";

            conn.Open();
            foreach (DataRow r in FoodDetail.Rows)
            {
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = sql3;
                cmd.Parameters.AddWithValue("@MealID", r["MealID"]);
                cmd.Parameters.AddWithValue("@FoodID", r["FoodID"]);
                cmd.Parameters.AddWithValue("@Quantity", r["Quantity"]);
                cmd.Parameters.AddWithValue("@Weight", r["Weight"]);

                rowsAffected += cmd.ExecuteNonQuery();
            }
            conn.Close();
            rowsAffected += dlP.insert_Into_CustomerPlan(newPlanID, CustID);

            return rowsAffected;
        }

        public static String deleteCustomerPlan(int planID, int custID)
        {
            String message = "";
            int effectedRows = 0;
            dlPlan dlPlan = new dlPlan();
            List<int> mealIDs = CatalogAccess.getMealIDsInMeal(planID);

            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
            SqlConnection conn = GetConnection(builder);
            conn.Open();

            SqlCommand cmd = conn.CreateCommand();
            SqlTransaction transaction;

            // Start a local transaction.
            transaction = conn.BeginTransaction("DeleteCustomerPlan");

            // Must assign both transaction object and connection 
            // to Command object for a pending local transaction
            cmd.Connection = conn;
            cmd.Transaction = transaction;

            try
            {
                //CustomerPlan
                cmd.CommandText = "delete from CustomerPlan where PlanID=@PlanID and CustID=@CustID";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@PlanID", planID);
                cmd.Parameters.AddWithValue("@CustID", custID);
                effectedRows += cmd.ExecuteNonQuery();

                //FoodDetail
                cmd.CommandText = "delete from FoodDetail where MealID=@MealID";
                foreach (int mealID in mealIDs)
                {
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@MealID", mealID);
                    effectedRows += cmd.ExecuteNonQuery();

                }

                //Meal
                cmd.CommandText = "delete from Meal where PlanID=@PlanID";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@PlanID", planID);

                effectedRows += cmd.ExecuteNonQuery();

                //Plan
                cmd.CommandText = "delete from [Plan] where PlanID=@PlanID";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@PlanID", planID);

                effectedRows += cmd.ExecuteNonQuery();
                if (effectedRows > 0)
                {
                    message += "Effeced Rows: " + effectedRows;
                }
                else
                {
                    message += "Plan " + planID + " does not exist";
                }
                // Attempt to commit the transaction.
                transaction.Commit();
            }

            catch (Exception ex)
            {
                Console.WriteLine("Commit Exception Type: {0}", ex.GetType());
                Console.WriteLine("  Message: {0}", ex.Message);
                message += "Commit Exception Type: " + ex.GetType() + "\tMessage: " + ex.Message;
                // Attempt to roll back the transaction. 
                try
                {
                    transaction.Rollback();
                }
                catch (Exception ex2)
                {
                    // This catch block will handle any errors that may have occurred 
                    // on the server that would cause the rollback to fail, such as 
                    // a closed connection.
                    Console.WriteLine("Rollback Exception Type: {0}", ex2.GetType());
                    Console.WriteLine("  Message: {0}", ex2.Message);
                    message += "Rollback Exception Type: {0}" + ex2.GetType() + "  Message: {0}" + ex2.Message;
                }
            }
            finally 
            {
                conn.Close();
                
            }
            return message;
        }

        public static String getRondomDailyTip()
        {
            Random random = new Random();
            int randomNumber = random.Next(0, 11);
            String tip =  "\"" + dlDailyTips.getTipOfTheDay(randomNumber) + "\"";
            return tip;
        }

        public static int getTrackedPlanByCustID(int custID)
        {
            dlPlan dlP = new dlPlan();
            int trackedPlanID = 0;

           List<int> customerPlanIDs = dlP.getCustomerPlanIDs(custID);
           List<int> trackedPlanIDs =  dlP.getTrackedPlanIDs();

           List<int> trackedCustomerPlanIDs = customerPlanIDs.Intersect(trackedPlanIDs).ToList();
           if (trackedCustomerPlanIDs.Count() == 1)
           {
               trackedPlanID = trackedCustomerPlanIDs[0];
           }
          
           return trackedPlanID;
        }
    }
}