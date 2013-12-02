using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using WebApplication1;
using WebApplication1.App_Code;

namespace UnitTestProject
{
    [TestClass]
    class BMRTEST
    {
        [TestMethod]
        public void getPlanDescTEST()
        {
            double BMR = 0;
            double height = 180;
            double weight = 150;
            int age = 25;
            string gender = "Male";
            var bmr = new bmrch();
            double valueexpected = 3116.5;
            BMR = bmr.BMRCal_Click(height, weight, age, gender);
            Assert.AreEqual(valueexpected, BMR);
            
           
        }
    }
}
