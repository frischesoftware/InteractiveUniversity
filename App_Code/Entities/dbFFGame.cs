using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

[Serializable]
public partial class dbFFGame
{
  
    public void Initialize(string gameName)
    {
        this.playergamename = "Michael";
        this.gamename = "Five Forces 1";
        this.turnbookmark = 0;

        Collection<dbFFFactor> factors = makeFactors(gameName);
        foreach (var factor in factors)
        {
            this.dbFFFactor.Add(factor);
        }
    }

    private Collection<dbFFFactor> makeFactors(string gameName)
    {
        Collection<dbFFFactor> factors = new Collection<dbFFFactor>();
        string[] allAvailableFactors = {   "RIV1","RIV2","RIV3","RIV4","RIV5","RIV6",
                                           "ENT1","ENT2","ENT3","ENT4","ENT5","ENT6",
                                           "SUP1","SUP2","SUP3","SUP4","SUP5","SUP6",
                                           "BUY1","BUY2","BUY3","BUY4","BUY5","BUY6",
                                           "SUB1","SUB2","SUB3","SUB4","SUB5", "SUB6"   };
       

        for (int i = 0; i < allAvailableFactors.Count(); i++)
			{
                dbFFFactor f = new dbFFFactor();
                f.Initialize(allAvailableFactors[i]);
                factors.Add(f);
			}
        return factors;
    }
}


[Serializable]
public partial class dbFFFactor
{
    public void Initialize(string _factor_shortname)
    {
        string fullname_RIV = "Intensity of Competitive Rivalry";
        string fullname_ENT = "Threat of Entry";
        string fullname_SUP = "Bargaining Power of Suppliers";
        string fullname_BUY = "Bargaining Power of Buyers";
        string fullname_SUB = "Threat of Substitutes";
        List<object> e = new List<object>();
        JavaScriptSerializer js = new JavaScriptSerializer();
        Random r = new Random();
        int rect_margin = 10;
        string[] auspraegung = {"bad","neutral", "good"};
        int[] rows;
        int column1;
        int column2;
        int column3;
        int column4;
        int column5;

        switch (_factor_shortname)
        {
            case "RIV1":
                this.force_shortname = "RIV";
                this.force_fullname = fullname_RIV;
                this.factor_shortname = _factor_shortname;
                this.factor_auspraegung = "bad";  // good or bad
                this.factor_fullname = makeRIV1(this.factor_auspraegung); // "similar competitors";); // "similar competitors";    
            //this.factor_fullname = makeRIV1(auspraegung[r.Next(0,2)]); // "similar competitors";           
                e.Add(new dbFFInfo("RIV1", "many similar competitors - any competitor may try something funny any time"));
                e.Add(new dbFFSvgElementShapeRECT("RIV1", 200, 200, "#ccc", rect_margin, rect_margin));
                rows = makeRows(5);
                new dbFFSVGElementCIRCLEGROUP(e,"RIV1", 35, rows,"companies");

                this.factor_visualization = js.Serialize(e);                
                break;
            case "RIV2":
                this.force_shortname = "RIV";
                this.force_fullname = fullname_RIV;
                this.factor_shortname = _factor_shortname;
                this.factor_fullname = "slow growth";
                this.factor_auspraegung = "bad";
                e.Add(new dbFFSvgElementShapeRECT("RIV2", 200, 200, "#ccc", rect_margin, rect_margin));
                new dbFFSvgElementCoordinateSystem(e, "RIV2");
                new dbFFSvgElementGROWTHCOLUMNS(e, "RIV2");
                this.factor_visualization = js.Serialize(e);    
                break;
            case "RIV3":
                this.force_shortname = "RIV";
                this.force_fullname = fullname_RIV;
                this.factor_shortname = _factor_shortname;
                this.factor_fullname = "high fixed costs_CASE RIV3";
                this.factor_auspraegung = "bad";
                column1 = 35;
                column2 = 60;
                column3 = 100;
                column4 = 130;
                rows = makeRows(2);
                e.Add(new dbFFSvgElementShapeRECT("RIV3", 200, 200, "#ccc", rect_margin, rect_margin));
                new dbFFSVGElementCIRCLEGROUP(e, "RIV3", column1, rows, "companies");
                
                e.Add(new dbFFSvgElementShapeFACTORY("RIV3", 20, column2, rows[0]));
                e.Add(new dbFFSvgElementShapeFACTORY("RIV3", 20, column2, rows[1]));

                new dbFFSvgElementFIXVARCOSTS(e, "RIV3", rows[0], column3);
                new dbFFSvgElementFIXVARCOSTS(e, "RIV3", rows[1], column3);

                e.Add(new dbFFSvgShapeTEXT("RIV3", "capacity",column4,rows[0]-7,12));
                e.Add(new dbFFSvgShapeTEXT("RIV3", "100 000",column4,rows[0]+7,12));
                
                e.Add(new dbFFSvgShapeTEXT("RIV3", "capacity",column4,rows[1]-7,12));
                e.Add(new dbFFSvgShapeTEXT("RIV3", "80 000",column4,rows[1]+7,12));

                e.Add(new dbFFSvgShapeTEXT("RIV3", "total market potential",column4,180-7,12));
                e.Add(new dbFFSvgShapeTEXT("RIV3", "150 000",column4,180+7,12));    
                
            
            // e.Add(new dbFFSvgElementFIXVARCOSTS(e,"RIV3",column3,rows[0]));
               // e.Add(new dbFFSvgElementShapeRECT("RIV3", 20, 20, "black", rows[0], column1, "#ccc", "black"));


                this.factor_visualization = js.Serialize(e);    
                break;
            case "RIV4":
                this.force_shortname = "RIV";
                this.force_fullname = fullname_RIV;
                this.factor_shortname = _factor_shortname;
                this.factor_fullname = "Differentiation / Switching costs (FULL NAME)";
                this.factor_auspraegung = "bad";

                column1 = 35;
                column2 = 60;
                column3 = 100;
                column4 = 130;
                column5 = 165;

                e.Add(new dbFFSvgElementShapeRECT("RIV4", 200, 200, "#ccc", rect_margin, rect_margin));

                new dbFFSVGElementCIRCLEGROUP(e, "RIV4", column1, makeRows(4), "comp.");
                e.Add(new dbFFSvgElementShapeTRIANGLE("RIV4",30,column4, makeRows(1)[0]));
               e.Add(new dbFFSvgElementShapeCIRCLE("RIV4", 30, "blue", column5, 60));

                this.factor_visualization = js.Serialize(e);    
                break;
            case "RIV5":
                this.force_shortname = "RIV";
                this.force_fullname = fullname_RIV;
                this.factor_shortname = _factor_shortname;
                this.factor_fullname = "strategic risks";
                this.factor_auspraegung = "bad";
                e.Add(new dbFFSvgElementShapeRECT("RIV5", 200, 200, "#ccc", rect_margin, rect_margin));
                this.factor_visualization = js.Serialize(e);    
                break;
            case "RIV6":
                this.force_shortname = "RIV";
                this.force_fullname = fullname_RIV;
                this.factor_shortname = _factor_shortname;
                this.factor_fullname = "exit barriers";
                this.factor_auspraegung = "bad";
                e.Add(new dbFFSvgElementShapeRECT("RIV6", 200, 200, "#ccc", rect_margin, rect_margin));
                this.factor_visualization = js.Serialize(e);    
                break;
            case "ENT1":  // Threat of Entry
                this.force_shortname = "ENT";
                this.force_fullname = fullname_ENT;
                this.factor_shortname = _factor_shortname;
                this.factor_fullname = "economies of scale";
                this.factor_auspraegung = "bad";
                e.Add(new dbFFInfo("ENT1", "Established players in the market might be enjoying Economies of Scale. Look at " +
                " their production volume and cost position, and compare it to a new entrant with a low production volume "));

                e.Add(new dbFFSvgElementShapeRECT("ENT1", 200, 200, "#ccc", rect_margin, rect_margin));
                e.Add(new dbFFSvgElementShapePATH("ENT1", new string[] { "M 125,75", "a100,50", "0 0,0", "100,50" }, "none", "black", 2, rect_margin, rect_margin));  //0,0 == ?,?  -> http://www.w3.org/TR/SVG/paths.html

                new dbFFSvgElementCoordinateSystem(e, "ENT1");
               

                this.factor_visualization = js.Serialize(e);
                break;
            case "ENT2":  /* Produktdifferenzierung 
                           * bedeutet, dass die etablierten Unternehmen Markenidentifikation (brand identification), 
                           * Kundenloyalitäten (customer loyalties) u. ä. Marketingziele schon realisiert haben. 
                           * Um solche Faktoren zu bewältigen, muss der Neuzugang zusätzliche Kosten für Werbung usw. in Kauf nehmen.*/
                this.force_shortname = "ENT";
                this.force_fullname = fullname_ENT;
                this.factor_shortname = _factor_shortname;
                this.factor_fullname = "differentiation";
                this.factor_auspraegung = "bad";

                e.Add(new dbFFInfo("ENT2", "The 'hearts' symbolize brand identification and customer loyalities that the established brands have established. A new entrant into the market has none..."));
                //y: 32 69 106 143 180
                e.Add(new dbFFSvgElementShapeRECT("ENT2", 200, 200, "#ccc", 10, 10));
                foreach (var _y in new int[] { 32, 69 })
                {
                    e.Add(new dbFFSvgElementShapeCIRCLE("ENT2", 20, "#eee", 35, _y));
                    e.Add(new dbFFSvgElementShapePOLYGON("ENT2", "red", 1, new string[] { "0,0", "1,24", "5,10" }, 75, _y)); //benötigte Maschinen
                    e.Add(new dbFFSvgElementShapeHEART("ENT2", 15, 140, _y));
                    e.Add(new dbFFSvgElementShapePERSON("ENT2", 15, 170, _y));
                }
                e.Add(new dbFFSvgElementShapeCIRCLE("ENT2", 20, "#eee", 35, 143));
                e.Add(new dbFFSvgElementShapePOLYGON("ENT2", "red", 1, new string[] { "0,0", "1,24", "5,10" }, 75, 143)); //benötigte Maschinen
                e.Add(new dbFFSvgShapeTEXT("ENT2", "??", 140, 143, 8));
                e.Add(new dbFFSvgElementShapePERSON("ENT2", 15, 170, 143));
                this.factor_visualization = js.Serialize(e);
                break;

            #region more stuff

            case "ENT3":
                this.force_shortname = "ENT";
                this.force_fullname = fullname_ENT;
                this.factor_shortname = _factor_shortname;
                this.factor_fullname = "capital requirements";
                this.factor_auspraegung = "bad";
                e.Add(new dbFFSvgElementShapeRECT("ENT2", 200, 200, "#ccc", 10, 10));
                this.factor_visualization = js.Serialize(e);
                break;
            case "ENT4":
                this.force_shortname = "ENT";
                this.force_fullname = fullname_ENT;
                this.factor_shortname = _factor_shortname;
                this.factor_fullname = "switching cost";
                this.factor_auspraegung = "bad";
                e.Add(new dbFFSvgElementShapeRECT("ENT2", 200, 200, "#ccc", 10, 10));
                this.factor_visualization = js.Serialize(e);
                break;
            case "ENT5":
                this.force_shortname = "ENT";
                this.force_fullname = fullname_ENT;
                this.factor_shortname = _factor_shortname;
                this.factor_fullname = "access to distribution channels";
                this.factor_auspraegung = "bad";
                e.Add(new dbFFSvgElementShapeRECT("ENT2", 200, 200, "#ccc", 10, 10));
                this.factor_visualization = js.Serialize(e);
                break;
            case "ENT6":
                this.force_shortname = "ENT";
                this.force_fullname = fullname_ENT;
                this.factor_shortname = _factor_shortname;
                this.factor_fullname = "cost disadvantages independent of scale";
                this.factor_auspraegung = "bad";
                e.Add(new dbFFSvgElementShapeRECT("ENT2", 200, 200, "#ccc", 10, 10));
                this.factor_visualization = js.Serialize(e);
                break;
            #endregion
            case "SUP1":
                this.force_shortname = "SUP";
                this.force_fullname = fullname_SUP;
                this.factor_shortname = _factor_shortname;
                this.factor_fullname = "fewer supplier than buyers";
                this.factor_auspraegung = "bad";
                e.Add(new dbFFSvgElementShapeRECT("SUP1", 200, 200, "#ccc", 10, 10));
                e.Add(new dbFFSvgElementShapeCIRCLE("SUP1", 20, "#eee", 35, 32));
                e.Add(new dbFFSvgElementShapeCIRCLE("SUP1", 20, "green", 35, 69));
                e.Add(new dbFFSvgElementShapeCIRCLE("SUP1", 20, "#eee", 35, 106));
                e.Add(new dbFFSvgElementShapeCIRCLE("SUP1", 20, "#eee", 35, 143));
                e.Add(new dbFFSvgElementShapeCIRCLE("SUP1", 20, "#eee", 35, 180));
                e.Add(new dbFFSvgElementShapeLINE("SUP1", 0,0,0,200,1,"black")); //?
                e.Add(new dbFFSvgElementShapeLINE("SUP1", 0,0,0,200,1,"black"));                
                this.factor_visualization = js.Serialize(e);
                break;
            case "SUP2":
                this.force_shortname = "SUP";
                this.force_fullname = fullname_SUP;
                this.factor_shortname = _factor_shortname;
                this.factor_fullname = "substitution is hard";
                this.factor_auspraegung = "bad";
                e.Add(new dbFFSvgElementShapeRECT("SUP2", 200, 200, "#ccc", 10, 10));
                this.factor_visualization = js.Serialize(e);
                break;
            case "SUP3":
                this.force_shortname = "SUP";
                this.force_fullname = fullname_SUP;
                this.factor_shortname = _factor_shortname;
                this.factor_fullname = "buyer not an important customer";
                this.factor_auspraegung = "bad";
                e.Add(new dbFFSvgElementShapeRECT("SUP3", 200, 200, "#ccc", 10, 10));
                e.Add(new dbFFSvgElementShapeLINE("SUP3", 0, 100, 210, 100, 1, "#000"));
                e.Add(new dbFFSvgElementShapeCIRCLE("SUP3", 20, "#eee", 35, 32));
                e.Add(new dbFFSvgElementShapeCIRCLE("SUP3", 20, "#eee", 35, 69));
                e.Add(new dbFFSvgElementShapeCIRCLE("SUP3", 20, "#eee", 35, 106));
                e.Add(new dbFFSvgElementShapeCIRCLE("SUP3", 20, "#eee", 35, 143));
                e.Add(new dbFFSvgElementShapeCIRCLE("SUP3", 20, "#eee", 35, 180));
                e.Add(new dbFFSvgElementShapePOLYGON("SUP3", "blue", 1, new string[] { "0," + r.Next(9, 14).ToString(), "0," + r.Next(9, 14).ToString(), "5," + r.Next(5, 14).ToString() }, 140, 32));
                e.Add(new dbFFSvgElementShapePOLYGON("SUP3", "blue", 1, new string[] { "0," + r.Next(9, 14).ToString(), "0," + r.Next(9, 14).ToString(), "5," + r.Next(5, 14).ToString() }, 140, 69));
                e.Add(new dbFFSvgElementShapePOLYGON("SUP3", "blue", 1, new string[] { "0," + r.Next(9, 14).ToString(), "0," + r.Next(9, 14).ToString(), "5," + r.Next(5, 14).ToString() }, 140, 106));
                e.Add(new dbFFSvgElementShapePOLYGON("SUP3", "blue", 1, new string[] { "0," + r.Next(9, 14).ToString(), "0," + r.Next(9, 14).ToString(), "5," + r.Next(5, 14).ToString() }, 140, 143));
                e.Add(new dbFFSvgElementShapePOLYGON("SUP3", "blue", 1, new string[] { "0," + r.Next(9, 14).ToString(), "0," + r.Next(9, 14).ToString(), "5," + r.Next(5, 14).ToString() }, 140, 180));


                this.factor_visualization = js.Serialize(e);
                break;
            
            case "SUP4":
                this.force_shortname = "SUP";
                this.force_fullname = fullname_SUP;
                this.factor_shortname = _factor_shortname;
                this.factor_fullname = "switching costs are high";
                this.factor_auspraegung = "bad";



                e.Add(new dbFFSvgElementShapeRECT("SUP4", 200, 200, "#ccc", 10, 10));
                e.Add(new dbFFSvgElementShapeLINE("SUP4", 140, 10, 140, 210, 1, "#000"));
                e.Add(new dbFFSvgElementShapeCIRCLE("SUP4", 20, "#eee", 35, 32));
                e.Add(new dbFFSvgElementShapeCIRCLE("SUP4", 20, "#eee", 35, 69));
                e.Add(new dbFFSvgElementShapeCIRCLE("SUP4", 20, "#eee", 35, 106));
                e.Add(new dbFFSvgElementShapeCIRCLE("SUP4", 20, "#eee", 35, 143));
                e.Add(new dbFFSvgElementShapeCIRCLE("SUP4", 20, "#eee", 35, 180));
                e.Add(new dbFFSvgElementShapePOLYGON("SUP4", "orange", 1, new string[] { "0,0", "22,11", "5,10" }, 100, 32)); //benötigte Maschinen
                e.Add(new dbFFSvgElementShapePOLYGON("SUP4", "white", 1, new string[] { "0,0", "4,18", "12,3" }, 100, 69)); //benötigte Maschinen
                e.Add(new dbFFSvgElementShapePOLYGON("SUP4", "blue", 1, new string[] { "0,0", "9,19", "18,10" }, 100, 106)); //benötigte Maschinen
                e.Add(new dbFFSvgElementShapePOLYGON("SUP4", "red", 1, new string[] { "0,0", "1,24", "5,10" }, 100, 143)); //benötigte Maschinen
                e.Add(new dbFFSvgElementShapePOLYGON("SUP4", "green", 1, new string[] { "0,0", "-6,11", "5,10" }, 100, 180)); //benötigte Maschinen
                e.Add(new dbFFSvgElementShapePOLYGON("SUP4", "blue", 1, new string[] { "0,0", "9,19", "18,10" }, 100, 106)); // Kundenmaschine
                e.Add(new dbFFSvgElementShapeCIRCLE("SUP4", 20, "white", 185, 106)); // Kunde
                e.Add(new dbFFSvgElementShapePOLYGON("SUP4", "none", 1, new string[] { "0,0", "9,19", "18,10" }, 0, 0));


                this.factor_visualization = js.Serialize(e);
                break;
            case "SUP5":
                this.force_shortname = "SUP";
                this.force_fullname = fullname_SUP;
                this.factor_shortname = _factor_shortname;
                this.factor_fullname = "supplier threatens with forward integration";
                this.factor_auspraegung = "bad";
                e.Add(new dbFFSvgElementShapeRECT("SUP5", 200, 200, "#ccc", 10, 10));
                this.factor_visualization = js.Serialize(e);
                break;
            case "SUP6":
                this.force_shortname = "SUP";
                this.force_fullname = fullname_SUP;
                this.factor_shortname = _factor_shortname;
                this.factor_fullname = "-";
                this.factor_auspraegung = "bad";
                e.Add(new dbFFSvgElementShapeRECT("SUP6", 200, 200, "#ccc", 10, 10));
                this.factor_visualization = js.Serialize(e);
                break;
            case "BUY1":
                this.force_shortname = "BUY";
                this.force_fullname = fullname_BUY;
                this.factor_shortname = _factor_shortname;
                this.factor_fullname = "customers concentrated / buy large volume(?)";
                this.factor_auspraegung = "bad";
                e.Add(new dbFFSvgElementShapeRECT("BUY1", 200, 200, "#ccc", 10, 10));
                this.factor_visualization = js.Serialize(e);
                break;
            case "BUY2":
                this.force_shortname = "BUY";
                this.force_fullname = fullname_BUY;
                this.factor_shortname = _factor_shortname;
                this.factor_fullname = "standardized/undifferentiated products";
                this.factor_auspraegung = "bad";
                e.Add(new dbFFSvgElementShapeRECT("BUY2", 200, 200, "#ccc", 10, 10));
                this.factor_visualization = js.Serialize(e);
                break;
            case "BUY3":
                this.force_shortname = "BUY";
                this.force_fullname = fullname_BUY;
                this.factor_shortname = _factor_shortname;
                this.factor_fullname = "low switching costs for buyers";
                this.factor_auspraegung = "bad";
                e.Add(new dbFFSvgElementShapeRECT("BUY3", 200, 200, "#ccc", 10, 10));
                this.factor_visualization = js.Serialize(e);
                break;
            case "BUY4":
                this.force_shortname = "BUY";
                this.force_fullname = fullname_BUY;
                this.factor_shortname = _factor_shortname;
                this.factor_fullname = "buyers are not profitable themselves";
                this.factor_auspraegung = "bad";
                e.Add(new dbFFSvgElementShapeRECT("BUY4", 200, 200, "#ccc", 10, 10));
                this.factor_visualization = js.Serialize(e);
                break;
            case "BUY5":
                this.force_shortname = "BUY";
                this.force_fullname = fullname_BUY;
                this.factor_shortname = _factor_shortname;
                this.factor_fullname = "buyers threaten with backward integration";
                this.factor_auspraegung = "bad";
                e.Add(new dbFFSvgElementShapeRECT("BUY5", 200, 200, "#ccc", 10, 10));
                this.factor_visualization = js.Serialize(e);
                break;
            case "BUY6":
                this.force_shortname = "BUY";
                this.force_fullname = fullname_BUY;
                this.factor_shortname = _factor_shortname;
                this.factor_fullname = "our products have low relevance for end product quality (verbessern)";
                this.factor_auspraegung = "bad";
                e.Add(new dbFFSvgElementShapeRECT("BUY6", 200, 200, "#ccc", 10, 10));
                this.factor_visualization = js.Serialize(e);
                break; //buyers have full information
            case "SUB1":
                this.force_shortname = "SUB";
                this.force_fullname = fullname_SUB;
                this.factor_shortname = _factor_shortname;
                this.factor_fullname = "low product loyality";
                this.factor_auspraegung = "bad";
                e.Add(new dbFFSvgElementShapeRECT("SUB1", 200, 200, "#ccc", 10, 10));
                this.factor_visualization = js.Serialize(e);
                break;
            case "SUB2":
                this.force_shortname = "SUB";
                this.force_fullname = fullname_SUB;
                this.factor_shortname = _factor_shortname;
                this.factor_fullname = "low costs for substitution (verbessern)";
                this.factor_auspraegung = "bad";
                e.Add(new dbFFSvgElementShapeRECT("SUB2", 200, 200, "#ccc", 10, 10));
                this.factor_visualization = js.Serialize(e);
                break;
            case "SUB3":
                this.force_shortname = "SUB";
                this.force_fullname = fullname_SUB;
                this.factor_shortname = _factor_shortname;
                this.factor_fullname = "licenses/patents running out";
                this.factor_auspraegung = "bad";
                e.Add(new dbFFSvgElementShapeRECT("SUB3", 200, 200, "#ccc", 10, 10));
                this.factor_visualization = js.Serialize(e);
                break;
            case "SUB4":
                this.force_shortname = "SUB";
                this.force_fullname = fullname_SUB;
                this.factor_shortname = _factor_shortname;
                this.factor_fullname = "substitute is cheap/disadvantages are acceptable";
                this.factor_auspraegung = "bad";
                e.Add(new dbFFSvgElementShapeRECT("SUB4", 200, 200, "#ccc", 10, 10));
                this.factor_visualization = js.Serialize(e);
                break;
            case "SUB5":
                this.force_shortname = "SUB";
                this.force_fullname = fullname_RIV;
                this.factor_shortname = _factor_shortname;
                this.factor_fullname = "";
                this.factor_auspraegung = "bad";
                e.Add(new dbFFSvgElementShapeRECT("SUB5", 200, 200, "#ccc", 10, 10));
                this.factor_visualization = js.Serialize(e);
                break;
            case "SUB6":
                this.force_shortname = "SUB";
                this.force_fullname = fullname_RIV;
                this.factor_shortname = _factor_shortname;
                this.factor_fullname = "";
                this.factor_auspraegung = "bad";
                e.Add(new dbFFSvgElementShapeRECT("SUB6", 200, 200, "#ccc", 10, 10));
                this.factor_visualization = js.Serialize(e);
                break;
            default:
                break;
        }
    }

    private int[] makeRows(int p)
    {
        int[] _makerows = new int[p];
        for (int i = 0; i < p; i++)
			{
            _makerows[i]= ((200 - 20) / (p + 1)) * (i + 1);
			}

        return _makerows;
    }

    private string makeRIV1(string p)
    {

        if (p == "bad")
        {
            return "many similar competitors - any competitor may try something funny any time";
        }
        else if (p == "neutral")
        {
            return "many similar competitors - any competitor may try something funny any time";
        }
        else if (p == "good")
        {
            return "the presence of a dominant competitor disciplines the market";
        }
        else
        {
            return "many similar competitors - any competitor may try something funny any time";
        }
    }





}






    
/*
 <g>
  <title>Layer 1</title>
  <path fill="#000000" fill-rule="evenodd" stroke-width="1pt" id="path563" d="m213.828,134.61l-85.64,89.032l17.806,17.806l67.834,-72.073l0.849,121.25201l-58.507,180.60797c0,0 38.157,0.95102 39.005,-0.745c0.423,-0.84799 42.395,-167.14301 44.091,-169.68698l47.48302,99"/>
  <path fill="#000000" fill-rule="evenodd" stroke-width="1pt" id="path564" d="m239.114,12.4448c-79.705,1.6958 -78.85699,105.9902 -2.54399,106.8382c82.24899,0 84.79199,-105.99018 2.54399,-106.8382z"/>
 </g>
*/