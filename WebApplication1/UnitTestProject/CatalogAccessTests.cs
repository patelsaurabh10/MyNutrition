using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using WebApplication1;
using WebApplication1.App_Code;

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
    }
}
