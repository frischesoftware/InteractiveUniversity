using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Globalization;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Games_BostonBox2 : System.Web.UI.Page
{
    public static Random r = new Random();
    dbGame dbg;
    protected void Page_Load(object sender, EventArgs e)
    {       
        createNewGame(Session["BB_selected_Game"].ToString());        
        DataToClientsideNew(dbg);
        /*
        if ((dbGame)Session["DBgameObject"] == null)
        {
            createNewGame("DOG TUTORIAL");
            //createNewGame("Normal Game");
        }
        else
        {
            dbg = (dbGame)Session["DBgameObject"];
        }
        if (!IsPostBack)
        {
            DataToClientsideNew(dbg);
        }
         * */
    }

    private void createNewGame(string gameName)
    {
        using (InteractiveUniversityEntities1 iu = new InteractiveUniversityEntities1())
        {
            dbg = new dbGame();
            dbg.Initialize(gameName);
            iu.dbGame.Add(dbg); // Magic: Damit ist alles in der Datenbank!
            iu.SaveChanges();
        }
        
        Session["DBgameObject"] = dbg;
        Session.Timeout = 50;
    }

    private void DataToClientsideNew(dbGame g)
    {
        bool _showNewProducts = false;
        bool _showDeadProducts = false;


        // show dead games and new games?
        if (g.playergamename.ToUpper() == "NORMAL GAME")
        {
            _showNewProducts = true;
            _showDeadProducts = true;

        }

        string gameSetupData = "var gameSetupData = [";

        // ermittle "winningTotalCF" - alle Produkte


        int winningTotalCF = 0;
        using (InteractiveUniversityEntities1 iu = new InteractiveUniversityEntities1())
        {

            //from p in iu.dbProductName where p.marketName_id ==  15 select p).ToList();
            var a = ((from p in g.dbMarket select (from q in p.dbProduct where q.playerProduct == 1 select q))).ToList(); // ToArray(); //.winningTotalCFForThisProduct_optimal
            foreach (var item in a)
            {
                winningTotalCF += item.First().winningTotalCFForThisProduct_optimal;
            }
        }

        string endConditions = JavaScriptSerialize.Serialize(g.endConditions);

        int _maxTurnsOverride = 0;
        if (g.endStateBasedOnConstellation == false)
        {
            _maxTurnsOverride = 999;
        }
        else
        {
            _maxTurnsOverride = (int)g.maxTurns;
        }
        gameSetupData += "{ currentActiveGame: '" + g.playergamename + "'" +
                         ", gameDescription: '" + g.gameDescription + "'" +
                        ", maxTurns:  " + _maxTurnsOverride + // + g.maxTurns + "'" +
                       ", maxBadRounds: " + g.maxBadRounds +
                       ", maxNegativeCF: " + g.maxNegativeCF +
                       ", startBudget: '40'" +
                       ", winBudget: '1000'" +
                       ", endStateBasedOnConstellation: '" + g.endStateBasedOnConstellation + "'" +  //true: 2cc, 4dog, 1 qm; false: based on highscore
                       ", budgetLowLimit: '-1000'" +
                       ", endStateCC: " + g.endStateCC +   // Beispielzahlen für 1CC 1QM
                       ", endStateDog: " + g.endStateDog +
                       ", endStateStar: " + g.endStateStar +
                       ", endStateQM: " + g.endStateQM +
                       ", endConditions: " + endConditions +
            //    ", loseCondition: 'turns'" +  //  nach welchem Kriterium wird "lose" definiert
                       ", showNewProducts: '" + _showNewProducts + "'" + // Usercontrols for Normal game mit Neuen Produkten und Entfernten Produkten
                       ", showDeadProducts: '" + _showDeadProducts + "'" +
                       ", cfCC : " + g.cfCC +    // Default Cashflows
                       ", cfDog : " + g.cfDog +
                       ", cfStar : " + g.cfStar +
                       ", cfQM : " + g.cfQM +
                        "}];";

        Collection<dbMarket> markets_turn0 = new Collection<dbMarket>();
        Collection<dbMarket> markets_later = new Collection<dbMarket>();
        foreach (var _market in g.dbMarket)
        {
            if (_market.toBeAddedInTurn == 0)
            {
                markets_turn0.Add(_market);
            }
            else
            {
                markets_later.Add(_market);
            }
        }
        string data = CreateDATAArrayForClientside(g, "data_server", markets_turn0);
        string data_unborn_server = CreateDATAArrayForClientside(g, "data_unborn_server", markets_later);  //die Produkte, die Runde für Runde angeboten werden



        // add additional Markets (mostly Questionmarks) to be inserted/offered at specific game turns.
        //  Arten: 1. Vordefiniert (z.B. Nachbildung HP-Case Study), 2. Zufallsgeneriert gemäß Schwierigkeitsgrad

        //get available Games into a second array and also transfer it to clientside                
        //List<dbAvailableGames> ag;

        // instead, make 3 lists for tutorials, lessons and challenges (3 types of games, separated)
        List<dbAvailableGames> ag_tutorials;
        List<dbAvailableGames> ag_lessons;
        List<dbAvailableGames> ag_challenges;

        using (InteractiveUniversityEntities1 iu = new InteractiveUniversityEntities1())
        {
            //ag = (from a in iu.dbAvailableGames where (a.available == true) select a).ToList();

            ag_tutorials = (from a in iu.dbAvailableGames where (a.available == true) && (a.gameType == "tutorial") select a).ToList();
            ag_lessons = (from a in iu.dbAvailableGames where (a.available == true) && (a.gameType == "lesson") select a).ToList();
            ag_challenges = (from a in iu.dbAvailableGames where (a.available == true) && (a.gameType == "challenge") select a).ToList();
        }


        //string availableGames = "var availablegames = [";
        string availablegames_tutorials = "var availablegames_tutorials = [";
        string availablegames_lessons = "var availablegames_lessons = [";
        string availablegames_challenges = "var availablegames_challenges = [";

        //  foreach (var item in ag)
        foreach (var item in ag_tutorials)
        {
            availablegames_tutorials += //"'" + item.gameName.ToUpper() + "', ";
            "{gameName: " + "'" + item.gameName.ToString().ToUpper() + "'" +
            ", gameDescription: " + "'" + item.gameDescription.ToString() + "'" +
            "},";
        }
        foreach (var item in ag_lessons)
        {
            availablegames_lessons += //"'" + item.gameName.ToUpper() + "', ";
            "{gameName: " + "'" + item.gameName.ToString().ToUpper() + "'" +
            ", gameDescription: " + "'" + item.gameDescription.ToString() + "'" +
            "},";
        }
        foreach (var item in ag_challenges)
        {
            availablegames_challenges += //"'" + item.gameName.ToUpper() + "', ";
            "{gameName: " + "'" + item.gameName.ToString().ToUpper() + "'" +
            ", gameDescription: " + "'" + item.gameDescription.ToString() + "'" +
            "},";
        }


        //availableGames = generiereAbschluss(availableGames);
        availablegames_tutorials = generiereAbschluss(availablegames_tutorials);
        availablegames_lessons = generiereAbschluss(availablegames_lessons);
        availablegames_challenges = generiereAbschluss(availablegames_challenges);

        string colors_player_server = "var colors_player_server = ['#a01717', '#1F4689', '#7bade1', '#528b75', '#cfc386' ]; ";
        string colors_competition_server = "var colors_competition_server = ['#747d82', '#9ca2a6', '#c5c9cc', '#f0f1f2', '#f0f1f2', '#f0f1f2', '#f0f1f2']; ";// Achtung bei ganz vielen Competitors -> nie mehr als 3, 4-6: Wiederholungen

        
        //CEO Statements and data
        string advisor_data = "var advisor_data = [  { " +
                                "advisor_name: 'ceos'" +
                                ", advisor_imagesource: '" + g.ceo_advisor_imagesource + "'" + //'../img/alt_joyride%20icons/ceos.jpg', " +                                
                                ", advisor_feedback: '" + g.ceo_advisor_feedback  + "'" + // g.ceo_advisor_enabled build a good portfolio of products', " +
                                ", advisor_enabled: 'true' " +
                                "}, " +
                                 "{ " +
                                "advisor_name: 'accountant1' " +
                                ", advisor_imagesource: '../img/alt_joyride%20icons/accountant1s.jpg'" +
                                ", advisor_feedback: 'get rid of products that cost us money!'" +
                                ", advisor_enabled: 'false' " +
                                "} "+
        "];";

        string transferString = data + data_unborn_server + colors_player_server + colors_competition_server + gameSetupData + availablegames_tutorials + availablegames_lessons + availablegames_challenges + advisor_data; //availableGames;
        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "key", transferString, true);

    }

    private string generiereAbschluss(string _dictionaryName)
    {
        // mache aus [{},{}, -> [{},{}];
        _dictionaryName = _dictionaryName.Substring(0, _dictionaryName.Length - 1) + "];";
        return _dictionaryName;
    }

    private string CreateDATAArrayForClientside(dbGame g, string _arrayname, Collection<dbMarket> whichMarkets)
    {
        if (whichMarkets.Count == 0)
            return "var " + _arrayname + " = [];";
        {

        }
        string productsAndMarkets = "var " + _arrayname + " = [";
        string _ms;
        string _g;

        int circleText = 1;

        foreach (var _market in whichMarkets)
        {
            foreach (var _product in _market.dbProduct)
            {
                foreach (var _productstate in _product.dbProductState)
                {
                    if (_productstate.marketshare.Equals(null))
                    {
                        _ms = "";  // ehem??
                    }
                    else
                    {
                        double _d = (double)_productstate.marketshare;
                        _ms = _d.ToString(CultureInfo.InvariantCulture);
                    }

                    if (_market.growth.Equals(null))
                    {
                        _g = "";
                    }
                    else
                    {
                        string _d = _market.growth;
                        _g = _d.ToString(CultureInfo.InvariantCulture);

                        if (_g == "high")
                        {
                            float _f = r.Next(11, 19);
                            _f = _f / 10;
                            _g = _f.ToString(CultureInfo.InvariantCulture);   // 14/10 -> "1.4"

                        }
                        else if (_g == "low")
                        {
                            float _f = r.Next(1, 9) / 10;
                            _g = _f.ToString(CultureInfo.InvariantCulture);
                        }
                    }

                    productsAndMarkets = productsAndMarkets +
                        "{ci: " + _product.id +
                        ", aci: '" + "a" + _product.id + "'" + // ci mit "a" davor als "id" für das <td> - Element
                        ", x: " + _ms +
                        ", y: " + _g +
                        ", z: 23, name: '" + _product.name + "'" +
                        ", playerProduct: '" + _product.playerProduct + "'" +
                        ", marketName: '" + _market.name + "'" +
                        ", marketGrowthDeclineRate : 0.05" +
                        ", marketLifeTimeUp : " + _market.marketLifeTimeUp + // 4" +
                        ", marketLifeTimeDown : " + _market.marketLifeTimeDown + //  5" +
                        ", userSelectedType : '-'" +
                        ", investedThisTurn : 0" +  // live aktualisiert mit dem Dropdown
                        ", investedLastTurn : 0" +  //
                        ", salesLastTurn: 0" +
                        ", x_delta: 0" +
                        ", cashFlowThisTurn: 0" +  // z.B. -30   == auch erstmal "Cash Flow Last Turn"
                        ", cashFlowAllTime: 0" +   // z.B. +210  == Auch erstmal "Total Cash Flow"
                        ", productState: 'active'" +   // 'unborn', 'active', 'dead' <- unklar ob das so laufen soll
                        ", toBeAddedInTurn : " + _market.toBeAddedInTurn +
                        ", primaryColor : '" + _product.primaryColor + "'" +  //'orange'" + 
                        ", secondaryColor : '" + _product.secondaryColor + "'" + // 'green'" +
                        ", circleText: " + circleText +
                        ", investmentDecisionMade: false" +
                        //", stepsize: " + _market.stepsize +
                        ", stepsize_up: " + _market.stepsize_up +
                        ", stepsize_down: " + _market.stepsize_down +
                        ", income_last_turn: 0" +
                        ", ms_loan: 0" +  // if the top 2 products have equal marketshare, OUR product gets either +1 (-> ms_loan -> -1) oder umgekehrt
                        ", advisor_name: '" + _product.advisor_name + "'" + // 'CEO'" +   // produktbezogene Advisors
                        ", advisor_imagesource: '" + _product.advisor_imagesource + "'" +  //img/alt_joyride%20icons/ceos.jpg'" +
                        ", advisor_feedback: '" + _product.advisor_feedback + "'" +
                        ", advisor_enabled: 'true'" +
                        ", winningTotalCFForThisProduct_minimal: " + _product.winningTotalCFForThisProduct_minimal +
                        ", winningTotalCFForThisProduct_optimal: " + _product.winningTotalCFForThisProduct_optimal +
                        "},";
                    circleText += 1;
                }
            }

        }
        productsAndMarkets = generiereAbschluss(productsAndMarkets);
        return productsAndMarkets;
    }



    protected void btnNewGame_Click(object sender, EventArgs e)
    {
        
        HiddenField _lblNewGame = FindControl("hiddenTextForBackend") as HiddenField;

        string nameOfTheNewGameToBeCreated = _lblNewGame.Value;
        if (nameOfTheNewGameToBeCreated == "")
        {
            nameOfTheNewGameToBeCreated = "DOG TUTORIAL";
        }
        Session["DBgameObject"] = null;
        createNewGame(nameOfTheNewGameToBeCreated);
        DataToClientsideNew(dbg);
    }

 
}