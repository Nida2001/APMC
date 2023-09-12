using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class m_APMC_user_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            bindData();
        }

    }

    protected void btnSubmit(object sender, EventArgs e)
    {
        using (KrushiSoftDataContext db = new KrushiSoftDataContext())
        {
            mstCommodity co = new mstCommodity();
            co.ComName = txtComodityName.Text;
            co.MarathiComName = txtMarComName.Text;
            co.Flag = Txtflag.Text;

            db.mstCommodities.InsertOnSubmit(co);
            db.SubmitChanges();
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "str", "alert ('Record save successfully');", true);
        }
    }
    protected void bindData()
    {
        using (KrushiSoftDataContext db = new KrushiSoftDataContext())
        {
            var getdata = (from c in db.mstCommodities select c).ToList();
            GridView1.DataSource = getdata;
            GridView1.DataBind();
        }
    }
    protected void BtnDelete_Click(object sender, EventArgs e)
    {

        String subapmc_id = ((Label)((Button)sender).Parent.Parent.FindControl("lblComId")).Text.ToString();
        using (KrushiSoftDataContext db1 = new KrushiSoftDataContext())
        {
            var getinfo = (from s in db1.mstCommodities where s.ComId == int.Parse(subapmc_id) select s).FirstOrDefault();
            db1.mstCommodities.DeleteOnSubmit(getinfo);

            db1.SubmitChanges();
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "str", "alert ('Record deleted successfully');", true);
            // bindData();
        }
    }





    protected void BtnCancel_Click(object sender, EventArgs e)
    {

    }
    protected void BtnUpdate_Click(object sender, EventArgs e)
    {
        using (KrushiSoftDataContext db = new KrushiSoftDataContext())
        {
            var updata = (from s in db.mstCommodities where s.ComId == int.Parse(Session["Id"].ToString()) select s).FirstOrDefault();
            updata.ComName = txtComodityName.Text;
            updata.MarathiComName = txtMarComName.Text;
            updata.Flag = Txtflag.Text;
            db.SubmitChanges();

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "str", "alert (' updated successfully');", true);
        }


    }


  
    protected void BtnEdit1_Click(object sender, EventArgs e)
    {
        String Id  = ((Label)((Button)sender).Parent.Parent.FindControl("lblComId")).Text.ToString();


        Session["Id"] = Id;
        using (KrushiSoftDataContext db = new KrushiSoftDataContext())
        {
            var getdata = (from s in db.mstCommodities where s.ComId == int.Parse(Id) select s).FirstOrDefault();
            txtComodityName.Text = getdata.ComName;
            txtMarComName.Text = getdata.MarathiComName;
            Txtflag.Text = getdata.Flag;
            BtnUpdate.Visible = true;

        }
    }
}
