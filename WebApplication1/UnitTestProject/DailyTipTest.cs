using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using WebApplication1;
using WebApplication1.App_Code;

namespace UnitTestProject
{
    [TestClass]
    public class DailyTipTest
    {
        [TestMethod]
        public void TestMethod1()
        {
            int number = 1;
            String dailyTipExpected = "Drink plenty of water or other calorie-free beverages";

            String dailyTip = dlDailyTips.getTipOfTheDay(number);

            Assert.AreEqual(dailyTipExpected, dailyTip);
        }

         [TestMethod]
        public void TestMethod2()
        {
            int number = 5;
            String dailyTipExpected = "Enjoy your favorite foods.";

            String dailyTip = dlDailyTips.getTipOfTheDay(number);

            Assert.AreEqual(dailyTipExpected, dailyTip);
        }

         [TestMethod]
        public void TestMethod3()
        {
            int number = 8;
            String dailyTipExpected = "Swap a cup of pasta for a cup of vegetables.";

            String dailyTip = dlDailyTips.getTipOfTheDay(number);

            Assert.AreEqual(dailyTipExpected, dailyTip);
        }

         [TestMethod]
         public void TestMethod4()
         {

             String dailyTip = CatalogAccess.getRondomDailyTip();
             Assert.IsNotNull(dailyTip);
         }

    }
}
