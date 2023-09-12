using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PASSWORDSVR;

public partial class m_APMC_user_ChangePassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["Heading"] = "Change Password";
    }

    protected void ibtnRegister_Click(object sender, ImageClickEventArgs e)
    {
        Changepwd();
    }

    private void Changepwd()
    {
        int LoginUser = int.Parse(Session["UserId"].ToString());
        using (KrushiSoftDataContext db = new KrushiSoftDataContext())
        {
           // var pwd = (from p in db.LoginIds where p.UserId == (int)Session["UserId"] select p).FirstOrDefault();
            var pwd = (from p in db.LoginUsers where p.UserId == (int)Session["UserId"] select p).FirstOrDefault();
            var pas = pwd.Log_Password.ToString();
            Password objP = new Password("dotamt");
            String pd = objP.EncryptPassword(txtPassword.Text.Trim());
            String pd1 = objP.EncryptPassword(txtPassword1.Text.Trim());
            if (pas == pd)
            {
                pwd.Log_Password = pd1;
                db.SubmitChanges();
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "str", "alert('Your New Password Update Successfully.');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "str", "alert('Please Insert Correct Old-Password.');", true);
            }
        }
    }

    protected void ibtnRCancel_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/m_APMC/Usertype/Default.aspx");
    }
}