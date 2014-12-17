using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Web;


/// <summary>
/// Zusammenfassungsbeschreibung für dbGame
/// </summary>
[Serializable]
public partial class dbGame
{
    public static Random r = new Random();        

    public void Initialize(string gameName)
    {        
        using (InteractiveUniversityEntities1 iu = new InteractiveUniversityEntities1())
        {
            // look in table AvailableGames and load data based on gameName (the name clicked on in the browser)            
            try
            {
               var x = (from i in iu.dbAvailableGames where i.gameName == gameName select i).Single();
                                  
            if (x.gameType == "CaseStudy")  // ist es ein Szenario? Dann lade die Szenariodaten aus der Datenbank
            {
                var _markets = from i in iu.dbMarketTemplate where i.dbScenario.gameName == gameName select i;
                
                
                // Create a new Game based on the scenario

                dbGame g = makeGame(gameName, "###### gameDescription ######");

                this.playergamename = gameName;
                this.turnBookmark = g.turnBookmark;

                this.maxTurns = g.maxTurns;
                this.maxBadRounds = g.maxBadRounds;
                this.maxNegativeCF = g.maxNegativeCF;
               

                Collection<dbMarket> marketsInGame = new Collection<dbMarket>();                
                foreach (var _m in _markets)
                {
                    //marketsInGame.Add(_markets);
                    dbMarket m = new dbMarket();                                        
                    m.name = _m.name;
                    m.type = _m.type;
                    m.growth = _m.growth;
                    m.id = _m.id;
                    m.toBeAddedInTurn = _m.toBeAddedInTurn;                                    
                    var allProductTemplatesForThisMarketTemplate = from p in iu.dbProductTemplate where p.dbMarketTemplate.id == m.id select p;
                    //var allProductTemplatesForThisMarketTemplate = from p in iu.dbProductTemplate where p.marketTemplate_id == m.id select p;
                    foreach (var _p in allProductTemplatesForThisMarketTemplate)
                    {
                        dbProduct p = new dbProduct();
                        p.id = _p.id;
                        p.market_id = _p.marketTemplate_id;
                        p.name = _p.name;
                        p.playerProduct = _p.playerProduct;
                        p.primaryColor = _p.primaryColor;
                        p.secondaryColor = _p.secondaryColor;
                            var thisProductsState = (from ps in iu.dbProductStateTemplate where ps.dbProductTemplate.id == p.id select ps).Single();
                            dbProductState pstate = new dbProductState();
                            pstate.turn = thisProductsState.turn;
                            pstate.marketshare = thisProductsState.marketshare;
                        p.dbProductState.Add(pstate);

                        m.dbProduct.Add(p);
                    }
                    this.dbMarket.Add(m);
                    marketsInGame.Add(m);
                }
                assignColorsToMarkets(marketsInGame);
            assignAdvisorsToMarkets(marketsInGame);
            }



            else   // ansonsten generiere die Märkte nach Schema
            {
                // gameData - zunächst übergreifend
                
                string gameDescription = x.gameDescription;
                dbGame g = makeGame(gameName, gameDescription);

                this.cfCC = g.cfCC; // 30;  // "marketsInGame" benötigt cfCC etc.
                this.cfDog = g.cfDog; // -5;
                this.cfStar = g.cfStar; // +10;
                this.cfQM = g.cfQM; // 0;

                Collection<dbMarket> marketsInGame = makeMarkets(g);

                    this.playergamename = g.playergamename;
                    this.turnBookmark = g.turnBookmark;

                    this.maxTurns = g.maxTurns;
                    this.maxBadRounds = g.maxBadRounds;
                    this.maxNegativeCF = g.maxNegativeCF;

                    this.gameDescription = g.gameDescription;

                    this.endStateCC = g.endStateCC;
                    this.endStateDog = g.endStateDog;
                    this.endStateQM = g.endStateQM;
                    this.endStateStar = g.endStateStar;

                    this.endConditions = g.endConditions;

                    this.ceo_advisor_enabled = g.ceo_advisor_enabled;
                    this.ceo_advisor_feedback = g.ceo_advisor_feedback;
                    this.ceo_advisor_imagesource = g.ceo_advisor_imagesource;
                    this.ceo_advisor_name = g.ceo_advisor_name;

                foreach (var market in marketsInGame)
                {
                    this.dbMarket.Add(market);
                }
                //after the game is set up, make colors - so that they are functional overall
                assignColorsToMarkets(marketsInGame);
                assignAdvisorsToMarkets(marketsInGame);
                findGoodProductNames(g);

            }
            }
            catch (InvalidOperationException)
            {
                var x = "-";
            }
            
        }
        

    }

    public dbGame makeGame(string gameName, string _gameDescription)
    {
        dbGame g = new dbGame();

        if (true)  // jeweils für die Spiele anpassen
        {
            g.cfCC =  30;  // "marketsInGame" benötigt cfCC etc.
            g.cfDog = -5;
            g.cfStar = +10;
            g.cfQM = 0;

            g.playergamename = gameName;
            g.turnBookmark = 0;

            g.maxTurns = 9999;
            g.maxBadRounds = 9999;
            g.maxNegativeCF = -9999;

            g.gameDescription = _gameDescription;

            g.endStateBasedOnConstellation = false; // DAHER IST ALLES NACHFOLGENDE NICHT RELEVANT

            // Endzustand definieren
            switch (gameName.ToUpper())
            {
                    // QM STAR CC DOG

                case "CASH COW TUTORIAL":                
                    g.endConditions = new string[][] {
                        new[]{"win", "0","0","1","0", "Successfully maintained the CC for a long time!"},
                        new[]{"loss","0","0","0","1", "Unfortunately our Cash Cow turned into a Dog!"},
                        new[]{"loss","0","0","0","0", "The Cash Cow should have been maintained!"}
                    };

                    g.endStateQM = 0;  //aktuell benötigt für die Anzeige des Soll-Ergebnisses!
                    g.endStateStar = 0;
                    g.endStateCC = 1;
                    g.endStateDog = 0;
                    g.maxTurns = 5;

                    g.ceo_advisor_name = "CEO";
                    g.ceo_advisor_imagesource = "../img/alt_joyride%20icons/ceos.jpg";
                    g.ceo_advisor_feedback = "Hello Team! Your are assigned managing this Cash Cow product. Protect this product and generate a cash flow of at least ???";
                    g.ceo_advisor_enabled = "true";

                    break;
                case "STAR TUTORIAL":
                    g.endConditions = new string[][] {
                        new[]{"win", "0","0","1","0", "Successfully turned the Star into a Cash Cow!"},
                        new[]{"loss","0","0","0","1", "Unfortunately our Star turned into a Dog!"},
                        new[]{"loss","0","0","0","0", "We have no products left in the market!"}
                    };

                    g.endStateCC = 1;
                    g.endStateDog = 0;
                    g.endStateQM = 0;
                    g.endStateStar = 0;
                    g.maxTurns = 9;

                    g.ceo_advisor_name = "CEO";
                    g.ceo_advisor_imagesource = "../img/alt_joyride%20icons/ceos.jpg";
                    g.ceo_advisor_feedback = "Hello Team! Your task is to develop this Questionmark into a Cash Cow and generate a total cash flow of ???";
                    g.ceo_advisor_enabled = "true";

                    break;
                case "DOG TUTORIAL":
                    g.endConditions = new string[][] {
                        new[]{"win", "0","0","1","0", "Amazing - against all odds the Dog turned into a Cash Cow!"}, // Dog -> CC
                        new[]{"loss","0","0","0","1", "We were stuck with this unsuccessful product for so long!"}, // Dog -> Dog
                        new[]{"win","0","0","0","0", "Good decision! We got rid of this Dog before losing even more money!"} // Dog -> 0
                    };

                    g.endStateCC = 0;
                    g.endStateDog = 0; // gib eine Info wenn "1"!!
                    g.endStateQM = 0;
                    g.endStateStar = 0;

                    g.maxTurns = 5;

                    g.ceo_advisor_name = "CEO";
                    g.ceo_advisor_imagesource = "../img/alt_joyride%20icons/ceos.jpg";
                    g.ceo_advisor_feedback = "Hello Team! We have a Dog in our portfolio. It is only costing us money!";
                    g.ceo_advisor_enabled = "true";
                    break;
                case "QUESTIONMARK TUTORIAL":
                    g.endConditions = new string[][] {
                        new[]{"win", "0","0","1","0", "Good job! You developed the Questionmark into a Cash Cow!"}, // Dog -> CC
                        new[]{"loss","0","0","0","1", "Oh no! Our hopeful Questionmark turned into a Dog!"}, // Dog -> Dog
                        new[]{"win","0","0","0","0", "We have no products left in the market!"} // Dog -> 0
                    };

                    g.endStateCC = 1;
                    g.endStateDog = 0;
                    g.endStateQM = 0;
                    g.endStateStar = 0;

                    g.maxTurns = 9;

                    g.ceo_advisor_name = "CEO";
                    g.ceo_advisor_imagesource = "../img/alt_joyride%20icons/ceos.jpg";
                    g.ceo_advisor_feedback = "Hello Team! Your task today is to generate a minimum cash flow of ??? ad end with" +
                                             "one Cash Cow"; //Make sure we have a new Cash Cow when our current Cash Cow dies";
                    g.ceo_advisor_enabled = "true";

                    break;
                case "CASH COW AND QUESTIONMARK":  // Idee: CC weg, QM wird zur CC, also: 1CC am Ende
                    g.endConditions = new string[][] {    // QM STAR CC DOG
                        new[] {"win", "0","0","1","0", "Good Job. First Cash Cow died, but the Questionmark turned into a new Cash Cow!" },
                        new[] {"loss","0","0","0","0","We have no products left in the market!"},
                        new[] {"loss","0","0","0","1","Our Cash Cow died, and our hopeful Questionmark turned into a Dog!"},
                    };

                    g.endStateCC = 1;
                    g.endStateDog = 0;
                    g.endStateQM = 0;
                    g.endStateStar = 0;

                    g.maxTurns = 7;

                    g.ceo_advisor_name = "CEO";
                    g.ceo_advisor_imagesource = "img/alt_joyride%20icons/ceos.jpg";
                    g.ceo_advisor_feedback = "Make sure we have a new Cash Cow when our current Cash Cow dies";
                    g.ceo_advisor_enabled = "true";

                    break;
                
                case "CASH COW AND THREE QUESTIONMARKS":  //es sollten 2 CCs übrig bleiben, aber andere Ergebnisse möglich.
                    g.endConditions = new string[][] {    // QM STAR CC DOG
                        new[] {"win", "0","0","1","0", "Ok. We managed to create another Cash Cow!" },
                        new[] {"loss", "0","0","1","1", "Ok. We managed to create another Cash Cow, but we are stuck with a Dog!" },
                        new[] {"loss", "0","0","1","2", "Ok. We managed to create another Cash Cow, but we have a real Dog-Problem!" },

                        new[] {"win", "0","0","2","0", "Good Job. Our old Cash Cow paid for the development of 2 new Cash Cows!" },
                        new[] {"loss", "0","0","2","1", "Well, our old Cash Cow paid for the development of 2 new Cash Cows, but we still have a Dog-Problem!" },

                        new[] {"win", "0","0","3","0", "Excellent! Our old Cash Cow paid for the development of 3 new Cash Cows!" },

                        new[] {"loss","0","0","0","0","We don't have any Products in any Market left!"},
                        new[] {"loss","0","0","0","1","We have no successful products, but one Dog in or Portfolio"},
                        new[] {"loss","0","0","0","2","Our investments did not work out well - we have 2 unsuccessful Products in our Portfolio"},
                        new[] {"loss","0","0","0","3","This is terrible - all of our hopeful Questionmarks turned into Dogs!!!"},
                    };
                    g.endStateCC = 2;
                    g.endStateDog = 0;
                    g.endStateQM = 0;
                    g.endStateStar = 0;

                    g.maxTurns = 7;

                    g.ceo_advisor_name = "CEO";
                    g.ceo_advisor_imagesource = "img/alt_joyride%20icons/ceos.jpg";
                    g.ceo_advisor_feedback = "Develop at least 2 of our hopeful products into Moneymakers!";
                    g.ceo_advisor_enabled = "true";
                    break;


                default:

                    g.endStateCC = 0;
                    g.endStateDog = 0;
                    g.endStateQM = 0;
                    g.endStateStar = 0;
                    break;
            }                       
        }

        return g;
    }

    //public Collection<dbMarket> makeMarkets(string gameName)
    public Collection<dbMarket> makeMarkets(dbGame g)
    {
        Collection<dbMarket> makeMarkets = new Collection<dbMarket>();

        //MarketNames.....
        List<dbMarketName> mn = new List<dbMarketName>();
        
        
        switch (g.playergamename.ToUpper())
        {   
            case "CASH COW TUTORIAL":
                mn = findMarketNames(0, 1);
                dbMarketName _cc_tut = new dbMarketName();
                    _cc_tut = mn.Find(item => item.marketType == "low");
                    makeMarkets.Add(makeMarketsGeneric(_cc_tut, "CC", "strong", "0.7", 0, g));
                    mn.Remove(_cc_tut); //break;//marketType.strong
                break;

            case "STAR TUTORIAL":
                mn = findMarketNames(1, 0);
                dbMarketName _star_tut = new dbMarketName();
                    _star_tut = mn.Find(item => item.marketType == "high");
                    makeMarkets.Add(makeMarketsGeneric(_star_tut, "STAR", "weak", "1.5", 0, g)); 
                    mn.Remove(_star_tut);
                break;

            case "DOG TUTORIAL":
            mn = findMarketNames(0, 1);
            dbMarketName _dog_tut = new dbMarketName();
                _dog_tut= mn.Find(item => item.marketType == "low");
                makeMarkets.Add(makeMarketsGeneric(_dog_tut, "Dog", "weak", "0.2", 0, g));
                mn.Remove(_dog_tut);
            break;


            case "QUESTIONMARK TUTORIAL":
            mn = findMarketNames(1, 0);
            dbMarketName _qm_tut = new dbMarketName();
            _qm_tut = mn.Find(item => item.marketType == "high");
            makeMarkets.Add(makeMarketsGeneric(_qm_tut, "QM", "strong", "1.5", 0, g));
            mn.Remove(_qm_tut);
            break;

            case "NORMAL GAME":
                mn = findMarketNames(4, 1);
                dbMarketName _temp_m = new dbMarketName();
                makeMarkets.Add(makeMarketsGeneric( mn.Find(item => item.marketType == "high"), "STAR", "weak", "1.5", 0, g));
                mn.Remove( mn.Find(item => item.marketType == "high"));

                //_temp_m = mn.Find(item => item.marketType == "low");
                makeMarkets.Add(makeMarketsGeneric(mn.Find(item => item.marketType == "low"), "Dog", "weak", "0.3", 0, g));
                mn.Remove(mn.Find(item => item.marketType == "low"));

                // außer diesen zwei Start-Markets, mach noch 3 Questionmarks, davon 1-2 "weak"
               
                makeMarkets.Add(makeMarketsGeneric(mn.Find(item => item.marketType == "high"), "QM", "weak", "1.9", 3, g));
                mn.Remove(mn.Find(item => item.marketType == "high"));
               
                makeMarkets.Add(makeMarketsGeneric(mn.Find(item => item.marketType == "high"), "QM", "weak", "1.6", 3, g));
                mn.Remove(mn.Find(item => item.marketType == "high"));
               
                makeMarkets.Add(makeMarketsGeneric(mn.Find(item => item.marketType == "high"), "QM", "strong", "1.3", 3, g));
                mn.Remove(mn.Find(item => item.marketType == "high"));
                break;
                /*
                CC_QM
                    CC_3QM
                */
            case "CASH COW AND QUESTIONMARK":

                

                mn = findMarketNames(1, 1);
                dbMarketName _cc_qm = new dbMarketName();

                _cc_qm = mn.Find(item => item.marketType == "low");
                if (_cc_qm != null)
                {
                    //m.Add(makeMarketsGeneric("Star", "STAR", "CLOSE", "1.5", 0));  // CLOSE = eine knappe Angelegenheit           
                    makeMarkets.Add(makeMarketsGeneric(_cc_qm, "CC", "strong", "0.5", 0, g));
                    mn.Remove(_cc_qm);
                }

                _cc_qm = mn.Find(item => item.marketType == "high");
                if (_cc_qm != null)
                {
                    makeMarkets.Add(makeMarketsGeneric(_cc_qm, "QM", "strong", "1.5", 0, g)); // break;
                    mn.Remove(_cc_qm); break;
                }
                break;

            case "CASH COW AND THREE QUESTIONMARKS":
                 mn = findMarketNames(3, 1);
                dbMarketName _cc_3qm = new dbMarketName();
         
                makeMarkets.Add(makeMarketsGeneric(mn.Find(item => item.marketType == "low"), "CC", "strong", "0.5", 0, g));
                mn.Remove(mn.Find(item => item.marketType == "low"));

                makeMarkets.Add(makeMarketsGeneric(mn.Find(item => item.marketType == "high"), "QM", "strong", "1.2", 0, g));
                mn.Remove(mn.Find(item => item.marketType == "high"));

                makeMarkets.Add(makeMarketsGeneric(mn.Find(item => item.marketType == "high"), "QM", "strong", "1.5", 0, g));
                mn.Remove(mn.Find(item => item.marketType == "high"));

                makeMarkets.Add(makeMarketsGeneric(mn.Find(item => item.marketType == "high"), "QM", "weak", "1.8", 0, g));
                mn.Remove(mn.Find(item => item.marketType == "high"));
                break;
            //case "Doghouse":
            


            //default:
                //m.Add(makeMarketsGeneric("Star", "STAR", "weak", "1.5", 0));  // CLOSE = eine knappe Angelegenheit           
                //m.Add(makeMarketsGeneric("Dog", "Dog", "weak", "0.3", 0));
                //// außer diesen zwei Start-Markets, mach noch 3 Questionmarks, davon 1-2 "weak"
                //m.Add(makeMarketsGeneric("New 1", "QM", "weak", "1.9", 3));
                //m.Add(makeMarketsGeneric("New 2", "QM", "weak", "1.6", 3));
                //m.Add(makeMarketsGeneric("New 3", "QM", "strong", "1.3", 3));
                //break;
        }
        return makeMarkets;
    }

    public dbMarket makeMarketsGeneric(dbMarketName _marketName, string type, string subtype, string growth, int toBeAddedInTurn, dbGame g)
    {


        List<dbProductName> pNames = new List<dbProductName>();

        dbMarket m = new dbMarket();
        m.name = _marketName.marketName;

        // wähle die MarketLifetime
        m.marketLifeTimeUp = 5;
        m.marketLifeTimeDown = 5;

        m.type = type;
        // HIER: Ermittle einen Markt und gleichzeitig eine geeignete Stepsize       
        int stepsize_up = getStepSizeUp(type, subtype);
        int stepsize_down = getStepSizeDown(type, subtype);

        m.stepsize_up  = stepsize_up;
        m.stepsize_down = stepsize_down;
        // get all ProductNames for this MarketName

        using (InteractiveUniversityEntities1 iu = new InteractiveUniversityEntities1())
        { 
            // aktuell: keine Produktnamen außer Lawnmower Bots vorhanden, dh. 15!
            pNames = (from p in iu.dbProductName where p.marketName_id ==  15 select p).ToList();
        }

    
        //pNames.Add("Competitor1"); 
        //pNames.Add("Competitor2"); pNames.Add("Competitor3"); pNames.Add("Competitor4");

        m.dbProduct = makeProductsGeneric(type, subtype, pNames, m, g); //stepsize_up, stepsize_down, 

        m.growth = growth;
        m.toBeAddedInTurn = toBeAddedInTurn;

       
      
        return m;
    }

    public Collection<dbProduct> makeProductsGeneric(string type, string subtype, List<dbProductName> _pNames, dbMarket _m, dbGame g) //int _stepsize_up, int _stepsize_down, int marketLifeTimeUp, int marketLifeTimeDown,
    {
        Collection<dbProduct> l = new Collection<dbProduct>();
        int _ma1 = 0;
        int _ma2 = 0;
        int _ma3 = 0; // default. wenn 0, dann kein entsprechendes Produkt hinzufügen

        int _winningTotalCFForThisProduct_optimal = 0;
        int _winningTotalCFForThisProduct_minimal = 0;

        int[] pp = {0,0,0};
        switch (type.ToUpper()) {
            case "DOG":
                pp[1] = 1; // wir sind #2
                if (subtype.ToUpper() == "STRONG")
                {
              
                }
                else if (subtype.ToUpper() == "WEAK")
                {                
                    _ma1 = r.Next(45,60);
                    _ma2 = makeMAmitDemManNichtMehrAufholenKann(_ma1, (int)_m.marketLifeTimeDown, (int)_m.stepsize_down);

                    //******************
                    // optimal strategy for DOG-WEAK: sell!                                    
                    _winningTotalCFForThisProduct_optimal = 0;
                    _winningTotalCFForThisProduct_minimal = -(2 * 10); // zweimal investieren, dann aber verkaufen!
                } break;
            case "STAR":
                pp[0] = 1;
                _ma1 = r.Next(40, 50);
                _ma2 = makeMAAufholbar(_ma1, (int)_m.marketLifeTimeUp, (int)_m.stepsize_up);

                _winningTotalCFForThisProduct_optimal = getWinningTotalCFForThisProduct(_m, g, _ma1, _ma2, type.ToUpper(), subtype.ToUpper());
                _winningTotalCFForThisProduct_minimal = _winningTotalCFForThisProduct_optimal - 2 * 10;
                break;
            case "CC":
                pp[0] = 1; // wir sind #1
                if (subtype.ToUpper() == "STRONG")
                {
                    // stepsize = 2; //hardcoded for testing
                    // 1. wir sind #1
                    _ma1 = r.Next(40, 55);
                    _ma2 = makeMAmitDemManNichtMehrAufholenKann(_ma1, (int)_m.marketLifeTimeDown, (int)_m.stepsize_down);    //            

                    _winningTotalCFForThisProduct_optimal = getWinningTotalCFForThisProduct(_m, g, _ma1, _ma2, type.ToUpper(), subtype.ToUpper());
                    _winningTotalCFForThisProduct_minimal = _winningTotalCFForThisProduct_optimal - 10;
                } break;

            case "QM":
                pp[1] = 1; // wir sind #2
                if (subtype.ToUpper() == "STRONG")  // schaffbar
                {
                    _ma1 = r.Next(40, 55);               
                    _ma2 = _ma1 - r.Next(6, 14);  // einholbar mit stepsize = 4;
                    _winningTotalCFForThisProduct_optimal = getWinningTotalCFForThisProduct(_m, g, _ma2, _ma1, type.ToUpper(), subtype.ToUpper());
                    _winningTotalCFForThisProduct_minimal = _winningTotalCFForThisProduct_optimal - 20;
                }
                if (subtype.ToUpper() == "WEAK")
                {
                    _ma1 = r.Next(40, 55);
                    _ma2 = makeMAmitDemManNichtMehrAufholenKann(_ma1, (int)_m.marketLifeTimeDown, (int)_m.stepsize_up);

                    _winningTotalCFForThisProduct_optimal = -10;
                    _winningTotalCFForThisProduct_minimal = - 20;
                }                                                    
                break;
   
            default: break;
        }
        
        l.Add(new dbProduct() { name = pp[0] == 1 ? "Our Product" : "Competitor 1", playerProduct = pp[0], dbProductState = makeProductState(0, _ma1), winningTotalCFForThisProduct_minimal = _winningTotalCFForThisProduct_minimal, winningTotalCFForThisProduct_optimal = _winningTotalCFForThisProduct_optimal });
        l.Add(new dbProduct() { name = pp[1] == 1 ? "Our Product" : "Competitor 1", playerProduct = pp[1], dbProductState = makeProductState(0, _ma2), winningTotalCFForThisProduct_minimal = _winningTotalCFForThisProduct_minimal, winningTotalCFForThisProduct_optimal = _winningTotalCFForThisProduct_optimal });

        //l.Add(new dbProduct() { name = _pNames[0].productName , playerProduct = pp[0], dbProductState = makeProductState(0, _ma1) });
        //l.Add(new dbProduct() { name = _pNames[1].productName, playerProduct = pp[1], dbProductState = makeProductState(0, _ma2) });  

        if (100 - _ma1 - _ma2 > 10)
        {
            _ma3 = r.Next(5, 10);    // nur hinzufügen wenn noch Platz ist in den 100%
            //l.Add(new dbProduct() { name = _pNames[2].productName, playerProduct = pp[2], dbProductState = makeProductState(0, _ma3) });
            l.Add(new dbProduct() { name = "Competitor 2", playerProduct = pp[2], dbProductState = makeProductState(0, _ma3), winningTotalCFForThisProduct_minimal = _winningTotalCFForThisProduct_minimal, winningTotalCFForThisProduct_optimal = _winningTotalCFForThisProduct_optimal }); 
        }
        

        return l;
    }

    private static int getWinningTotalCFForThisProduct(dbMarket _m, dbGame g, int wir, int die, String _type, String _subtype)
    {
        // wie viel muß man investieren, um sich den Gegner vom Leibe zu halten?
        // -> wie viele runden muß man 10 investieren? maximal "marketLifeTimeUp" Runden
        // 
        // es fehlt: +2/-2 loan -> vermieden da man so investiert damit man drüber bleibt
        // upper limit, lower limit -> vermieden da man ja knapp hinfährt und der MS% nicht nach oben abhaut

        int invest = 10;
        int cashflowOben = 0;
        int cashflowUnten = 0;
        if (_type == "STAR" || _type == "QM")
        {         
            for (int i = 0; i < (int)_m.marketLifeTimeUp; i++)
            {
                if (die + ((int)_m.stepsize_up * 2) >= wir)  // muß investieren!
                {
                    cashflowOben += g.cfStar - invest;
                    wir += (int)_m.stepsize_up;
                    die -= (int)_m.stepsize_up;
                }
                else
                {
                    cashflowOben += g.cfStar;
                    wir -= (int)_m.stepsize_up;
                    die += (int)_m.stepsize_up;
                }
            }    
        }

        for (int i = 0; i < (int)_m.marketLifeTimeDown; i++)
        {
            if (die + (int)_m.stepsize_down >= wir)
            {
                cashflowUnten += g.cfCC - invest;
                wir += (int)_m.stepsize_down;
                die -= (int)_m.stepsize_down;
            }
            else
            {
                cashflowUnten += g.cfCC;
                wir -= (int)_m.stepsize_down;
                die += (int)_m.stepsize_down;
            }
        }
        return cashflowOben + cashflowUnten;
    }

    public int getStepSizeUp(string type, string subtype)
    {
        int stepSizeUp;
        switch (type)
        {
            case "CC": stepSizeUp = 1; break;
            case "DOG": stepSizeUp = 1; break;

            case "STAR": stepSizeUp = subtype.ToUpper() == "WEAK" ? r.Next(1, 2 + 1) : stepSizeUp = r.Next(3, 4 + 1); break;
            case "QM": stepSizeUp = subtype.ToUpper() == "WEAK" ? r.Next(1, 2 + 1) : stepSizeUp = r.Next(3, 4 + 1); break;
            default: stepSizeUp = 2; break;
        }

        return stepSizeUp;
    }

    public int getStepSizeDown(string type, string subtype)
    {
        int stepSizeDown;
        switch (type)
        {
            case "CC": stepSizeDown = subtype.ToUpper() == "WEAK" ? r.Next(1, 2 + 1) : stepSizeDown = r.Next(2, 2 + 1); break;
            case "DOG": stepSizeDown = subtype.ToUpper() == "WEAK" ? r.Next(1, 2 + 1) : stepSizeDown = r.Next(2, 3 + 1); break;

            case "STAR": stepSizeDown = subtype.ToUpper() == "WEAK" ? r.Next(1, 1 + 1) : stepSizeDown = r.Next(3, 4 + 1); break;
            case "QM": stepSizeDown = subtype.ToUpper() == "WEAK" ? r.Next(1, 1 + 1) : stepSizeDown = r.Next(3, 4 + 1); break;
            default: stepSizeDown = 2; break;
        }

        return stepSizeDown;
    }
    private int makeMAmitDemManNichtMehrAufholenKann(int uneinholbarerMA, int marketLifeTimeDown, int stepsize)
    {
        int MAmitDemManNichtMehrAufholenKann;
        // stepsize, wenn man nicht aufholen kann: muß klein gewählt sein, sonst ist Abstand zw. #1 und #2 viel zu groß (step * 2 * Runden...)
        
        int SicherheitsabstandDamitAufholenNichtMöglichIst = r.Next(3, 6);

        int _upperLimit = uneinholbarerMA - stepsize * 2 * marketLifeTimeDown - SicherheitsabstandDamitAufholenNichtMöglichIst; // standard uneinholbar
        int _lowerLimit = uneinholbarerMA / 2 + 1;
      //  int _lowerLimit = Math.Min(_upperLimit, uneinholbarerMA / 2 + 1);

        MAmitDemManNichtMehrAufholenKann = r.Next(_lowerLimit, Math.Max(_lowerLimit, _upperLimit));
        return MAmitDemManNichtMehrAufholenKann;
    }

    private int makeMAAufholbar(int einholbarerMA, int marketLifeTimeUpOrDown, int stepsize)
    {
        int MAAufholbar;        
        int puffer = r.Next(3, 6);

        int _lowerLimit = Math.Max(einholbarerMA / 2 + 1, einholbarerMA - stepsize * 2 * marketLifeTimeUpOrDown + puffer);
        //int _upperLimit = Math.Min(_lowerLimit, einholbarerMA + 10);  // soll nicht zu groß sein, damit es nicht zu einfach und offensichtlich ist

        MAAufholbar = _lowerLimit;  //r.Next(_lowerLimit, Math.Max(_lowerLimit, _upperLimit));

        return MAAufholbar;
    }


    public Collection<dbProductState> makeProductState(int _turn, double ms)
    {
        Collection<dbProductState> l = new Collection<dbProductState>();
        l.Add(new dbProductState() { turn = _turn, marketshare = ms });  // turn? obsolet denke ich mal
        return l;
    }

    public List<dbMarketName> findMarketNames(int _counthigh, int _countlow)
    {
        List<dbMarketName>  mn = new List<dbMarketName>();
        
        using (InteractiveUniversityEntities1 iu = new InteractiveUniversityEntities1())
        {
            List<dbMarketName> highMarkets = (from m in iu.dbMarketName where m.marketType == "high" select m).ToList();
            for (int i = 0; i < _counthigh; i++)
            {
                if (highMarkets.Count() == 0) // keine passenden Märkte mehr verfügbar
                {
                    dbMarketName n = new dbMarketName();
                    n.marketName = "Market" + i + r.Next(100, 999);
                    n.marketType = "high";
                }
                else
                {
                    int _index = r.Next(0, highMarkets.Count());  // wähle einen zufälligen Kandidaten aus allen "high"en
                    mn.Add(highMarkets[_index]);
                    highMarkets.RemoveAt(_index);               
                }                
            }
            List<dbMarketName> lowMarkets = (from m in iu.dbMarketName where m.marketType == "low" select m).ToList();
            for (int i = 0; i < _countlow; i++)
            {
                if (lowMarkets.Count() == 0) // keine passenden Märkte mehr verfügbar
                {
                    dbMarketName n = new dbMarketName();
                    n.marketName = "Market" + i + r.Next(100, 999);
                    n.marketType = "low";
                }
                else
                {
                    int _index = r.Next(0, highMarkets.Count());  // wähle einen zufälligen Kandidaten aus allen "high"en
                    mn.Add(lowMarkets[_index]);
                    lowMarkets.RemoveAt(_index);
                }                
            }
        }
        return mn;
    }

    private static void findGoodProductNames(dbGame _g)
    {
       List<String> CCNames = new List<String>() { "C1", "C2", "C3" };
    }

    private static void assignAdvisorsToMarkets(Collection<dbMarket> marketsInGame)
    {
        Random r = new Random();

        List<string> _advisorNames = new List<string>() { "PM1", "PM2", "PM3", "PM4", "PM5" };
        List<string> _advisorImagesources  = new List<string>() {
            "img/alt_joyride%20icons/projectmanager1s.jpg",
            "img/alt_joyride%20icons/projectmanager2s.jpg",
            "img/alt_joyride%20icons/projectmanager3s.jpg",
            "img/alt_joyride%20icons/projectmanager4s.jpg",
            "img/alt_joyride%20icons/projectmanager5s.jpg",
        };

        List<string> PMofQMStatements = new List<string>() {  // stuff the Projectmanager of a Questionmark would say
            "This Product is the future of our company!",
            "This Product is the next big thing!",
            "We need investment for growth!"
        };

        List<string> PMofStarStatements = new List<string>()
        {
            "We are market leader but the competitors try to catch up!",
            "If we stay Number One this product will bring profitable for many years to come!"
        };
        //List<string> PMofStarStatements = new List<string>() {
        //    "We are market leader but the competitors try to catch up!",
        //    "If we stay Number One this product will bring profitable for many years to come!"
        //};

        List<string> PMofDogStatements = new List<string>()
        {
            "Our company has always made this product.",
            "We are not doing so well, but we can make the turnaround."
        };

        List<string> PMofCCStatements = new List<string>()
        {
            "This product is the pride and joy of this company",
            "This product brings the cash flow, we don't need the other products"
        };


        foreach (var m in marketsInGame)
        {
            foreach (var p in m.dbProduct)
            {
                if (p.playerProduct == 1)
                {
                    if (m.type.ToUpper() == "CC")
                    {
                        p.advisor_feedback = PMofCCStatements[0];
                        PMofCCStatements.Add(PMofCCStatements[0]);                        
                        PMofCCStatements.RemoveAt(0);

                                       
                        p.advisor_enabled="true";

                    }
                    else if (m.type.ToUpper() == "DOG")
                    {
                        p.advisor_feedback = PMofDogStatements[0];
                        PMofDogStatements.Add(PMofDogStatements[0]);
                        PMofDogStatements.RemoveAt(0);
                    }
                    else if (m.type.ToUpper() == "STAR")
                    {
                        p.advisor_feedback = PMofStarStatements[0];
                        PMofStarStatements.Add(PMofStarStatements[0]);
                        PMofStarStatements.RemoveAt(0);
                    }
                    else if (m.type.ToUpper() == "QM")
                    {
                        p.advisor_feedback = PMofQMStatements[0];
                        PMofQMStatements.Add(PMofQMStatements[0]);
                        PMofQMStatements.RemoveAt(0);
                    }

                    int _r = r.Next(0, _advisorNames.Count());
                    p.advisor_imagesource = _advisorImagesources[_r];
                    p.advisor_name = _advisorNames[_r]; 

                    _advisorNames.Add(_advisorNames[_r]);
                    _advisorNames.RemoveAt(_r);
                    _advisorImagesources.Add(_advisorImagesources[_r]);
                    _advisorImagesources.RemoveAt(_r);

                }
            }            
            
        }

    }

    private static void assignColorsToMarkets(Collection<dbMarket> marketsInGame)
    {
        List<string> innerColors = new List<string>() { "#a01717", "#1F4689", "#7bade1", "#528b75", "#cfc386" };


        foreach (var m in marketsInGame)
        {
            List<string> greyColors = new List<string>() { "#9ca2a6" };  //nur noch 1 Farbe für Konkurrenz! //{ "#747d82", "#9ca2a6", "#c5c9cc", "#f0f1f2" };  //reset pro Markt, beginn mit dem dunkelsten Grau, muß genügend Graus geben, keine Rotation
            foreach (var p in m.dbProduct)
            {
                if (p.playerProduct == 1)
                {
                    p.primaryColor = innerColors[0];
                    p.secondaryColor = innerColors[0];
                }
            }
            foreach (var p in m.dbProduct)
            {
                if (p.playerProduct == 0)
                {
                    p.primaryColor = greyColors[0];
                    p.secondaryColor = innerColors[0];

                    greyColors.Add(greyColors[0]);
                    greyColors.RemoveAt(0);
                }
            }
            innerColors.Add(innerColors[0]); //den ersten verwendeten Eintrag nach hinten kopieren...
            innerColors.RemoveAt(0);  //und vorne löschen - damit sich der erste Eintrag erst wiederholt, wenn alle anderen Farben verwendet sind
        }
    }
    

    public dbGame(bool initialize, string gameName)
        : this()
    {
        if (initialize) { this.Initialize(gameName); }
    }


    //obsolet:
    //public Collection<dbProduct> makeProducts(string type, string randomMarketName)
    //{
    //    Collection<dbProduct> l = new Collection<dbProduct>();
    //    if (type.ToUpper() == "STAR1")
    //    {  //Namen später zufällig
    //        double[] ms = someMarketShares();
    //        l.Add(new dbProduct() { name = "iPhone", playerProduct = 1, dbProductState = makeProductState(0, ms[0]) }); // turn, market share
    //        l.Add(new dbProduct() { name = "Samsung", playerProduct = 0, dbProductState = makeProductState(0, ms[1]) });
    //        l.Add(new dbProduct() { name = "Nokia", playerProduct = 0, dbProductState = makeProductState(0, ms[2]) });
    //        l.Add(new dbProduct() { name = "HTC", playerProduct = 0, dbProductState = makeProductState(0, ms[3]) });
    //    }
    //    else if (type.ToUpper() == "DOG1")
    //    {
    //        double[] ms = someMarketShares();
    //        l.Add(new dbProduct() { name = "Hakle", playerProduct = 0, dbProductState = makeProductState(0, ms[0]) });
    //        l.Add(new dbProduct() { name = "Superweich", playerProduct = 1, dbProductState = makeProductState(0, ms[1]) });
    //        l.Add(new dbProduct() { name = "Duftschön", playerProduct = 0, dbProductState = makeProductState(0, ms[2]) });
    //        l.Add(new dbProduct() { name = "Reißtnicht", playerProduct = 0, dbProductState = makeProductState(0, ms[3]) });
    //    }
    //    else if (type.ToUpper() == "CASH COW TUTORIAL")
    //    {
    //        // Ziel: Sichere den Cash Erzeuger für 10 Runden / bis der Markt verschwindet.
    //        // MA kurzfristig in Cash umwandelbar (Hochpreis)
    //        // max 2x #2, max 4x #3 ?????
    //        // man kann locker auch nichts investieren, solange der Konkurrent weit weg ist
    //        // der Markt stirbt irgendwann -> Summe an Rückflüssen = Highscore            
    //        l.Add(new dbProduct() { name = "Our Cash Cow", playerProduct = 1, dbProductState = makeProductState(0, 55) });
    //        l.Add(new dbProduct() { name = "Competitor 1", playerProduct = 0, dbProductState = makeProductState(0, 35) });
    //        l.Add(new dbProduct() { name = "Competitor 2", playerProduct = 0, dbProductState = makeProductState(0, 20) });
    //    }

    //    else if (type == "Questionmark_Random")
    //    {
    //        if (randomMarketName == "Impossible Market")  // Markt der auf keinen Fall CC werden kann
    //        {
    //            l.Add(new dbProduct() { name = "Our Product", playerProduct = 1, dbProductState = makeProductState(0, r.Next(24, 24)) });
    //            l.Add(new dbProduct() { name = "Competitor 1", playerProduct = 0, dbProductState = makeProductState(0, r.Next(45, 45)) });
    //            l.Add(new dbProduct() { name = "Competitor 2", playerProduct = 0, dbProductState = makeProductState(0, r.Next(15, 15)) });
    //        }
    //        else
    //        {
    //            //string _productName = randomMarketName + "_" + r.Next(99);
    //            l.Add(new dbProduct() { name = "Our Product", playerProduct = 1, dbProductState = makeProductState(0, r.Next(25, 35)) });
    //            l.Add(new dbProduct() { name = "Competitor 1", playerProduct = 0, dbProductState = makeProductState(0, r.Next(40, 45)) });
    //            l.Add(new dbProduct() { name = "Competitor 2", playerProduct = 0, dbProductState = makeProductState(0, r.Next(10, 17)) });
    //        }

    //    }
    //    return l;
    //}

    ////obsolet
    //public double[] someMarketShares()
    //{
    //    // Im Kern haben wir echte Prozentsätze
    //    // diese können dann bei Bedarf (easy mode) als relative Marktanteile dargestellt werdne
    //    // im "Normal mode" sollten diese vom Studenten selbst ermittelt werden.

    //    List<double[]> absoluteMarketShares = new List<double[]>();
    //    double[] market1 = { 40, 30, 20, 10 };
    //    double[] market2 = { 47, 30, 15, 10 };
    //    double[] market3 = { 45, 28, 20, 5 };
    //    double[] market4 = { 50, 28, 20, 12 };
    //    double[] market5 = { 35, 30, 25, 10 };
    //    //double[] market5 = { 70, 15, 10, 5 };  //max faktor zw. #1 und #2: 2x!

    //    absoluteMarketShares.Add(market1);
    //    absoluteMarketShares.Add(market2);
    //    absoluteMarketShares.Add(market3);
    //    absoluteMarketShares.Add(market4);
    //    absoluteMarketShares.Add(market5);

    //    return absoluteMarketShares[r.Next(0, absoluteMarketShares.Count())];
    //}

}