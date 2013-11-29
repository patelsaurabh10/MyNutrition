using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WebApplication1.App_Code
{
    class PlanNumberExceedException : Exception
    {
        public PlanNumberExceedException()
        {
        }

        public PlanNumberExceedException(string message)
            : base(message)
        {
        }

        public PlanNumberExceedException(string message, Exception inner)
            : base(message, inner)
        {
        }
    }

}
