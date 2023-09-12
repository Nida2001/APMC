using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class m_APMC_user_Katapatti : System.Web.UI.Page
{
    DataTable dt = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        Session["Heading"] = "Katapatti";
        if (!Page.IsPostBack)
        {
            frmTare.Visible = false;
            frmGross.Visible = true;

            Session["Heading"] = "Katapatti";
            if (ViewState["Records"] == null)
            {
                dt.Columns.Add("Commodity");
                dt.Columns.Add("Rate");
                dt.Columns.Add("SmallBag");
                dt.Columns.Add("Bag");
                dt.Columns.Add("TotalKg");
                ViewState["Records"] = dt;
            }
            using (KrushiSoftDataContext db = new KrushiSoftDataContext())
            {
                var data = (from s in db.Weight_Masters
                            select s.mstWtNo).Count();
                if (data == 0)
                {

                    txtTareWtRecNo.Text = (data + 1).ToString();
                }
                else
                {
                    var WtRNo = (from s in db.Weight_Masters
                                 select s.mstWtNo).Max();
                    txtTareWtRecNo.Text = (WtRNo + 1).ToString();
                }
            }
            btnSave.Enabled = false;
            frmGross.Visible = true;
            frmTare.Visible = false;
            txtAKDate.Text = DateTime.Today.ToString("dd/MM/yyyy");
            ReceiptNo();
            bindAgent();
            bindpur();
            bindmMeasure(); //Mapari
            // BindCommodity();
            bindFarmer();
            BindVehType();
        }
    }

    protected void bindAgent()
    {
        using (KrushiSoftDataContext db = new KrushiSoftDataContext())
        {
            var agent = (from a in db.Agents
                         where a.AgentFlag == "AG"
                         select new { a.AgentName, a.AgentNo }).ToList();
            ddlAgentName.DataTextField = "AgentName";
            ddlAgentName.DataValueField = "AgentNo";
            ddlAgentName.DataSource = agent;
            ddlAgentName.DataBind();
            ddlAgentName.Items.Insert(0, new ListItem("--Select--", "0"));
        }
    }
    protected void bindpur()
    {
        using (KrushiSoftDataContext db = new KrushiSoftDataContext())
        {
            var pur = (from s in db.Receipts select s.purchasername).Distinct().ToList();
           // ddlPurchaser.DataTextField = "PurchaserName";
           // ddlPurchaser.DataValueField = "PurchaserNo";
            ddlPurchaser.DataSource = pur;
            ddlPurchaser.DataBind();
            ddlPurchaser.Items.Insert(0, new ListItem("--Select--", "0"));
        }
    }
    protected void bindmMeasure()
    {
        using (KrushiSoftDataContext db = new KrushiSoftDataContext())
        {
            var mapari = (from a in db.Agents where a.AgentFlag == "MP" select a.AgentName).Distinct().ToList();
            //ddlMeasurer.DataTextField = "AgentName";
            //ddlMeasurer.DataValueField = "AgentNo";
            ddlMeasurer.DataSource = mapari;
            ddlMeasurer.DataBind();
            ddlMeasurer.Items.Insert(0, new ListItem("--Select--", "0"));

        }
    }
   protected void BindCommodity()
    {
        using (KrushiSoftDataContext db = new KrushiSoftDataContext())
        {

            var CommdName = (from c in db.dtl_Saudapattis
                             where c.SaudapattiNo == int.Parse(txtsaudapatti.Text)
                             select c.Commodity).ToList();
            ddlcomodity.DataSource = CommdName;
            ddlcomodity.DataBind();
            ddlcomodity.Items.Insert(0, new ListItem("--Select--", "0"));

        }

    }
    protected void bindFarmer()
    {
        using (KrushiSoftDataContext db = new KrushiSoftDataContext())
        {
            var Fname = (from n in db.Saudapattis select new { n.farmerNam, n.SaudapattiNo }).ToList();

            ddlFarmer.DataTextField = "farmerNam";
            ddlFarmer.DataValueField = "SaudapattiNo";
            ddlFarmer.DataSource = Fname;
            ddlFarmer.DataBind();
            ddlFarmer.Items.Insert(0, new ListItem("--Select--", "0"));

        }
    }

    protected void ReceiptNo()
    {
        using (KrushiSoftDataContext db = new KrushiSoftDataContext())
        {

            var data = (from a in db.Katapattis select a).Count();
            if (data > 0)
            {
                var exp = (from s in db.Katapattis select s.ReciNo).Max();
                txtPavatiNo.Text = ((exp) + 1).ToString();
            }
            else
            {
                txtPavatiNo.Text = ((data) + 1).ToString();
            }
        }
    }
    

    protected void txtTotalQKilo_TextChanged1(object sender, EventArgs e)
    {

    }


    protected void btnSave_Click1(object sender, EventArgs e)
    {
        using (KrushiSoftDataContext db = new KrushiSoftDataContext())
        {
            Katapatti k = new Katapatti();
           
            k.BookNo = TxtBookNo.Text;
            k.Agent_Name = ddlAgentName.SelectedItem.ToString();
            k.Pur_Name = ddlPurchaser.SelectedItem.ToString();
            k.Shetakari_Name = ddlFarmer.SelectedItem.ToString();
            k.Mapari = ddlMeasurer.SelectedItem.ToString();
            k.dt = DateTime.Parse(txtAKDate.Text);
            k.PurchaseTotalAmt = TxtTotalRate.Text;
            k.MarketFee = Txtmarketfee.Text;
            k.SupervisionFee = TxtsupFee.Text;
            k.TotalAmt = TxtPrice.Text;
            k.Flag = "A";
            k.VehicalNo = Txtvehno.Text;
            k.place = txtPlace.Text;
            //k.Cancel = "";
            //k.Status = "";
            db.Katapattis.InsertOnSubmit(k);
            db.SubmitChanges();


            var recno = (from kt in db.Katapattis select kt.ReciNo).Max();
            foreach (GridViewRow gv in gvData.Rows)
            {
                dtl_Katapatti exp = new dtl_Katapatti();
                exp.ReciNo = recno;
                exp.CommodityName = gv.Cells[0].Text;
                exp.Rate = gv.Cells[1].Text;
                exp.SmallBag = gv.Cells[2].Text;
                exp.Bags = gv.Cells[3].Text;
                exp.TotalKg = gv.Cells[4].Text;
                exp.Qty = TxtQty.Text;
                exp.Kg = Txtkilo.Text;
                exp.Bhrati = Txtbharati.Text;
                exp.Quintal = Txtquintal.Text;
                db.dtl_Katapattis.InsertOnSubmit(exp);
                db.SubmitChanges();

            }
            ScriptManager.RegisterStartupScript(Page, Page.GetType(),
                   "str", "alert('Information Inserted Successfully');", true);
            GrossRefresh();

        }

    }

    protected void GrossRefresh() {
        using (KrushiSoftDataContext db = new KrushiSoftDataContext())
        {
            TxtBookNo.Text = "";
            txtAKDate.Text = "";
            bindAgent();
            bindpur();
            BindCommodity();
            bindmMeasure();
            txtPlace.Text = "";
            Txtvehno.Text = "";
            Txtbharati.Text = "";
            txtRate.Text = "";
            TxtTotalRate.Text = "";
            Txtmarketfee.Text = "";
            TxtsupFee.Text = "";
            txtSmallbag.Text = "";
            txtBag.Text = "";
            TxtQty.Text = "";
            Txtquintal.Text = "";
            Txtkilo.Text = "";
            txtTotalQKilo.Text = "";
            gvData.Visible = false;
            txtsaudapatti.Text = "";
            TxtPrice.Text = "";
            var Sno = (from s in db.Katapattis
                       select s.ReciNo).Max();
            txtPavatiNo.Text = (Sno + 1).ToString();
        }

    }

    protected void txtsaudapatti_TextChanged(object sender, EventArgs e)
    {
        BindCommodity();
        using (KrushiSoftDataContext db = new KrushiSoftDataContext())
        {
            var data = (from s in db.Saudapattis where s.SaudapattiNo == int.Parse(txtsaudapatti.Text) select s).FirstOrDefault();
            if (data == null)
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(),
             "str", "alert('Enter a valid saudapatti number');", true);
            }
            else
            {
                ddlAgentName.SelectedItem.Text = data.Agent_Name;
                ddlPurchaser.SelectedItem.Text = data.Purchaser_Name;
                ddlFarmer.SelectedItem.Text = data.farmerNam;
            }

        }
    }
    protected void txtBag_TextChanged(object sender, EventArgs e)
    {
        using (KrushiSoftDataContext db = new KrushiSoftDataContext())
        {
            TxtQty.Text = (int.Parse(txtSmallbag.Text) + int.Parse(txtBag.Text)).ToString();

        }
    }
    protected void Txtquintal_TextChanged(object sender, EventArgs e)
    {
        Txtkilo.Text = (Convert.ToDouble(Txtquintal.Text) * 100).ToString();
        txtTotalQKilo.Text = Txtkilo.Text;


    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        btnSave.Enabled = true;
        using (KrushiSoftDataContext db = new KrushiSoftDataContext())
        {
            dt = (DataTable)ViewState["Records"];
            dt.Rows.Add(ddlcomodity.SelectedItem.Text, txtRate.Text, txtSmallbag.Text, txtBag.Text, txtTotalQKilo.Text);
            gvData.DataSource = dt;
            gvData.DataBind();
        }
    }
    protected void btnTare_Click(object sender, EventArgs e)
    {
        frmGross.Visible = false;
        frmTare.Visible = true;
    }

     protected void BindVehType()
    {
        using (KrushiSoftDataContext db = new KrushiSoftDataContext())
        {
            var vtype = (from p in db.ParameterMasters
                         where p.ReferenceID == "VH"
                         select new { p.Description, p.ParamId }).ToList();
            drdTareVehicleType.DataTextField = "Description";
            drdTareVehicleType.DataValueField = "ParamId";
            drdTareVehicleType.DataSource = vtype;
            drdTareVehicleType.DataBind();
            drdTareVehicleType.Items.Insert(0, new ListItem("--SELECT--", "0"));

        }
    }
    protected void btnconvert_Click(object sender, EventArgs e)
    {
        txtVKg.Text = (Convert.ToDouble(txtVQtl.Text) * 100).ToString();
    }
    protected void btnTareSave_Click(object sender, EventArgs e)
    {
        using (KrushiSoftDataContext db = new KrushiSoftDataContext())
        {
            Weight_Master wm = new Weight_Master();
            wm.Wt_Veh_type = drdTareVehicleType.SelectedItem.Text;
            wm.Wt_Veh_No = txtTareVehicleNO.Text;
            wm.Wt_U_load_veh = txtVKg.Text;
            db.Weight_Masters.InsertOnSubmit(wm);
            db.SubmitChanges();
            ScriptManager.RegisterStartupScript(Page, Page.GetType(),
              "str", "alert('Information submitted successfully.');", true);

            TareRefresh();

        }//using
    }

    protected void TareRefresh()
    {
        using (KrushiSoftDataContext db = new KrushiSoftDataContext())
        {
            txtTareVehicleNO.Text = "";
            drdTareVehicleType.SelectedItem.Text = "";
            var rno = (from s in db.Weight_Masters select s.mstWtNo).Max();
            txtTareWtRecNo.Text = rno.ToString();
            txtVKg.Text = "";
            txtVQtl.Text = "";

        }
    }
    protected void btnTareClose_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/m_APMC/user/Katapatti.aspx");
    }
    protected void btnGross_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(Page, Page.GetType(),
                 "str", "alert('Please fill the required details for gross');", true);
    }




    protected void TxtTotalRate_TextChanged(object sender, EventArgs e)
    {
        using (KrushiSoftDataContext db = new KrushiSoftDataContext())
        {

            var MkFee = (from m in db.Market_Fees
                         where m.MKFee_Name == "Market Fee"
                         select m.MKFee_Prise).FirstOrDefault();

            var SVFee = (from m in db.Market_Fees
                         where m.MKFee_Name == "Supervision Fee"
                         select m.MKFee_Prise).FirstOrDefault();

            Txtmarketfee.Text = (Convert.ToDouble(TxtTotalRate.Text) * (MkFee / 100)).ToString();
            TxtsupFee.Text = (Convert.ToDouble(TxtTotalRate.Text) * (SVFee / 100)).ToString();
            TxtPrice.Text = (Convert.ToDouble(Txtmarketfee.Text) + Convert.ToDouble(TxtsupFee.Text)).ToString();

        }
    }
    protected void btnClose_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserIndex.aspx");
    }
    protected void ddlMeasurer_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}