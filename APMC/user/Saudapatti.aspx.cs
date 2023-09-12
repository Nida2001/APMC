using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class m_APMC_user_Saudapatti : System.Web.UI.Page
{
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["heading"] = "Saudapatti";
        if (!Page.IsPostBack)
        {
            if (ViewState["records"] == null)
            {
                dt.Columns.Add("Commodity");
                dt.Columns.Add("Prat");
                dt.Columns.Add("Result Kg/Qtl");
                dt.Columns.Add("Rate");
                dt.Columns.Add("No Of bags");
                dt.Columns.Add("No Of Small Bags");
                dt.Columns.Add("Remark");

                ViewState["records"] = dt;


            }
            using (KrushiSoftDataContext db = new KrushiSoftDataContext())
            {
                var Cnt = (from s in db.Saudapattis
                           select s).Count();
                if (Cnt > 0)
                {
                    var sno = (from s in db.Saudapattis
                               select s.SaudapattiNo).Max();
                    txtRecNo.Text = (sno + 1).ToString();
                }
                else
                {
                    txtRecNo.Text = "1";
                }

            }
            btnSave.Enabled = false;
            txtDate.Text = DateTime.Today.ToString("dd/MM/yyyy");
            bindpurchaser();
            bindCommodity();
            bindAgent();
            bindFarmer();


        }//postback

    }

    private void bindFarmer()
    {
        using (KrushiSoftDataContext db = new KrushiSoftDataContext())
        {
            var Fname = (from a in db.avaks
                         select a.farmer_name).Distinct().ToList();

            //drdFarmer.DataTextField = "farmer_name";
            // drdFarmer.DataValueField = "avakID";
            drdFarmer.DataSource = Fname;
            drdFarmer.DataBind();
            drdFarmer.Items.Insert(0, new ListItem("--Select--", "0"));
        }
    }

    private void bindAgent()
    {
        using (KrushiSoftDataContext db = new KrushiSoftDataContext())
        {
            var AgentName = (from a in db.Agents
                             where a.AgentFlag == "AG"
                             select new { a.AgentName, a.AgentNo }).ToList();
            drdAgent.DataTextField = "AgentName";
            drdAgent.DataValueField = "AgentNo";
            drdAgent.DataSource = AgentName;
            drdAgent.DataBind();
            drdAgent.Items.Insert(0, new ListItem("--Select--", "0"));
        }
    }

    private void bindCommodity()
    {
        using (KrushiSoftDataContext db = new KrushiSoftDataContext())
        {
            var commName = (from s in db.mstCommodities
                            select new { s.ComId, s.ComName }).ToList();
            drdCommodity.DataTextField = "ComName";
            drdCommodity.DataValueField = "ComId";
            drdCommodity.DataSource = commName;
            drdCommodity.DataBind();
            drdCommodity.Items.Insert(0, new ListItem("--Select--", "0"));
        }
    }

    private void bindpurchaser()
    {
        using (KrushiSoftDataContext db = new KrushiSoftDataContext())
        {
            var pname = (from s in db.Purchasers
                         select new { s.PurchaserNo, s.PurchaserName }).ToList();
            drdPurchaser.DataTextField = "PurchaserName";
            drdPurchaser.DataValueField = "PurchaserNo";
            drdPurchaser.DataSource = pname;
            drdPurchaser.DataBind();
            drdPurchaser.Items.Insert(0, new ListItem("--Select--", "0"));
        }

    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        btnSave.Enabled = true;
        dt = (DataTable)ViewState["records"];
        dt.Rows.Add(drdCommodity.SelectedItem.Text, txtPrat.Text, txtQtl.Text, txtDar.Text, txtNoOfBags.Text, txtNoOFSmallBags.Text, txtRemark.Text);
        gvData.DataSource = dt;
        gvData.DataBind();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        using (KrushiSoftDataContext db = new KrushiSoftDataContext())
        {

            //inserting in saudapatti

            Saudapatti s = new Saudapatti();
            s.Agent_Name = drdAgent.SelectedItem.Text;
            s.Purchaser_Name = drdPurchaser.SelectedItem.Text;
            s.City_Name = txtCity.Text;
            s.Remark = txtRemark.Text;
            s.Date = Convert.ToDateTime(txtDate.Text);
            s.farmerNam = drdFarmer.SelectedItem.Text;
            db.Saudapattis.InsertOnSubmit(s);
            db.SubmitChanges();

            //inserting in dtl_saudapatti

            foreach (GridViewRow gr in gvData.Rows)
            {
                dtl_Saudapatti dl = new dtl_Saudapatti();
                var sno = (from sd in db.Saudapattis
                           select sd.SaudapattiNo).Max();
                dl.SaudapattiNo = sno;
                dl.Commodity = gr.Cells[0].Text;
                dl.Quantity = gr.Cells[1].Text;
                dl.Weight = gr.Cells[2].Text;
                dl.Rate = gr.Cells[3].Text;
                dl.NoOfBags = int.Parse(gr.Cells[4].Text);
                dl.NoOfSmallBags = int.Parse(gr.Cells[5].Text);
                dl.Remark = gr.Cells[6].Text;
                db.dtl_Saudapattis.InsertOnSubmit(dl);
                db.SubmitChanges();
            }//foreach
            ScriptManager.RegisterStartupScript(Page, Page.GetType(),
                          "str", "alert('Information Inserted Successfully');", true);

            Refresh();

        }//using

    }

    private void Refresh()
    {
        using (KrushiSoftDataContext db = new KrushiSoftDataContext())
        {
            txtDate.Text = "";
            bindpurchaser();
            bindCommodity();
            bindAgent();
            bindFarmer();
            txtCity.Text = "";
            txtQtl.Text = "";
            txtDar.Text = "";
            txtPrat.Text = "";
            txtRemark.Text = "";
            var recno = (from s in db.Saudapattis select s.SaudapattiNo).Max();
            txtRecNo.Text = (recno + 1).ToString();

            gvData.Visible = false;

           
        }
    }
    protected void btnClose_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserIndex.aspx");
    }
}