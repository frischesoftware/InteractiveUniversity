using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Kanban : System.Web.UI.Page
{
    dbKanbanGame kbg;
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((dbKanbanGame)Session["DBKanbanGame"] == null)
        {
            createNewKanbanGame("x");
        }
        else  // nur für Development
        {
            createNewKanbanGame("x");
        } 
        if (!IsPostBack)
        {
            DataToClientside(kbg);
        }
    }

    private void DataToClientside(dbKanbanGame kbg)
    {
        Random r = new Random();
        string server_elements = "var server_elements = "; //[
        string x ="";
        foreach (var _element in kbg.dbKanbanElement)
        {
            server_elements += (from k in kbg.dbKanbanElement select k.element_visualization).FirstOrDefault().ToString();
            /*
            server_elements += "{ element_name : '" + _element.ElementName + "'" +
                            ", element_visualization : '" + _element.element_visualization + "'" +
                            ", force : '1'" +
                            "},";
             */
        }
        //server_elements = server_elements.Substring(0, server_elements.Length - 1) + "];";
        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "key", server_elements, true);
    }

    private void createNewKanbanGame(string gametype)
    {
        using (InteractiveUniversityEntities1 iu = new InteractiveUniversityEntities1())
        {
            kbg = new dbKanbanGame();
            kbg.Initialize(gametype);
            // Save in Database like in FiveForces.cs
        }
    }
}