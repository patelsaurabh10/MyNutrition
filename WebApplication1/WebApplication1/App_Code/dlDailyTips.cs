using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebApplication1
{
    public class dlDailyTips
    {
        private static SqlConnection GetConnection(SqlConnectionStringBuilder builder)
        {
            builder.DataSource = ".\\SQLEXPRESS";
            builder.IntegratedSecurity = true;
            builder.InitialCatalog = "MyNutrition";
            SqlConnection conn = new SqlConnection(builder.ConnectionString);
            return conn;
        }

        public static String getTipOfTheDay(int number)
        {
            String tip = null;

          
            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
            SqlConnection conn = GetConnection(builder);
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "select [Tip of the day] from DailyTip WHERE Number = @Number";
            cmd.Parameters.AddWithValue("@Number", number);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                tip = dr["Tip of the day"].ToString();
            }
            return tip;
        }
    }
}