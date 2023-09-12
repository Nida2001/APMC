using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class m_APMC_user_CessA : System.Web.UI.Page
{
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["Heading"] = "Cess-A";
        if (!Page.IsPostBack)
        {


            if (ViewState["records"] == null)
            {
                dt.Columns.Add("Commodity");
                dt.Columns.Add("No Of bags");
                dt.Columns.Add("No Of small bags");
                ViewState["records"] = dt;

            }

            PrintCess.Enabled = false;
            //txtDate.Text = DateTime.Today.ToString("dd/MM/yyyy");
            txtfrmdate.Text = DateTime.Today.ToString("dd/MM/yyyy");
            //txtTodate.Text = DateTime.Today.ToString("dd/MM/yyyy");

            bindpurchaser();
        }
    }


    protected void bindpurchaser()
    {
        using (KrushiSoftDataContext db = new KrushiSoftDataContext())
        {
            var pname = (from s in db.Saudapattis
                         select s.Purchaser_Name).Distinct().ToList();

            drdPurchaserName.DataSource = pname;
            drdPurchaserName.DataBind();
            drdPurchaserName.Items.Insert(0, new ListItem("--Select--", "0"));
        }

    }

    protected void rbtSearch_Cilck(object sender, EventArgs e)
    {

        if (rbtSearch.SelectedItem.Value == "0")
        {
            Label5.Visible = true;
            Label10.Visible = true;
            txtChkNo.Visible = true;
            Label11.Visible = true;
            txtChkDate.Visible = true;
            Label12.Visible = true;
            txtBankName.Visible = true;

        }
        else if (rbtSearch.SelectedItem.Value == "1")
        {
            Label5.Visible = false;
            Label10.Visible = false;
            txtChkNo.Visible = false;
            Label11.Visible = false;
            txtChkDate.Visible = false;
            Label12.Visible = false;
            txtBankName.Visible = false;
        }
    }




    protected void loadpurchasername()
    {
        using (KrushiSoftDataContext db = new KrushiSoftDataContext())
        {
            //var fromDt = (String.Format("{0:YYYY/MM/dd HH:mm:ss}", (txtfrmdate.Text)));

            //var ToDt = String.Format("{0:YYYY/MM/dd HH:mm:ss}", (txtTodate.Text));
            if (txtfrmdate.Text == "")
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(),
                           "str", "alert('Please enter the from date');", true);
            }
            else if(txtToDate.Text=="")
            {

                ScriptManager.RegisterStartupScript(Page, Page.GetType(),
                           "str", "alert('Please enter the Todate');", true);
            }
            else
            {
                //var fromDt = DateTime.Parse(txtfrmdate.Text).ToString("yyyy-dd-MM");
                //var ToDt = DateTime.Parse(txtTodate.Text).ToString("yyyy-dd-MM");

                var query = (from s in db.Saudapattis
                             where s.Date >= Convert.ToDateTime(txtfrmdate.Text) && s.Date <= Convert.ToDateTime(txtToDate.Text)
                             select s.Purchaser_Name).Distinct().ToList();
                if (query.Count == 0)
                {

                    ScriptManager.RegisterStartupScript(Page, Page.GetType(),
                               "str", "alert('No record found between these dates!');", true);
                }
                else
                {
                    drdPurchaserName.DataSource = query;
                    drdPurchaserName.DataBind();
                    drdPurchaserName.Items.Insert(0, new ListItem("--Select--", "0"));
                }

            }

        }//using

    }

    protected void PrintCess_Click(object sender, EventArgs e)
    {
        using (KrushiSoftDataContext db1 = new KrushiSoftDataContext())
        {

            Receipt rp = new Receipt();

            var PNo = (from p in db1.Purchasers
                       where p.PurchaserName == drdPurchaserName.SelectedItem.Text
                       select p.PurchaserNo).FirstOrDefault();

            rp.purchaserNo = PNo;
            rp.purchasername = drdPurchaserName.SelectedItem.Text;
            rp.purchaseAmt = Convert.ToInt32(txtAmount.Text);

            //rp.receiptDate = DateTime.Parse(txtDate.Text);
            rp.receiptMfee = Convert.ToInt32(txtMkFee.Text);
            rp.receiptSfee = Convert.ToInt32(txtSuperVFee.Text);
            rp.totalAmt = Convert.ToInt32(txtTotal.Text);

            if (rbtSearch.SelectedItem.Value == "0")
            {
                rp.chequeNo = txtChkNo.Text;
                rp.chequeBank = txtBankName.Text;
                rp.chequeDate = DateTime.Parse(txtChkDate.Text);
                rp.receiptAmtBy = "Cheque";


            }
            else
            {
                rp.chequeNo = null;
                rp.chequeBank = null;
                rp.receiptAmtBy = "Cheque";
                rp.chequeDate = null;

            }
            if ((txtfrmdate.Text == "" && txtToDate.Text == "") || (txtfrmdate.Text == "" || txtToDate.Text == ""))
            {
                rp.frm_dt = null;
                rp.todate = null;
            }
            else
            {
                rp.frm_dt = Convert.ToDateTime(txtfrmdate.Text);
                rp.todate = Convert.ToDateTime(txtToDate.Text);
            }


            rp.Rec_pass = "A";
            rp.Rec_Cyear = DateTime.Today;
            rp.AgentName = drdPurchaserName.SelectedItem.Text;
            rp.isdelete = false;

            db1.Receipts.InsertOnSubmit(rp);
            db1.SubmitChanges();

            //inserting into dtl_receipt


            var recpNo = (from s in db1.Receipts
                          select s.receiptNo).Max();
            foreach (GridViewRow gr in GvData.Rows)
            {
                dtl_receipt dt = new dtl_receipt();
                dt.receiptno = recpNo;
                dt.commodityname = gr.Cells[0].Text;
                dt.noofbags = int.Parse(gr.Cells[1].Text);
                dt.NoSmallBags = int.Parse(gr.Cells[2].Text);
                dt.Status = true;
                db1.dtl_receipts.InsertOnSubmit(dt);
                db1.SubmitChanges();
            }

            


            //Inserting data on Adv_Receipt table

            Adv_Receipt adr = new Adv_Receipt();
            adr.Adv_Rec_Id = recpNo;
            adr.Adv_Pur_Id = PNo;
            //adr.Adv_Date = Convert.ToDateTime(txtDate.Text);
            adr.Adv_Amt = (txtAdvance.Text);
            adr.Adv_Toal_Amt = txtTotal.Text;
            adr.Adv_Bal = txtBaaki.Text;

            db1.Adv_Receipts.InsertOnSubmit(adr);
            db1.SubmitChanges();


            ScriptManager.RegisterStartupScript(Page, Page.GetType(),
                       "str", "alert('Information Inserted Successfully');", true);
            Refresh();

        }


    }
    protected void Refresh()
    {
        bindpurchaser();
        txtTotal.Text = "";
        txtAmount.Text = "";
        txtMkFee.Text = "";
        txtSuperVFee.Text = "";
        txtAdvance.Text = "";
        GvData.Visible = false;
        txtMagildeyak.Text = "";
        txtChkNo.Text = "";
        txtBaaki.Text = "";
        txtBankName.Text = "";
        //txtDate.Text = "";
        txtfrmdate.Text = "";
        //txtTodate.Text = "";
        txtChkDate.Text = "";
    }

    protected void txtAmount_TextChanged(object sender, EventArgs e)
    {
        using (KrushiSoftDataContext db = new KrushiSoftDataContext())
        {

            var MkFee = (from m in db.Market_Fees
                         where m.MKFee_Name == "Market Fee"
                         select m.MKFee_Prise).FirstOrDefault();
            var SVFee = (from m in db.Market_Fees
                         where m.MKFee_Name == "Supervision Fee"
                         select m.MKFee_Prise).FirstOrDefault();

            txtMkFee.Text = (Convert.ToDouble(txtAmount.Text) * (MkFee / 100)).ToString();
            txtSuperVFee.Text = (Convert.ToDouble(txtAmount.Text) * (SVFee / 100)).ToString();
            txtTotal.Text = (Convert.ToDouble(txtMkFee.Text) + Convert.ToDouble(txtSuperVFee.Text)).ToString();

        }
    }

    


    protected void btnShow_Click(object sender, EventArgs e)
    {

        PrintCess.Enabled = true;
        using (KrushiSoftDataContext db = new KrushiSoftDataContext())
        {
            dt = (DataTable)ViewState["records"];


            var commdities = (from d in db.dtl_Saudapattis
                              join s in db.Saudapattis on d.SaudapattiNo equals s.SaudapattiNo
                              where s.Purchaser_Name == drdPurchaserName.SelectedItem.Text 
                              select d.Commodity).Distinct().ToList();
            var NBags = "";
            var NSBags = "";

            foreach (var i in commdities)
            {

                NBags = (from s in db.Saudapattis
                         join d in db.dtl_Saudapattis on s.SaudapattiNo equals d.SaudapattiNo
                         where s.Purchaser_Name == drdPurchaserName.SelectedItem.Text && d.Commodity == i
                         select d.NoOfBags).Sum().ToString();

                NSBags = (from s in db.Saudapattis
                          join d in db.dtl_Saudapattis on s.SaudapattiNo equals d.SaudapattiNo
                          where s.Purchaser_Name == drdPurchaserName.SelectedItem.Text && d.Commodity == i
                          select d.NoOfSmallBags).Sum().ToString();
                dt.Rows.Add(i, NBags, NSBags);

            }//foeach

            GvData.DataSource = dt;
            GvData.DataBind();
        }//using
    }//btnshow


    protected void txtAdvance_TextChanged(object sender, EventArgs e)
    {
        txtBaaki.Text = (Convert.ToDouble(txtTotal.Text) - (Convert.ToDouble(txtMagildeyak.Text) + Convert.ToDouble(txtAdvance.Text))).ToString();

    }
    protected void txtToDate_TextChanged(object sender, EventArgs e)
    {
        loadpurchasername();
    }
    protected void txtBankName_TextChanged(object sender, EventArgs e)
    {

    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserIndex.aspx");
    }
}