using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class AnualReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Chart1_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            dlPlan dlpl = new dlPlan();
       int followTotal=dlpl.getTotalFollowed();
       this.chrtAnual.Series["Followed"].Points.AddXY("Followed", dlpl.getTotalFollowed());
       this.chrtAnual.Series["Unfollowed"].Points.AddXY("UnFollowed", dlpl.gettotaldays()-dlpl.getTotalFollowed());
       Label1.Text = "So far, You used our software " + dlpl.gettotaldays() + " days, and you followed your " + dlpl.getTotalFollowed() + " diet daily plans ";
          //  this.chrtAnual.Series["UnFollowed"].Points.AddXY("UnFollowed", dlpl.getTotalDays());
        }
    }
}