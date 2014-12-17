using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Games_BostonBox_Startseite : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_dog_Click(object sender, EventArgs e)
    {
        Session["BB_selected_Game"] = "DOG TUTORIAL";
        Response.Redirect("BostonBox2.aspx");
    }
    protected void Button_cc_Click(object sender, EventArgs e)
    {
        Session["BB_selected_Game"] = "CASH COW TUTORIAL";
        Response.Redirect("BostonBox2.aspx");
    }
    protected void Button_qm_Click(object sender, EventArgs e)
    {
        Session["BB_selected_Game"] = "QUESTIONMARK TUTORIAL";
        Response.Redirect("BostonBox2.aspx");
    }
    protected void Button_star_Click(object sender, EventArgs e)
    {
        Session["BB_selected_Game"] = "STAR TUTORIAL";
        Response.Redirect("BostonBox2.aspx");
    }
    protected void Button_CCQM_Click(object sender, EventArgs e)
    {
        Session["BB_selected_Game"] = "CASH COW AND QUESTIONMARK";
        Response.Redirect("BostonBox2.aspx");
        
    }
    protected void Button_3CCQM_Click(object sender, EventArgs e)
    {
        Session["BB_selected_Game"] = "CASH COW AND THREE QUESTIONMARKS";
        Response.Redirect("BostonBox2.aspx");
    }
    protected void Button_GamePlayMode_Click(object sender, EventArgs e)
    {
        Session["BB_selected_Game"] = "NORMAL GAME";
        Response.Redirect("BostonBox2.aspx");
    }
}