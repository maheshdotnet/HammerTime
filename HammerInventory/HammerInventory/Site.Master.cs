using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HammerInventory
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String activepage = Request.RawUrl;
            if (activepage.Contains("Hammers.aspx"))
            {
                page2.Attributes.Add("class","active");
                page3.Attributes.Add("class", "");
            }
            else if (activepage.Contains("Types.aspx"))
            {
                page3.Attributes.Add("class", "active");
                page2.Attributes.Add("class", "");
            }             
        }
    }
}