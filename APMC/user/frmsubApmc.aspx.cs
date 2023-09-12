using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class m_APMC_user_frmsubApmc : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["Heading"] = "Sub Apmc Master";
        if (!Page.IsPostBack)
        {
            BindData();
            Button3.Visible = false;
        }
    }

    protected void BindData()
    {
        using (KrushiSoftDataContext db1 = new KrushiSoftDataContext())
        {
            var query1 = (from x in db1.mstSubAPMCs where x.isdelete == false select x).ToList();
            GridView1.DataSource = query1;
            GridView1.DataBind();
        }
    }

    protected void btncancel_Click(object sender, EventArgs e)
    {
    }

    protected void delete(object sender, EventArgs e)
    {

        String subapmc_id = ((Label)((Button)sender).Parent.Parent.FindControl("Label10")).Text.ToString();
        using (KrushiSoftDataContext db1 = new KrushiSoftDataContext())
        {
            var getinfo = (from s in db1.mstSubAPMCs where s.SubAPMC_Id == int.Parse(subapmc_id) select s).FirstOrDefault();
            getinfo.isdelete = true;
            db1.SubmitChanges();
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "str", "alert ('Record deleted successfully');", true);
            BindData();
        }

    }
    string Id;
    protected void BtnEdit_Click(object sender, GridViewEditEventArgs e)
    {
        string Id = ((Label)GridView1.Rows[e.NewEditIndex].FindControl("Label10")).Text;

        Session["Id"] = Id;
        //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "str", "alert ('"+x+"');", true);

        using (KrushiSoftDataContext db = new KrushiSoftDataContext())
        {
            var data = (from s in db.mstSubAPMCs
                        join p in db.mstAPMCs on s.APMC_Id equals p.APMC_Id
                        where s.SubAPMC_Id == int.Parse(Id)
                        select new
                        {
                            apmcName = p.APMC_NAME,
                            subpmc = s.SubAPMC_EngName,
                            subampcM = s.SubAPMC_Name,
                            flag = s.Flag,
                            City = s.city
                        }).FirstOrDefault();

            DropDownList1.SelectedItem.Text = data.apmcName;
            txtSubApmc.Text = data.subpmc;
            txtSbubApmcM.Text = data.subampcM;
            Txtflag.Text = data.flag;
            Button3.Visible = true;
        }
    }


    protected void btnSave_Click(object sender, EventArgs e)
    {
       using (KrushiSoftDataContext db1 = new KrushiSoftDataContext())
        {
            mstSubAPMC sub = new mstSubAPMC();
            String APMC_Name = DropDownList1.SelectedItem.Text;
            int Id = (from a in db1.mstAPMCs where a.APMC_NAME == APMC_Name select a).First().APMC_Id;

            sub.APMC_Id = Id;
            sub.SubAPMC_Name = txtSbubApmcM.Text;
            sub.SubAPMC_EngName = txtSubApmc.Text;
            sub.Flag = Txtflag.Text;
            sub.isdelete = false;
            sub.city = DropDownList2.SelectedItem.Text;
            db1.mstSubAPMCs.InsertOnSubmit(sub);
            db1.SubmitChanges();


            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "str", "alert ('Record save successfully');", true);
            BindData();

         }
    }

    protected void btnupdate_Click(object sender, EventArgs e)
    {
        using (KrushiSoftDataContext db1 = new KrushiSoftDataContext())
        {
            var exp1 = (from a in db1.mstSubAPMCs where a.SubAPMC_Id == int.Parse(Session["Id"].ToString()) select a).FirstOrDefault();

            exp1.APMC_Id = int.Parse(DropDownList1.SelectedValue);
            exp1.SubAPMC_EngName = txtSubApmc.Text;
            exp1.SubAPMC_Name = txtSbubApmcM.Text;
            exp1.city = DropDownList2.SelectedItem.Text;
            exp1.Flag = Txtflag.Text;
            db1.SubmitChanges();
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "str", "alert (' updated successfully');", true);

            BindData();
        }
    }
 
}