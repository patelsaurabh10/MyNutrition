using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.App_Code
{
    public class Plan
    {
        public Plan()
        {

        }

        public static int choosePlanID(double calorie)
        {
            int PlanID = 0;
            if (calorie < 1300)
            {
                PlanID = 1;

            }
            else if (calorie >= 1300 && calorie < 1500)
            {
                PlanID = 2;

            }
            else if (calorie >= 1500 && calorie < 1700)
            {
                PlanID = 3;

            }
            else if (calorie >= 1700 && calorie < 1900)
            {
                PlanID = 4;
            }
            else if (calorie >= 1900 && calorie < 2100)
            {
                PlanID = 5;
            }
            else if (calorie >= 2100 && calorie < 2300)
            {
                PlanID = 6;
            }
            else if (calorie >= 2300 && calorie < 2500)
            {
                PlanID = 7;
            }
            else if (calorie >= 2500 && calorie < 2700)
            {
                PlanID = 8;
            }
            else if (calorie >= 2700 && calorie < 2900)
            {
                PlanID = 9;
            }
            else if (calorie >= 2900)
            {
                PlanID = 10;
            }
            return PlanID;
        }
    }
}