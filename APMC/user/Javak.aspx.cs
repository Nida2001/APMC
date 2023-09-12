using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class m_APMC_user_FrmJavak : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["Heading"] = "Javak";

    }

    protected void PopulateData()
    {

        using (KrushiSoftDataContext db = new KrushiSoftDataContext())
        {
            if (txtgtpassNo.Text == "")
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(),
                               "str", "alert('Enter a gatepass Number');", true);
            }//mainIf
            else
            {
                var c =(from kt in db.Katapattis
                         where kt.ReciNo == int.Parse(txtgtpassNo.Text) && kt.Flag == "A"
                         select kt).Count();
                var pdata =(from k in db.Katapattis
                             where k.ReciNo == int.Parse(txtgtpassNo.Text) && k.Flag == "A"
                             select k).FirstOrDefault();

                if (c > 0)
                {
                    txtDate.Text = Convert.ToDateTime(pdata.dt).ToString("dd/MM/yyyy");
                    txtPurchaser.Text = pdata.Pur_Name;
                    txtVehicleNo.Text = pdata.VehicalNo;
                    txtPlace.Text = pdata.place;

                    var Comm = (from d in db.dtl_Katapattis
                                where d.ReciNo == int.Parse(txtgtpassNo.Text)
                                select d).ToList();
                    GvData.Visible = true;
                    GvData.DataSource = Comm;
                    GvData.DataBind();

                }//subif

                else
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(),
                               "str", "alert('Enter a valid gatepass Number');", true);

                }//subelse
            }//Main else
      }//using
  }//pupulate data





    protected void btnClose_Click(object sender, EventArgs e)
    {
       Response.Redirect("UserIndex.aspx");
    }



    protected void txtgtpassNo_TextChanged(object sender, EventArgs e)
    {
        PopulateData();
    }


    protected void btnSave_Click(object sender, EventArgs e)
    {
        using (KrushiSoftDataContext db = new KrushiSoftDataContext())
        {

            var data = (from k in db.Katapattis
                        where k.ReciNo == int.Parse(txtgtpassNo.Text)
                        select k).FirstOrDefault();

            data.Flag = "J";
            db.SubmitChanges();
            ScriptManager.RegisterStartupScript(Page, Page.GetType(),
                       "str", "alert('Information Inserted Successfully');", true);
            refresh();
        }
    }



    protected void refresh()
    {

        txtgtpassNo.Text = "";
        txtPlace.Text = "";
        txtDate.Text = "";
        txtVehicleNo.Text = "";
        txtPurchaser.Text = "";
        GvData.Visible = false;
    }
}