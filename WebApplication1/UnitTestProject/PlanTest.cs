using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using WebApplication1;
using WebApplication1.App_Code;

namespace UnitTestProject
{
    [TestClass]
    public class PlanTest
    {
        dlPlan dlplan = new dlPlan();
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
        [TestMethod]
        public void getMaxPlanIDTEST()
        {
            
            int planIDMaxExpected = 17;
            int planIDMaxActual = dlplan.getMaxPlanID();
            Assert.AreEqual(planIDMaxExpected, planIDMaxActual);
        }
        [TestMethod]
        public void insert_Into_CustomerPlanTEST()
        {
            int PlanID = 3;
            int CustID = 2;
            int rowsAffectedExpected = 1;
            int rowsAffectedAcutal = dlplan.insert_Into_CustomerPlan(PlanID, CustID);
            Assert.AreEqual(rowsAffectedExpected, rowsAffectedAcutal);

        }
        [TestMethod]
        public void insert_Into_CustomerPlanTEST2()
        {
            int PlanID = 2;
            int CustID = 2;
            int rowsAffectedExpected = 1;
            int rowsAffectedAcutal = dlplan.insert_Into_CustomerPlan(PlanID, CustID);
            Assert.AreEqual(rowsAffectedExpected, rowsAffectedAcutal);

        }
        [TestMethod]
        public void getPlanNumberByCustomerIDTEST()
        {
            int CustID = 2;
            int PlanNumExpected = 2;
            int PlanNumActual = dlplan.getPlanNumberByCustomerID(CustID);
            Assert.AreEqual(PlanNumExpected, PlanNumActual);

        }
        [TestMethod]
        public void getPlanNumberByCustomerIDTEST_2()
        {
            int CustID = 1;
            int PlanNumExpected = 8;
            int PlanNumActual = dlplan.getPlanNumberByCustomerID(CustID);
            Assert.AreEqual(PlanNumExpected, PlanNumActual);

        }
        [TestMethod]
        public void deletePlanTEST()
        {
            int planID = 17;
            int aExpected = 1;
            int aActual = dlplan.deletePlan(planID);
            Assert.AreEqual(aExpected, aActual);
        }
    }
}
