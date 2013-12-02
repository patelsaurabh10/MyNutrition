using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using WebApplication1;
using WebApplication1.App_Code;

namespace UnitTestProject
{
    [TestClass]
    public class PlanTest
    {
        [TestMethod]
        public void TestMethod1()
        {
            double calorie = 2000;
            int planIDExpected = 5;
            var plan = new Plan();

            int planID = plan.choosePlanID(calorie);
            Assert.AreEqual(planIDExpected, planID);
        }
        [TestMethod]
        public void TestMethod2()
        {
            double calorie = 1500;
            int planIDExpected = 3;
            var plan = new Plan();

            int planID = plan.choosePlanID(calorie);
            Assert.AreEqual(planIDExpected, planID);
        }
        [TestMethod]
        public void TestMethod3()
        {
            double calorie = 500;
            int planIDExpected = 1;
            var plan = new Plan();

            int planID = plan.choosePlanID(calorie);
            Assert.AreEqual(planIDExpected, planID);
        }
    }
      
}
