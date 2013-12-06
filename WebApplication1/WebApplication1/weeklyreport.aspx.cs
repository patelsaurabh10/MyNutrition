using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class weeklyreport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btWeekreport_Click(object sender, EventArgs e)
        {
            dlPlan dlpl = new dlPlan();
            int followTotal = dlpl.getTotalFollowed();
            this.ChrtWeekly.Series["Followed"].Points.AddXY("Followed", dlpl.getTotalFollowed());
            this.ChrtWeekly.Series["Unfollowed"].Points.AddXY("Unfollowed", (7-dlpl.getTotalFollowed()));
        }
    }
}