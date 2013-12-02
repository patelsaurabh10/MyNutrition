using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.App_Code
{
    public class bmrch
    { public bmrch()
        {
        }
        public double BMRCal_Click(double h, double w, int a, string g)
        {
            double BMR = 0;
            
            if (g == "Female")
            {
                BMR = (655 + (4.35 * w) + (4.7 * h) - (4.7 * a));
                
            }
            if (g == "Male")
            {
                BMR = (66 + (6.23 * w) + (12.7 * h) - (6.8 * a));
                
            }
            return BMR;
        }
    }
}