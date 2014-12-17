<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BostonBox.aspx.cs" Inherits="D3test" %>

<%@ Register Src="~/WebControls/W_RIGHT_Current_Products.ascx" TagPrefix="uc1" TagName="W_RIGHT_Current_Products" %>
<%@ Register Src="~/WebControls/W_RIGHT_New_Products.ascx" TagPrefix="uc1" TagName="W_RIGHT_New_Products" %>
<%@ Register Src="~/WebControls/W_RIGHT_Dead_Products.ascx" TagPrefix="uc1" TagName="W_RIGHT_Dead_Products" %>
<%@ Register Src="~/WebControls/Advisor_General.ascx" TagPrefix="uc1" TagName="Advisor_General" %>
<%@ Register Src="~/WebControls/ControlPanel_classic.ascx" TagPrefix="uc1" TagName="ControlPanel_classic" %>
<%@ Register Src="~/WebControls/ControlPanel_small.ascx" TagPrefix="uc1" TagName="ControlPanel_small" %>
<%@ Register Src="~/WebControls/W_RIGHT_Current_Products_wide.ascx" TagPrefix="uc1" TagName="W_RIGHT_Current_Products_wide" %>
<%@ Register Src="~/WebControls/W_RIGHT_Current_Products_2of3.ascx" TagPrefix="uc1" TagName="W_RIGHT_Current_Products_2of3" %>
<%@ Register Src="~/WebControls/W4_InfoBoxes.ascx" TagPrefix="uc1" TagName="W4_InfoBoxes" %>
<%@ Register Src="~/WebControls/Game_State.ascx" TagPrefix="uc1" TagName="Game_State" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" ng-app="myApp">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>

    

    <script src="../Scripts/Lib/d3.v3.min.js"></script>
    <script src="../packages/jQuery.1.9.1/Content/Scripts/jquery-1.9.1.min.js"></script>
    <script src="../packages/angularjs.1.2.2/content/Scripts/angular.min.js"></script>
    <script src="../Scripts/Lib/ngm-if.js"></script>
    <script src="../Scripts/Lib/Underscore.js"></script>

    <script src="../Scripts/1_BostonBox/up.js"></script>
    <script src="../Scripts/1_BostonBox/E_designDiagram.js"></script>
    <script src="../Scripts/1_BostonBox/initColors.js"></script>
    <script src="../Scripts/1_BostonBox/Directives.js"></script>
    <link href="../Styles/1280_16_col.css" rel="stylesheet" />
    <link href="../Styles/uwesStyles.css" rel="stylesheet" />



    <%--new set of scripts - one function per file--%>
    <script src="../Scripts/js/applyDeletionsFirst.js"></script>
    <script src="../Scripts/js/applyGameDataChanges.js"></script>
    <script src="../Scripts/js/determineTotalCashFlowEtc.js"></script>
    <script src="../Scripts/js/applyCashFlowChanges.js"></script>
    <script src="../Scripts/js/applyStrategiesNew.js"></script>
    <script src="../Scripts/js/moveMarketFromQM_STARtoCC_Dog.js"></script>

    <script src="../Scripts/js/Create_Data_Playerproduct.js"></script>
    <script src="../Scripts/js/Create_Data_Relative.js"></script>

    <script src="../Scripts/js/GetCurrentProductType.js"></script>

    <script src="../Scripts/js/addRemovedMarket.js"></script>
    <script src="../Scripts/js/removeThisMarketFromGame.js"></script>

    <script src="../Scripts/js/countType.js"></script>

<script src="../Scripts/js/updateMarketLifeTime.js"></script>


<%--    <link href='http://fonts.googleapis.com/css?family=Merriweather+Sans' rel='stylesheet' type='text/css' />--%>
    <link href="../Styles/merriweathersans.css" rel="stylesheet" />
</head>
<body ng-controller="DataCtrl">
    <form id="form1" runat="server">     
        <asp:LoginStatus ID="LoginStatus2" runat="server" />   
        <div id="titelleiste" style="height: 64px">
            <div id="khanacademy-top-header-container">
                <img style="left: 50%; position: absolute" src="img/InteractiveUniversityLogo_flach.jpg" />
            </div>
        </div>

        <div class='clear' style="height: 20px">&nbsp;</div>

        
        <%-- <uc1:Advisor_General runat="server" ID="Advisor_General" />--%>


        <div class='container_16'>
            <div class="three_product_boxes t">
                <%--topic-info_--%>
                        The Boston Box or Growth Share Matrix        
            </div>
            <div class='clear' style="height: 20px">&nbsp;</div>
        </div>

        <div id="container" class="container_16">
             <div id="leftSideBar" class="grid_3 alpha three_product_boxes" style="background-color: #ffffff;">  
                 <uc1:W4_InfoBoxes runat="server" ID="W4_InfoBoxes" />
                 <div class="clear" style="height: 20px"></div>
                               
                <div class="greybar">SCENARIOS</div>
                <div class="availablegamesCells">
                    <div class="three_product_boxes">Tutorials</div>
                    <div class="three_product_boxes" style="background-color: #ffffff;">
                        <ul ng-repeat="availablegame in availablegames_tutorials" ng-click="previewNewGame($index, 'tutorial' )" style="cursor: pointer;">
                            <div ngm-if='availablegame.gameName == gamedata[0].currentActiveGame'>
                                <li><a style="width: 210px" value="{{availablegame.gameName}}" ng-model="selectedGame"></a></li>
                                <span class="activeScenario">{{availablegame.gameName}}</span>
                            </div>
                            <div ngm-if='availablegame.gameName != gamedata[0].currentActiveGame'>
                                <li><a style="width: 210px" value="{{availablegame.gameName}}" ng-model="selectedGame"></a></li>
                                <span>{{availablegame.gameName}}</span>
                            </div>
                        </ul>
                    </div>

                    <div class="three_product_boxes">Lessons</div>
                    <div class="three_product_boxes" style="background-color: #ffffff;">
                        <ul ng-repeat="availablegame in availablegames_lessons" ng-click="previewNewGame($index, 'lesson')" style="cursor: pointer;">
                            {{availablegame.gameName}}
                        <li><a style="width: 210px" value="{{availablegame.gameName}}" ng-model="selectedGame"></a></li>
                        </ul>
                    </div>

                    <div class="three_product_boxes">Challenges</div>
                    <div class="three_product_boxes" style="background-color: #ffffff;">
                        <ul ng-repeat="availablegame in availablegames_challenges" ng-click="previewNewGame($index, 'challenge')" style="cursor: pointer;">
                            {{availablegame.gameName}}
                        <li><a style="width: 210px" value="{{availablegame.gameName}}" ng-model="selectedGame"></a></li>
                        </ul>
                    </div>
                    <%--  <ul ng-repeat="availablegame in availablegames" ng-click="previewNewGame($index)" style="cursor: pointer;">
                        {{availablegame.gameName}}
                        <li><a style="width: 210px" value="{{availablegame.gameName}}" ng-model="selectedGame"></a></li>                       <%-- $parent.selectedGame = availablegame; --%>
                    <%--   </ul>--%>
                </div>
                 <div class="three_product_boxes" style="background-color: #ffffff;">
                     <asp:HiddenField runat="server" ID="hiddenTextForBackend"></asp:HiddenField>
                     <asp:Button class="redbutton" ID="btnNewGame" runat="server" OnClick="btnNewGame_Click" Text="START {{selectedGame}}"></asp:Button>
                     <%--  <input class="redbutton" type="button" id="Button2" ng-click="nextTurnAngular()" value="NEXT" />--%>
                     <div>
                         <h2>
                             <label id="availablegames_GameName_placeholder"></label>
                         </h2>
                         <label id="availablegames_GameDescription_placeholder"></label>
                     </div>

                 </div>
            </div>

            <%--ALLLES AUSSER DER LINKEN SIDEBAR--%>
            <div class="grid_13" style="margin-left: 0px">
                <div id="links" class="grid_6 ">
                    <div ngm-if='gameIsOver == "false"' class="three_product_boxes">
                        <div class="greybar">ACTIVE SCENARIO</div>
                        <div class="t">{{gamedata[0].currentActiveGame}} </div>
                    </div>
                     <div ngm-if='gameIsOver == "true"' class="three_product_boxes">
                        <div class="greybar">GAME OVER</div>
                        <div class="t">{{gamedata[0].gameOverText}}</div>
                    </div>


                    <div class="three_product_boxes" style="background-color: #ffffff">
                        <svg id="d3" style="margin: 30px; height: 400px; width: 400px;"></svg>
                    </div>
                    <div class="clear" style="height: 20px"></div>


                    <uc1:Game_State runat="server" ID="Game_State" />

                </div>
                <div class="grid_6 omega">
                    <uc1:ControlPanel_small runat="server" ID="ControlPanel_small" />
                    <div class="clear" style="height: 20px"></div>
                    <%--advisors waren hier--%>
                    <uc1:W_RIGHT_Current_Products_2of3 runat="server" ID="W_RIGHT_Current_Products_2of3" />
                    <div class="clear" style="height: 20px"></div>
                    
                    <div ngm-if='gameSetupData[0].showNewProducts == "True"'>
                        <uc1:W_RIGHT_New_Products runat="server" ID="W_RIGHT_New_Products" />
                        <div class="clear" style="height: 20px"></div>
                    </div>                    

                    <div ngm-if='gameSetupData[0].showDeadProducts == "True"'>
                        <uc1:W_RIGHT_Dead_Products runat="server" ID="W_RIGHT_Dead_Products" />
                    </div>
                           
                </div>     
              <%--   <uc1:W_RIGHT_Current_Products_wide runat="server" ID="W_RIGHT_Current_Products_wide" />   --%>          
            </div>
        </div>



        <script type="text/javascript">
            $(document).ready(function () {   // some initialization
                sessionStorage["showRelativeAbsoluteMarketShare"] = "relative" //var showRelativeAbsoluteMarketShare = "relative";                 
                var data_playerproduct = Create_Data_Playerproduct(data_server);
                var data_relative = Create_Data_Relative(data_server, data_playerproduct);
                // mach die linke Spalte so hoch wie die Seite
                var element = document.getElementById("d3");
                var rect = element.getBoundingClientRect();              
                $(".availablegamesCells p:last").addClass("last");

            });
        </script>
        <script type="text/javascript">   // Create the Diagram background             
            var w = 400; var h = 400; var padding = 20;
            var svg = d3.select("#d3").append("svg").attr("width", w).attr("height", h).style("border-style", "solid").style("border-width", "thin").style("border-color", "#747d82");
            var xScale = d3.scale.linear().domain([2, 0]).range([padding, w - padding]);
            var yScale = d3.scale.linear().domain([0, 2]).range([h - padding, padding]);
            var xAxis = d3.svg.axis().scale(xScale).orient("bottom");
            var yAxis = d3.svg.axis().scale(yScale).orient("left");            
            E_designDiagram(gameSetupData);
        </script>
        <script>
            //NEW INVESTMENT - DIE 3 BUTTONS OBEN: +10   0   X          
            $('#sites input:radio').addClass('input_hidden');
            $(document).on('click', '#sites label', function () {
                $(this).addClass('selected').siblings().removeClass('selected');
            });

            //NEW PRODUCTS - +add
            // $('input:checkbox').addClass('input_hidden');
            //verhindere Textmarkierung soweit wie möglich/nötig
            $('#checks label').attr('unselectable', 'on').css('UserSelect', 'none').css('MozUserSelect', 'none');

            //$(document).on('click', '#checks label', function () {
            //    //alert($(this).valueOf);
            //    $(this).toggleClass('selected');
            //});

            //DAS HIGHLIGHTEN DER AVALIABLEGAMES LINKS

            /*neu: 
            1. das aktuelle Game bleibt gelb selektiert ('activeScenario')
            2. das selektierte Game wird rot markiert ('selectedScenario')
            */


            /*was macht dieser Code?*/
            $(document).on('click', '.availablegamesCells ul', function () {
                $(this).addClass('selectedScenario').siblings().removeClass('selectedScenario');
            });


        </script>

    </form>
</body>

<script type="text/javascript">
    //directive was here
    angular.module('myApp', ['external_directives']);
    // Array Remove - By John Resig (MIT Licensed)
    Array.prototype.remove = function (from, to) {
        var rest = this.slice((to || from) + 1 || this.length);
        this.length = from < 0 ? this.length + from : from;
        return this.push.apply(this, rest);
    };

    function DataCtrl($scope, $http) {
        $scope.gameIsOver = "false";
        $scope.showRelativeAbsoluteMarketShare = "relative";

        // +10 0 kill: Übernahme in data_playerproduct
        $scope.changeInvestmentThisTurn = function (index, _val) {
            $scope.data_playerproduct[index].investedThisTurn = _val;
            // now check if *ALL* products have received an investment decision -> then enable the "NEXT"-Button

            $scope.data_playerproduct[index].investmentDecisionMade = true;

            $("#btnNextAngular").addClass("redbutton");
            $("#btnNextAngular").prop('disabled', false);

            for (var i = 0; i < $scope.data_playerproduct.length; i++) {
                if ($scope.data_playerproduct[i].investmentDecisionMade == false) {  //wenns auch nur einen gibt bei dem noch nicht geklickt wurde....
                    disableNextButton();
                }
            }
        }

        $scope.addProduct = function (index, id) {
            if ($scope.data_unborn_server[index].investmentDecisionMade == false) {
                $scope.data_unborn_server[index].investmentDecisionMade = true;
                $("#c" + id).addClass("selectedScenario");

            }
            else {
                $scope.data_unborn_server[index].investmentDecisionMade = false;
                $("#c" + id).removeClass("selectedScenario");
            }  
        }

        $scope.previewNewGame = function (index, gameType) {
            var gameName;
            var gameDescription;
            if (gameType == 'tutorial') {
                gameName = $scope.availablegames_tutorials[index].gameName;
                gameDescription = $scope.availablegames_tutorials[index].gameDescription;
            }
            else if (gameType == 'lesson') {
                gameName = $scope.availablegames_lessons[index].gameName;
                gameDescription = $scope.availablegames_lessons[index].gameDescription;
            }
            else if (gameType == 'challenge') {
                gameName = $scope.availablegames_challenges[index].gameName;
                gameDescription = $scope.availablegames_challenges[index].gameDescription;
            }

            $('#availablegames_GameName_placeholder').text(gameName);
            $('#availablegames_GameDescription_placeholder').text(gameDescription);
            $('#hiddenTextForBackend').val(gameName);          
        }


        $scope.inForDir = 0; //initialize
        $scope.indexforDirScope = function () {
            return $scope.inForDir += 1;
        }

        //$scope.$on('includeContentLoaded', alert("contentloaded"));
        $scope.gamedata = [{
            turn: 0, currentActiveGame: "..........",
            allMarketsSalesLastTurn: 0,
            allMarketsInvestLastTurn: 0,
            allMarketsCashFlowLastTurn: 0,
            allMarketsCashFlowAllTime: 0,
            totalCashFlow: 0,
            totalInvestThisTurn: 0,
            numberOfBadTurnsSoFar: 0,
        }]; //, feedback: "optimize it"            



        $scope.gamedata[0].currentActiveGame = gameSetupData[0].currentActiveGame;

        $scope.data_dead = [];


        $scope.addNewMarkets_server = function () {
            var tobeadded = _($scope.data_unborn_server).where({ investmentDecisionMade: true });
            tobeadded = _.filter($scope.data_unborn_server, function (a) {
                return _.find(tobeadded, function (b) {
                    return a.marketName === b.marketName;
                });
            });
            $scope.data = _.union($scope.data, tobeadded);  // add the ones to add to $scope.data
            $scope.data_unborn_server = _.difference($scope.data_unborn_server, tobeadded); // remove those that were just added from unborn_server
        }



        $scope.nextTurnAngular = function () {
            $scope.gamedata[0].turn += 1;
            disableNextButton();
            $(".investfield.selected").removeClass("selected");
            for (var i = 0; i < $scope.data_playerproduct.length; i++) {
                $scope.data_playerproduct[i].investmentDecisionMade = false
            }

            for (var i = 0; i < $scope.data.length; i++) {
                // Löschen in einer eigenen Schleife, sonst fehlt ein Element im Array und die Zählung stimmt nicht mehr
                var _currentProdType = GetCurrentProductType($scope.data, $scope.data[i])
                if ($scope.data[i].playerProduct == '1' &&                               // Playerproduct
                    (_currentProdType === "CashCow" || _currentProdType === "Dog") &&    // war schon unten
                    ($scope.data[i].marketLifeTimeDown < 1))                             // Zeit abgelaufen
                {
                    $scope.data[i].markForDeletion = 1;
                }
            }

            for (var i = $scope.data.length - 1; i >= 0 ; i--) {
                if ($scope.data[i].investedThisTurn === "kill") {
                    $scope.data[i].markForDeletion = 1; // nicht mitten im loop löschen: $scope.data = removeThisMarketFromGame($scope.data, $scope.data[i]);                                        
                }
            }



            // REMOVE PRODUCTS (end of life, "killed")
            for (var i = 0; i < $scope.data.length; i++) {
                if ($scope.data[i].markForDeletion == 1) {
                    $scope.data_dead = addRemovedMarket($scope.data, $scope.data[i], $scope.data_dead);
                    $scope.data = removeThisMarketFromGame($scope.data, $scope.data[i]);
                }
            }
            displayDataRefresh();            
            
            
            // Feedback from Ken: evaluate the Cashflow BEFORE changing Sector                     
            $scope.data = applyCashFlowChanges($scope.data, $scope.data_playerproduct, $scope.gameSetupData); //C_Strategy2.js 
            $scope.gamedata = determineTotalCashFlowEtc($scope.data, $scope.gamedata, $scope.data_dead);


            
            // marketLifeTimeUp and marketLifeTimeDown anpassen                
            $scope.data = updateMarketLifeTime($scope.data);         

            //muss hierher: benötigt für "evaluateGameOverResults", aber auch für die Anzeige auf der Seite {{CC_count}}
            $scope.QM_count = countType($scope.data, $scope.data_playerproduct, "Questionmark");
            $scope.Star_count = countType($scope.data, $scope.data_playerproduct, "Star");
            $scope.CC_count = countType($scope.data, $scope.data_playerproduct, "CashCow");
            $scope.Dog_count = countType($scope.data, $scope.data_playerproduct, "Dog");


            // ggf neue Produkte hinzufügen
            //$scope.addNewMarkets();
            $scope.addNewMarkets_server();
            initColors($scope.data, $scope.colors_player, $scope.colors_competition);  //die Farben initialisieren nach addMarkets_server()
            displayDataRefresh();

            
            data_relative = Create_Data_Relative($scope.data, $scope.data_playerproduct);

            $scope.data = applyDeletionsFirst($scope.data, $scope.data_playerproduct);

            //check if all Products have been killed
            if ($scope.data.length == 0) {
                $scope.gamedata[0].gameOverText = evaluateGameOverResults();
                endGameIfGameOver();  // in jedem Fall is das Game over!
            }

            displayDataRefresh();
 
            $scope.data = applyStrategiesNew($scope.data, $scope.data_playerproduct);

            //vorverlegt
            // Feedback from Ken: evaluate the Cashflow BEFORE changing Sector                     
            //produkte dürfen erst ab hier gelöscht werden (erst den kum. CF ermitteln)
            // CHECKING FOR A GAME OVER CONDITION
         
            // max. number of turns exceeded?
            if ($scope.gamedata[0].turn >= $scope.gameSetupData[0].maxTurns) {
                //Evaluate game state - die richtige Anzahl CCs etc.?
                $scope.gamedata[0].gameOverText = evaluateGameOverResults();
                endGameIfGameOver();  // in jedem Fall is das Game over!
            }

            // too many bad turns?
            else if ($scope.gamedata[0].numberOfBadTurnsSoFar >= $scope.gameSetupData[0].maxBadRounds) {
                alert("game over - too many unsuccessful turns");
            }

            // broke?
            else if ($scope.gamedata[0].allMarketsCashFlowAllTime <= $scope.gameSetupData[0].maxNegativeCF) {
                alert("game over - out of money");
            }
            feedback();

            displayDataRefresh();
        }  // Ende Next Turn

        // when game starts with 8 products ($scope.data[i].circleText "1"-"8"), and a new market gets added, 
        // maxCircleText should be determinded to be "8". First new circle is "9".
        // when products get removed and others are added, the old numbers should be retired
        $scope.maxCircleText = 0;

        $scope.data = []; //Start-Daten und aktuelle Daten
        for (i = 0; i < data_server.length; i++) {
            $scope.data.push(data_server[i]);
        }
        $scope.data_unborn_server = []; // Märkte die man noch hinzufügen kann, am Server generiert
        for (var i = 0; i < data_unborn_server.length; i++) {
            $scope.data_unborn_server.push(data_unborn_server[i]);
        }

        $scope.advisor_data = [];
        for (var i = 0; i < advisor_data.length; i++) {
            $scope.advisor_data.push(advisor_data[i]);
        }

        //$scope.advisor_data = [
        //    {
        //advisor_name: "ceos",
        //advisor_imagesource: "img/alt_joyride%20icons/ceos.jpg",
        //advisor_feedback: "build a good portfolio of products",
        //advisor_enabled: "true"
        //    },
        //{
        //advisor_name: "accountant1",
        //advisor_imagesource: "img/alt_joyride%20icons/accountant1s.jpg",
        //advisor_feedback: "get rid of products that cost us money!",
        //advisor_enabled: "false"
        //    },
        //];

        //$scope.gameSetupData
        // Colors ***********************************
        $scope.colors_player = [];
        for (var i = 0; i < colors_player_server.length; i++) {
            $scope.colors_player.push(colors_player_server[i]);
        }

        $scope.colors_competition = [];
        for (var i = 0; i < colors_competition_server.length; i++) {
            $scope.colors_competition.push(colors_competition_server[i]);
        }
        $scope.data = initColors($scope.data, $scope.colors_player, $scope.colors_competition);

        // 1. entferne alle vergebenen Farben aus $scope.colors_player
        for (var i = 0; i < $scope.data.length; i++) {
            for (var j = 0; j < $scope.colors_player.length; j++) {
                if ($scope.data[i].primaryColor == $scope.colors_player[j]) {
                    $scope.colors_player.splice(j, 1);
                }
            }
        }

        $scope.data_playerproduct = []; // nur unsere Produkte
        for (var i = 0; i < $scope.data.length; i++) {
            if ($scope.data[i].playerProduct == '1') {
                $scope.data_playerproduct.push($scope.data[i]);
            }
        }
        $scope.refresh_data_playerproduct = function () {
            $scope.data_playerproduct = [];
            for (var i = 0; i < $scope.data.length; i++) {
                if ($scope.data[i].playerProduct == '1') {
                    $scope.data_playerproduct.push($scope.data[i]);
                }
            }
        }

        $scope.data_relative = Create_Data_Relative($scope.data, $scope.data_playerproduct);

        //$scope.availablegames = [];
        //for (var i = 0; i < availablegames.length; i++) {
        //    $scope.availablegames.push(availablegames[i]);
        //}
        $scope.availablegames_tutorials = [];
        for (var i = 0; i < availablegames_tutorials.length; i++) {
            $scope.availablegames_tutorials.push(availablegames_tutorials[i]);
        }

        $scope.availablegames_lessons = [];
        for (var i = 0; i < availablegames_lessons.length; i++) {
            $scope.availablegames_lessons.push(availablegames_lessons[i]);
        }

        $scope.availablegames_challenges = [];
        for (var i = 0; i < availablegames_challenges.length; i++) {
            $scope.availablegames_challenges.push(availablegames_challenges[i]);
        }

        $scope.gameSetupData = [];
        for (var i = 0; i < gameSetupData.length; i++) {
            $scope.gameSetupData.push(gameSetupData[i]);
        }

        // Idee: laufende analyse basierend auf dem aktuellen Spielstand
        // aktuell nicht umgesetzt.

        function feedback() {
            //was für feedback gibts?
            // Analyse und statisches feedback spezifisch fürs Szenario
            // 1. Analyse der Situation: zu wenig Question Marks? zu viele Dogs?                 
            var dogCount = 0;
            var qmCount = 0;

            for (var i = 0; i < $scope.data.length; i++) {
                // Löschen in einer eigenen Schleife, sonst fehlt ein Element im Array und die Zählung stimmt nicht mehr
                var _currentProdType = GetCurrentProductType($scope.data, $scope.data[i])
                if ($scope.data[i].playerProduct == '1' &&                               // Playerproduct
                    (_currentProdType === "Dog")) {
                    dogCount += 1;
                }
                if ($scope.data[i].playerProduct == '1' &&                               // Playerproduct
                    (_currentProdType === "Questionmark")) {
                    qmCount += 1;
                }
            }
            if (dogCount > 0) {
                $scope.gamedata[0].feedback = "We have " + dogCount + " Dogs in our portfolio. We should kick them out!";
            }
            if (qmCount > 0) {
                $scope.gamedata[0].feedback = "Let's hope that our " + qmCount + " Questionmarks are developing well!";
            }

        }

        function addNewMarkets_server_function()
        {
               var tobeadded = _($scope.data_unborn_server).where({ investmentDecisionMade: true });
            tobeadded = _.filter($scope.data_unborn_server, function (a) {
                return _.find(tobeadded, function (b) {
                    return a.marketName === b.marketName;
                });
            });
            $scope.data = _.union($scope.data, tobeadded);  // add the ones to add to $scope.data
            $scope.data_unborn_server = _.difference($scope.data_unborn_server, tobeadded); // remove those that were just added from unborn_server
        }

        function disableNextButton() {
            $("#btnNextAngular").removeClass("redbutton");
            $("#btnNextAngular").prop('disabled', true);
        }

        function evaluateGameOverResults() {
            for (var i = 0; i < gameSetupData[0].endConditions.length; i++) {   // jede Version der EndCondition durchgehen, welche zutrifft
                if (gameSetupData[0].endConditions[i][1] == $scope.QM_count &&  // 1=QM, 2=Star, 3=CC, 4=Dog
                    gameSetupData[0].endConditions[i][2] == $scope.Star_count &&
                    gameSetupData[0].endConditions[i][3] == $scope.CC_count &&
                    gameSetupData[0].endConditions[i][4] == $scope.Dog_count
                    ) {


                    return gameSetupData[0].endConditions[i][0] + " - " + gameSetupData[0].endConditions[i][5]
                }
                else {
                    // was, wenn kein spezielles Ergebnis erkannt?
                }
            }

        }
        function endGameIfGameOver() {
            $scope.gameIsOver = "true";
            for (var i = 0; i < $scope.data.length; i++) {
                $scope.data = removeThisMarketFromGame($scope.data, $scope.data[i]);
            }

            //if (
            //       gameSetupData[0].endStateCC >= $scope.CC_count &&
            //       gameSetupData[0].endStateDog <= $scope.Dog_count &&
            //       gameSetupData[0].endStateQM == $scope.Star_count &&
            //       gameSetupData[0].endStateStar == $scope.QM_count
            //       ) {
            //    return ("FUNCTION WIN - end result is as required");
            //}
            //else {
            //    return ("FUNCTION LOSS - end result different from which it should have been wrought");
            //}

        }

        // refreshing
        function displayDataRefresh() {
            $('#availablegames_GameName_placeholder').text($scope.gameSetupData[0].currentActiveGame);
            $('#availablegames_GameDescription_placeholder').text($scope.gameSetupData[0].gameDescription);

            $scope.refresh_data_playerproduct();
            if ((typeof sessionStorage["showRelativeAbsoluteMarketShare"] === "undefined") || sessionStorage["showRelativeAbsoluteMarketShare"] === "relative") {
                $scope.data_relative = Create_Data_Relative($scope.data, $scope.data_playerproduct);
                up($scope.data_relative, $scope.data_playerproduct);
            }
            else {
                sessionStorage["showRelativeAbsoluteMarketShare"] = "absolute";
                if (sessionStorage["ShowAllProducts_OnlyOrProducts"] === "our") {
                    up($scope.data, $scope.data_playerproduct);
                }
                else {
                    up($scope.data, $scope.data_playerproduct);
                }
            }
        }
        displayDataRefresh();
    }
</script>
</html>
