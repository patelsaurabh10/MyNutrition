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
        public void getPlanDescTEST()
        {
            int PlanID = 1;
            string planDescExpected = "for 1200 calorie";
            
            
            string planDescActual = CatalogAccess.getPlanDesc(PlanID);
            Assert.AreEqual(planDescExpected, planDescActual);
            
            
        }
        [TestMethod]
        public void getPlanDescTEST2()
        {
            int PlanID = 3;
            string planDescExpected = "for 1600 calories";


            string planDescActual = CatalogAccess.getPlanDesc(PlanID);
            Assert.AreEqual(planDescExpected, planDescActual);


        }

        [TestMethod]
        public void getPlanDescTEST3()
        {
            int PlanID = 6;
            string planDescExpected = "for 2200 calories";


            string planDescActual = CatalogAccess.getPlanDesc(PlanID);
            Assert.AreEqual(planDescExpected, planDescActual);


        }
        [TestMethod]
        public void getPlanDescTEST4()
        {
            int PlanID = 9;
            string planDescExpected = "for 2800 calories";


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
        public void getFoodCalorieTEST2()
        {
            string foodName = "Chicken shawarma";
            decimal calorieExpected = 520;
            decimal calorieActual = CatalogAccess.getFoodCalorie(foodName);
            Assert.AreEqual(calorieExpected, calorieActual);

        }

        [TestMethod]
        public void getFoodCalorieTEST3()
        {
            string foodName = "Blackberry banana shake";
            decimal calorieExpected = 290;
            decimal calorieActual = CatalogAccess.getFoodCalorie(foodName);
            Assert.AreEqual(calorieExpected, calorieActual);

        }

        [TestMethod]
        public void getFoodCalorieTEST4()
        {
            string foodName = "BBQ chicken with ceasar salad";
            decimal calorieExpected = 540;
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
        public void getFoodUnitTEST2()
        {
            string foodName = "Onion rings";
            double unitExpected = 113;
            double unitActual = CatalogAccess.getFoodUnit(foodName);
            Assert.AreEqual(unitExpected, unitActual);
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
        public void getMealIDTEST2()
        {
            String Day = "Tuesday";
            int PlanID = 2;
            List<int> MealIDsExpected = new List<int>() { 43, 44, 45, 46, 47 };

            List<int> MealdIDsActual = CatalogAccess.getMealID(Day, PlanID);

            CollectionAssert.AreEqual(MealIDsExpected, MealdIDsActual);


        }

        [TestMethod]
        public void getMealIDTEST3()
        {
            String Day = "Friday";
            int PlanID = 4;
            List<int> MealIDsExpected = new List<int>() { 132, 133, 134, 135, 136, 137 };

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
        public void getFoodIDIDTEST2()
        {
            string FoodName = "Onion rings";
            int FoodIDExpected = 24;

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

        [TestMethod]
        public void deleteFoodInMealTEST()
        {
            string FoodName = "Cereal-oats";
            int MealID = 33;
            int aExpected = 1;
            int aActual = CatalogAccess.deleteFoodInMeal(FoodName, MealID);
            Assert.AreEqual(aExpected, aActual);
        }
        [TestMethod]
        public void insert_Into_FoodDetailTEST()
        {
            int MealID = 56;
            int FoodID = 15;
            double Quantity = 1;

            int aEpected = 1;
            int aActual = CatalogAccess.insert_Into_FoodDetail(MealID, FoodID, Quantity);
            Assert.AreEqual(aEpected, aActual);
        }
        [TestMethod]
        public void insert_Into_FoodDetailWithWeightTEST()
        {
            int MealID = 56;
            int FoodID = 14;
            double Weight = 240;
            int aEpected = 1;
            int aActual = CatalogAccess.insert_Into_FoodDetail(MealID, Weight, FoodID);
            Assert.AreEqual(aEpected, aActual);
        }
        
    }
}
