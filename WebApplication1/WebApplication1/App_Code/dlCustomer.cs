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
    public class dlCustomer
    {
        private static SqlConnection GetConnection(SqlConnectionStringBuilder builder)
        {
            builder.DataSource = ".\\SQLEXPRESS";
            builder.IntegratedSecurity = true;
            builder.InitialCatalog = "MyNutrition";
            SqlConnection conn = new SqlConnection(builder.ConnectionString);
            return conn;
        }


        public static Customer getCustomerByCustID(int CustID)
        {
            Customer customer = new Customer();
            customer.CustID = CustID;
            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
            SqlConnection conn = GetConnection(builder);
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "select * from Customer WHERE CustID = @CustID";
            cmd.Parameters.AddWithValue("@CustID", CustID);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                customer.FirstName = dr["FirstName"].ToString();
                customer.LastName = dr["LastName"].ToString();
                customer.Age = Convert.ToInt16(dr["Age"]);
                customer.Gender = dr["Gender"].ToString();
                customer.Email = dr["Email"].ToString();
                customer.Account = dr["Account"].ToString();
                customer.password = dr["password"].ToString();
            }

            return customer;
        }

        public static Customer getCustomerByAccount(String account)
        {
            Customer customer = new Customer();
            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
            SqlConnection conn = GetConnection(builder);
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "select * from Customer WHERE Account = @Account";
            cmd.Parameters.AddWithValue("@Account", account);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    customer.FirstName = dr["FirstName"].ToString();
                    customer.LastName = dr["LastName"].ToString();
                    customer.Age = Convert.ToInt16(dr["Age"]);
                    customer.Gender = dr["Gender"].ToString();
                    customer.Email = dr["Email"].ToString();
                    customer.Account = dr["Account"].ToString();
                    customer.password = dr["password"].ToString();
                    customer.CustID = Convert.ToInt32(dr["CustID"]);
                }
            }
            else
            {
                customer = null;
            }

            return customer;
        }

    }
    public class Customer
    {
        public int CustID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int Age { get; set; }
        public string Gender { get; set; }
        public string Email { get; set; }
        public string Account { get; set; }
        public string password { get; set; }
    }
}
