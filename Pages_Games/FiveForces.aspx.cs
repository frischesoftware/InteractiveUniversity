using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;
using Newtonsoft.Json;
public partial class FiveForces : System.Web.UI.Page
{
    dbFFGame ffg;
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((dbFFGame)Session["DBFFGame"] == null)
      //  if(true)
        {
            createNewFFGame("positive_market");
        }
        else
        {
            createNewFFGame("positive_market");  // DEV
          //  ffg = (dbFFGame)Session["DBFFGame"];
        }
        if (!IsPostBack)
        {
            ProcessAjaxRequest();
            DataToClientside(ffg); //ffg
        }
        else //im Zusammenhang mit Save-Button -> Die Daten zum Aufbau der Bilder müssen wieder übertragen werden, oder aber im ViewState gespeichert werden
        {
            DataToClientside(ffg); //ffg
        }

    }

    private void ProcessAjaxRequest()
    {
        if (Request.ContentType.Contains("json") && Request.QueryString["Save"] != null)
            SaveMyData();
    }
    private void SaveMyData()
    {
        System.IO.StreamReader sr = new System.IO.StreamReader(Request.InputStream);
        string line = "";
        line = sr.ReadToEnd();
        JavaScriptSerializer js = new JavaScriptSerializer();
        var x = js.Deserialize<List<FFVerdict>>(line);

        Response.Write("ok");
        /*

        Response.Write((string)jo["CategoryID"]); //this send to responseText of .ajax(options).responseText


        */

    }



    public void createNewFFGame(string gametype)
    {
        using (InteractiveUniversityEntities1 iu = new InteractiveUniversityEntities1())
        {
            ffg = new dbFFGame();
            ffg.Initialize(gametype);
            iu.dbFFGame.Add(ffg);
            iu.SaveChanges();
        }
        Session["DBFFGame"] = ffg;
    }

    private void DataToClientside(dbFFGame ffg)
    {
        Random r = new Random();
        // dieser hier ist für die Faktoren
        string server_factors = "var server_factors = [";
        foreach (var _factor in ffg.dbFFFactor)
        {
            server_factors += "{ force_shortname : '" + _factor.force_shortname + "'" +
                              ", force_fullname : '" + _factor.force_fullname + "'" +
                              ", factor_shortname : '" + _factor.factor_shortname + "'" +
                              ", factor_fullname : '" + _factor.factor_fullname + "'" +
                              ", factor_auspraegung : '" + _factor.factor_auspraegung + "'" +
                              ", factor_visualization : '" + _factor.factor_visualization + "'" +
                              ", factor_hiddenTextId : 'hiddenTextForBackend_" + _factor.factor_shortname + "'" +
                              "},";
        }        
        server_factors = server_factors.Substring(0, server_factors.Length - 1) + "];";
    
        // dieser hier ist für die Tabs und Subtabs
        string server_fiveforces = "var server_fiveforces = [";
        server_fiveforces = server_fiveforces + "{css_id : 'tabs-1', forcetype : 'RIV', title : 'intensity of competitive rivalry', a : 'similar competitors', b : 'slow growth', c: 'high fixed costs_server_fiveforces', d : 'many competitors', e : 'strategic risks', f : 'exit barriers'}," +
                                                "{css_id : 'tabs-2', forcetype : 'ENT', title : 'threat of entry', a : 'economies of scale', b : 'differentiation', c : 'capital requirements', d : 'switching cost', e : 'access to distribution channels', f : 'cost disadvantages independent of scale'}," +
                                                "{css_id : 'tabs-3', forcetype : 'SUP', title : 'bargaining power of suppliers', a: 'fewer_supplier_than_buyers', b : 'substitution is hard', c: 'buyer not an important customer', d : 'switching costs high', e : 'supplier threatens with forward integration', f : '-'}," +
                                                "{css_id : 'tabs-4', forcetype : 'BUY', title : 'bargaining power of buyers'}," +
                                                "{css_id : 'tabs-5', forcetype : 'SUB', title : 'threat of substitutes'}";
        server_fiveforces += "];";

        // move_y:  .move(35, (180 / links2.length + 1) * (i + 1) - 5);
        //string server_sup1 = "var server_sup1 = [";
        //server_sup1 +=
        //    "{ force : 'SUP1', shape: 'rect', x : 200, y : 200, color: '#ccc', move_x : 10, move_y : 10}," +
        //    "{ force : 'SUP1', shape: 'circle', size : 20, color: '#eee', move_x : 35, move_y : 32}," +
        //    "{ force : 'SUP1', shape: 'circle', size : 20, color: '#eee', move_x : 35, move_y : 69}," +
        //    "{ force : 'SUP1', shape: 'circle', size : 20, color: '#f03', move_x : 35, move_y : 106}," +
        //    "{ force : 'SUP1', shape: 'circle', size : 20, color: '#eee', move_x : 35, move_y : 143}," +
        //    "{ force : 'SUP1', shape: 'circle', size : 20, color: '#eee', move_x : 35, move_y : 180}," +
        //    "{ force : 'SUP1', shape: 'line', x1: 0, y1: 0, x2: 0, y2: 200, stroke : 1, color: '#000', move_x : 80, move_y : 10}," +
        //    "{ force : 'SUP1', shape: 'line', x1: 0, y1: 0, x2: 0, y2: 200, stroke : 1, color: '#000', move_x : 140, move_y : 10}";
        //server_sup1 += "]; ";
        
        //string server_sup3 = "var server_sup3 = [";
       
        //server_sup3 +=
        //    "{ force : 'SUP3', shape: 'rect', x : 200, y : 200, color: '#ccc', move_x : 10, move_y : 10}," +
        //    "{ force : 'SUP3', shape: 'line', x1: 0, y1: 100, x2: 210, y2: 100, stroke : 1, color: '#000'}," +
        //    "{ force : 'SUP3', shape: 'circle', size : 20, color: '#eee', move_x : 35, move_y : 32}," +
        //    "{ force : 'SUP3', shape: 'circle', size : 20, color: '#eee', move_x : 35, move_y : 69}," +
        //     "{ force : 'SUP3', shape: 'circle', size : 20, color: '#f03', move_x : 35, move_y : 106}," +
        //     "{ force : 'SUP3', shape: 'circle', size : 20, color: '#eee', move_x : 35, move_y : 143}," +
        //     "{ force : 'SUP3', shape: 'circle', size : 20, color: '#eee', move_x : 35, move_y : 180}," +
        //    "{ force : 'SUP3', shape: 'polygon', fill : 'blue', width : 1, points: ['0," + r.Next(9, 14).ToString() + "', '10," + r.Next(5, 14).ToString() + "', '5," + r.Next(5, 14).ToString() + "'], move_x : 140, move_y : 32}," +
        //    "{ force : 'SUP3', shape: 'polygon', fill : 'blue', width : 1, points: ['0," + r.Next(9, 14).ToString() + "', '10," + r.Next(5, 14).ToString() + "', '5," + r.Next(5, 14).ToString() + "'], move_x : 140, move_y : 69}," +
        //    "{ force : 'SUP3', shape: 'polygon', fill : 'blue', width : 1, points: ['0," + r.Next(9, 14).ToString() + "', '10," + r.Next(5, 14).ToString() + "', '5," + r.Next(5, 14).ToString() + "'], move_x : 140, move_y : 106}," +
        //    "{ force : 'SUP3', shape: 'polygon', fill : 'blue', width : 1, points: ['0," + r.Next(9, 14).ToString() + "', '10," + r.Next(5, 14).ToString() + "', '5," + r.Next(5, 14).ToString() + "'], move_x : 140, move_y : 143}," +
        //    "{ force : 'SUP3', shape: 'polygon', fill : 'blue', width : 1, points: ['0," + r.Next(9, 14).ToString() + "', '10," + r.Next(5, 14).ToString() + "', '5," + r.Next(5, 14).ToString() + "'], move_x : 140, move_y : 180},";

        //server_sup3 += "]; ";

        //string obj = "var obj = [";
        //foreach (var f in ffg.dbFFFactor)
        //{            
        //    obj += "{ " +

        //        "factor_auspraegung: '" + f.factor_auspraegung + "'" +
        //        ", factor_fullname: '" + f.factor_fullname + "'" +
        //        ", factor_shortname: '" + f.factor_shortname + "'" +
        // ", factor_visualization: '" + f.factor_visualization + "'" +
        // "},";
        //}
        //obj = generiereAbschluss(obj);

        string[] allAvailableFactors = {   "RIV1","RIV2","RIV3","RIV4","RIV5","RIV6",
                                           "ENT1","ENT2","ENT3","ENT4","ENT5","ENT6",
                                           "SUP1","SUP2","SUP3","SUP4","SUP5", "SUP6",
                                           "BUY1","BUY2","BUY3","BUY4","BUY5","BUY6",
                                           "SUB1","SUB2","SUB3","SUB4", "SUB5", "SUB6" };
        # region  riv
        string server_riv1 = "var server_riv1 = " +
                          (from f in ffg.dbFFFactor where f.factor_shortname == "RIV1" select f.factor_visualization).FirstOrDefault().ToString() +
                          "; ";
        string server_riv2 = "var server_riv2 = " +
                          (from f in ffg.dbFFFactor where f.factor_shortname == "RIV2" select f.factor_visualization).FirstOrDefault().ToString() +
                          "; ";
        string server_riv3 = "var server_riv3 = " +
                          (from f in ffg.dbFFFactor where f.factor_shortname == "RIV3" select f.factor_visualization).FirstOrDefault().ToString() +
                          "; ";
        string server_riv4 = "var server_riv4 = " +
                          (from f in ffg.dbFFFactor where f.factor_shortname == "RIV4" select f.factor_visualization).FirstOrDefault().ToString() +
                          "; ";
        string server_riv5 = "var server_riv5 = " +
                          (from f in ffg.dbFFFactor where f.factor_shortname == "RIV5" select f.factor_visualization).FirstOrDefault().ToString() +
                          "; ";
        string server_riv6 = "var server_riv6 = " +
                          (from f in ffg.dbFFFactor where f.factor_shortname == "RIV6" select f.factor_visualization).FirstOrDefault().ToString() +
                          "; ";
        #endregion
        #region ent

        string server_ent1 = "var server_ent1 = " +
                        (from f in ffg.dbFFFactor where f.factor_shortname == "ENT1" select f.factor_visualization).FirstOrDefault().ToString() +
                        "; ";
        string server_ent2 = "var server_ent2 = " +
                        (from f in ffg.dbFFFactor where f.factor_shortname == "ENT2" select f.factor_visualization).FirstOrDefault().ToString() +
                        "; ";
        string server_ent3 = "var server_ent3 = " +
                        (from f in ffg.dbFFFactor where f.factor_shortname == "ENT3" select f.factor_visualization).FirstOrDefault().ToString() +
                        "; ";
        string server_ent4 = "var server_ent4 = " +
                        (from f in ffg.dbFFFactor where f.factor_shortname == "ENT4" select f.factor_visualization).FirstOrDefault().ToString() +
                        "; ";
        string server_ent5 = "var server_ent5 = " +
                        (from f in ffg.dbFFFactor where f.factor_shortname == "ENT5" select f.factor_visualization).FirstOrDefault().ToString() +
                        "; ";
        string server_ent6 = "var server_ent6 = " +
                        (from f in ffg.dbFFFactor where f.factor_shortname == "ENT6" select f.factor_visualization).FirstOrDefault().ToString() +
                        "; ";

        #endregion
        #region sup
        string server_sup1 = "var server_sup1 = " +
                          (from f in ffg.dbFFFactor where f.factor_shortname == "SUP1" select f.factor_visualization).FirstOrDefault().ToString() +
                          "; ";  
        string server_sup2 = "var server_sup2 = " +
                          (from f in ffg.dbFFFactor where f.factor_shortname == "SUP2" select f.factor_visualization).FirstOrDefault().ToString() +
                          "; ";
       
        string server_sup3 = "var server_sup3 = " +
                          (from f in ffg.dbFFFactor where f.factor_shortname == "SUP3" select f.factor_visualization).FirstOrDefault().ToString() +
                          "; ";  
        string server_sup4 = "var server_sup4 = " + 
                          (from f in ffg.dbFFFactor where f.factor_shortname == "SUP4" select f.factor_visualization).FirstOrDefault().ToString() +
                          "; ";  
        string server_sup5 = "var server_sup5 = " +
                          (from f in ffg.dbFFFactor where f.factor_shortname == "SUP5" select f.factor_visualization).FirstOrDefault().ToString() +
                          "; ";  
        string server_sup6 = "var server_sup6 = " +
                          (from f in ffg.dbFFFactor where f.factor_shortname == "SUP6" select f.factor_visualization).FirstOrDefault().ToString() +
                          "; ";

        string server_buy1 = "var server_buy1 = " +
                          (from f in ffg.dbFFFactor where f.factor_shortname == "BUY1" select f.factor_visualization).FirstOrDefault().ToString() +
                          "; ";
        string server_buy2 = "var server_buy2 = " +
                          (from f in ffg.dbFFFactor where f.factor_shortname == "BUY2" select f.factor_visualization).FirstOrDefault().ToString() +
                          "; ";
        string server_buy3 = "var server_buy3 = " +
                          (from f in ffg.dbFFFactor where f.factor_shortname == "BUY3" select f.factor_visualization).FirstOrDefault().ToString() +
                          "; ";
        string server_buy4 = "var server_buy4 = " +
                          (from f in ffg.dbFFFactor where f.factor_shortname == "BUY4" select f.factor_visualization).FirstOrDefault().ToString() +
                          "; ";
        string server_buy5 = "var server_buy5 = " +
                          (from f in ffg.dbFFFactor where f.factor_shortname == "BUY5" select f.factor_visualization).FirstOrDefault().ToString() +
                          "; ";
        string server_buy6 = "var server_buy6 = " +
                          (from f in ffg.dbFFFactor where f.factor_shortname == "BUY6" select f.factor_visualization).FirstOrDefault().ToString() +
                          "; ";
        string server_sub1 = "var server_sub1 = " +
                                  (from f in ffg.dbFFFactor where f.factor_shortname == "SUB1" select f.factor_visualization).FirstOrDefault().ToString() +
                                  "; ";
        string server_sub2 = "var server_sub2 = " +
                          (from f in ffg.dbFFFactor where f.factor_shortname == "SUB2" select f.factor_visualization).FirstOrDefault().ToString() +
                          "; ";
        string server_sub3 = "var server_sub3 = " +
                          (from f in ffg.dbFFFactor where f.factor_shortname == "SUB3" select f.factor_visualization).FirstOrDefault().ToString() +
                          "; ";
        string server_sub4 = "var server_sub4 = " +
                          (from f in ffg.dbFFFactor where f.factor_shortname == "SUB4" select f.factor_visualization).FirstOrDefault().ToString() +
                          "; ";
        string server_sub5 = "var server_sub5 = " +
                          (from f in ffg.dbFFFactor where f.factor_shortname == "SUB5" select f.factor_visualization).FirstOrDefault().ToString() +
                          "; ";
        string server_sub6 = "var server_sub6 = " +
                          (from f in ffg.dbFFFactor where f.factor_shortname == "SUB6" select f.factor_visualization).FirstOrDefault().ToString() +
                          "; ";  
         

        #endregion
        //string server_ent1 = "var server_ent1 = " +
        //                (from f in ffg.dbFFFactor where f.factor_shortname == "ENT1" select f.factor_visualization).FirstOrDefault().ToString() +
        //                "; ";

        //string server_ent2 = "var server_ent2 = " +
        //        (from f in ffg.dbFFFactor where f.factor_shortname == "ENT2" select f.factor_visualization).FirstOrDefault().ToString() +
        //    "; ";

        string transferString = server_factors + " "
            + server_fiveforces + " "
            + server_riv1 + " "
            + server_riv2 + " "
            + server_riv3 + " "
            + server_riv4 + " "
            + server_riv5 + " "
            + server_riv6 + " "             
            + server_ent1 + " " 
            + server_ent2 + " "
            + server_ent3 + " "
            + server_ent4 + " "
            + server_ent5 + " "
            + server_ent6 + " "
        +server_sup1 + " "
        + server_sup2 + " "
        + server_sup3 + " "
        + server_sup4 + " "
        + server_sup5 + " "
        + server_sup6 + " "
        + server_buy1 + " "
        + server_buy2 + " "
        + server_buy3 + " "
        + server_buy4 + " "
        + server_buy5 + " "
        + server_buy6 + " "
        + server_sub1 + " "
        + server_sub2 + " "
        + server_sub3 + " "
        + server_sub4 + " "
        + server_sub5 + " "
        + server_sub6 + " "
        + server_riv1;  // +obj
        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "key", transferString, true);
    }

    //private string generiereAbschluss(string _obj)
    //{
    //    // mache aus [{},{}, -> [{},{}];
    //    _obj = _obj.Substring(0, _obj.Length - 1) + "];";
    //    return _obj;
    //}

    protected void btnSave_Click(object sender, EventArgs e)
    {
        HiddenField _sup1 = FindControl("hiddenTextForBackend_SUP1") as HiddenField;
        HiddenField _sup2 = FindControl("hiddenTextForBackend_SUP2") as HiddenField;
        HiddenField _sup3 = FindControl("hiddenTextForBackend_SUP3") as HiddenField;
        HiddenField _sup = FindControl("hiddenTextForBackend_SUP") as HiddenField;
        string _s3 = _sup3.Value;

    }
}





//string server_SUP1 = "var server_sup1 = [";

//server_SUP1 += "{ links : [ " +
//    "{ id: 1, size: 20, color: '#eee' }," +
//    "{ id: 2, size: 20, color: '#eee' }," +
//    "{ id: 3, size: 20, color: '#f03' },"+
//    "{ id: 4, size: 20, color: '#eee' },"+
//    "{ id: 5, size: 20, color: '#eee' }" +
//    "] }";

//server_SUP1 += "];";
