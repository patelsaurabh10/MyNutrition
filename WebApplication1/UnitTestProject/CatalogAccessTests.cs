using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using WebApplication1;
using WebApplication1.App_Code;
using System.Collections.Generic;


namespace UnitTestProject
{
    [TestClass]
    public class CatalogAccessTests
    {

        [TestMethod]
        public void getCustomersTEST()
        {

        }
        [TestMethod]
        public void getPlanDescTEST()
        {
            int PlanID = 1;
            string planDescExpected = "for 1200 calorie";
            
            
            string planDescActual = CatalogAccess.getPlanDesc(PlanID);
            Assert.AreEqual(planDescExpected, planDescActual);
            
            
        }

        [TestMethod]
        public void getFoodCalorieTEST()
        {
            string foodName = "Rice while cooked";
            decimal calorieExpected = 205;
            decimal calorieActual = CatalogAccess.getFoodCalorie(foodName);
            Assert.AreEqual(calorieExpected, calorieActual);

        }

        [TestMethod]
        public void getFoodUnitTEST()
        {
            string foodName = "Rice while cooked";
            double unitExpected = 1;
            double unitActual = CatalogAccess.getFoodUnit(foodName);
            Assert.AreEqual(unitExpected, unitActual);
        }


        [TestMethod]
        public void getGridViewSumCalorieTEST()
        {
            
        }
        [TestMethod]
        public void getMealIDTEST()
        {
            String Day = "Monday";
            int PlanID = 1;
            List<int> MealIDsExpected = new List<int>(){1, 3, 4, 5, 6};

            List<int> MealdIDsActual = CatalogAccess.getMealID(Day, PlanID);

            CollectionAssert.AreEqual(MealIDsExpected, MealdIDsActual);
            

        }

        [TestMethod]
        public void GetCustomerPlanIDTEST()
        {
            string customerID = "1";
            int PlanIDExpected = 10;
            int PlanIDActual = CatalogAccess.GetCustomerPlanID(customerID);
            Assert.AreEqual(PlanIDExpected, PlanIDActual);
        }
        [TestMethod]
        public void getFoodIDIDTEST()
        {
            string FoodName = "Rice while cooked";
            int FoodIDExpected = 1;

            int FoodIDActual = CatalogAccess.getFoodID(FoodName);
            Assert.AreEqual(FoodIDExpected, FoodIDActual);
        }

        [TestMethod]
        public void getMealCalorieTEST()
        {
            string day = "Monday";
            int PlanID = 1;
            string MealType = "Breakfast";
            double calorieExpected = 200;
            double calorieActual = CatalogAccess.getMealCalorie(day, PlanID, MealType);
            Assert.AreEqual(calorieExpected, calorieActual);
        }
    }
}
