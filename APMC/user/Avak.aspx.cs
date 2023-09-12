using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class m_APMC_user_Avak : System.Web.UI.Page
{
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {

        Session["Heading"] = "Avak";
        if (!Page.IsPostBack)
        {

            if (ViewState["Records"] == null)
            {
                dt.Columns.Add("Commodity");
                dt.Columns.Add("Bags");
                dt.Columns.Add("Small Bags");
                dt.Columns.Add("Remark");
                ViewState["Records"] = dt;
            }
            txtAKDate.Text = DateTime.Today.ToString("dd/MM/yyyy");
            btnSave.Enabled = false;
            BindAgent();
            BindCommodity();
            BindVehType();

        }
    }

    protected void BindVehType()
    {
        using (KrushiSoftDataContext db = new KrushiSoftDataContext())
        {
            var vtype = (from p in db.ParameterMasters
                         where p.ReferenceID == "VH"
                         select new { p.Description, p.ParamId }).ToList();
            drdVehicleType.DataTextField = "Description";
            drdVehicleType.DataValueField = "ParamId";
            drdVehicleType.DataSource = vtype;
            drdVehicleType.DataBind();
            drdVehicleType.Items.Insert(0, new ListItem("--Select--", "0"));

        }
    }

    private void BindCommodity()
    {
        using (KrushiSoftDataContext db = new KrushiSoftDataContext())
        {

            var CommdName = (from c in db.mstCommodities
                             select new { c.ComName, c.ComId }).ToList();

            drdCommodity.DataTextField = "ComName";
            drdCommodity.DataValueField = "ComId";
            drdCommodity.DataSource = CommdName;
            drdCommodity.DataBind();
            drdCommodity.Items.Insert(0, new ListItem("--Select--", "0"));

        }
    }

    private void BindAgent()
    {
        using (KrushiSoftDataContext db = new KrushiSoftDataContext())
        {

            var AName = (from a in db.Agents
                         where a.AgentFlag=="AG"
                         select new { a.AgentName, a.AgentNo }).ToList();
            drdAgent.DataTextField = "AgentName";
            drdAgent.DataValueField = "AgentNo";
            drdAgent.DataSource = AName;
            drdAgent.DataBind();
            drdAgent.Items.Insert(0, new ListItem("--Select--", "0"));
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (drdCommodity.SelectedItem.Text == "--Select--")
        {

            ScriptManager.RegisterStartupScript(Page, Page.GetType(),
                                  "str", "alert('Please Select The Commodity');", true);
        }
        else
        {
            btnSave.Enabled = true;
            dt = (DataTable)ViewState["Records"];
            dt.Rows.Add(drdCommodity.SelectedItem.Text, txtNoBags.Text, txtNoSmallBags.Text, txtRemark.Text);
            GvData.DataSource = dt;
            GvData.DataBind();
        }
    }

    protected void btnClose_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserIndex.aspx");
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        using (KrushiSoftDataContext db = new KrushiSoftDataContext())
        {
            //inserting into avak table
            avak ak = new avak();
            ak.farmer_name = txtFarmerName.Text;
            ak.Ak_Agent = drdAgent.SelectedItem.Text;
            ak.typeofvehicle = drdVehicleType.SelectedItem.Text;
            ak.vehiclenumber = txtVehicleNo.Text;
            ak.mobilenumber = txtMobileNo.Text;
            ak.date = txtAKDate.Text;
            ak.Avak_Place = txtPlace.Text;
            ak.Remark = txtRemark.Text;
            db.avaks.InsertOnSubmit(ak);
            db.SubmitChanges();

            //Inserting into dtl_avak table
            var id = (from a in db.avaks
                      //where a.farmer_name == txtFarmerName.Text
                      select a.avakID).Max();

            foreach (GridViewRow gr in GvData.Rows)
            {
                dtl_Avak dak = new dtl_Avak();
                dak.Ak_Comm = gr.Cells[0].Text;
                dak.Ak_No_Bag = int.Parse(gr.Cells[1].Text);
                dak.Ak_NoSmall_Bag = int.Parse(gr.Cells[2].Text);
                dak.Remark = gr.Cells[3].Text;
                dak.avakID = id;
                db.dtl_Avaks.InsertOnSubmit(dak);
                db.SubmitChanges();
            }

            ScriptManager.RegisterStartupScript(Page, Page.GetType(),
                               "str", "alert('Information Inserted Successfully');", true);
            Refresh();
        }
    }

    protected void Refresh()
    {
        txtFarmerName.Text = "";
        txtMobileNo.Text = "";
        txtPlace.Text = "";
        txtRemark.Text = "";
        txtNoBags.Text = "";
        txtAKDate.Text = "";
        txtNoSmallBags.Text = "";
        BindCommodity();
        BindAgent();
        GvData.Visible = false;
        txtVehicleNo.Text = "";
        BindVehType();
    }
}