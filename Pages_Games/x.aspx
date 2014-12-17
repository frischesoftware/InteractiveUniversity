<%@ Page Language="C#" AutoEventWireup="true" CodeFile="x.aspx.cs" Inherits="Pages_Games_x" %>

<%@ Register Src="~/WebControls/InvestmentDecisionsX.ascx" TagPrefix="uc1" TagName="InvestmentDecisionsX" %>


<!DOCTYPE html ng-app="myApp">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <script src="../packages/jQuery.1.9.1/Content/Scripts/jquery-1.9.1.min.js"></script>      
    <script src="../packages/bootstrap.3.0.2/content/Scripts/bootstrap.min.js"></script>

    <script src="../Scripts/Lib/d3.v3.min.js"></script>
    <script src="../packages/angularjs.1.2.2/content/Scripts/angular.min.js"></script>
    <script src="../Scripts/Lib/ngm-if.js"></script>
    <script src="../Scripts/Lib/Underscore.js"></script>

    <script src="../Scripts/1_BostonBox/up.js"></script>
    
    <script src="../Scripts/1_BostonBox/initColors.js"></script>
    <script src="../Scripts/1_BostonBox/Directives.js"></script>
   
    <script src="../Scripts/1_BostonBox/designDiagramNew.js"></script>
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

    <script src="../Scripts/Lib/svg.js"></script>
        <link href="../packages/bootstrap.3.0.2/content/Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Styles/merriweathersans.css" rel="stylesheet" />
</head>
<body ng-controller="DataCtrl">
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-lg-4" style="width: 380px">
                    <img src="../img/InteractiveUniversityLogo_flach.jpg" />
                    <br />
                    <br />
                    Growth Share Matrix Game
                <br />
                    <br />
                    <p>
                        <a class="btn btn-primary" role="button" href="#">Main Menu</a>
                    </p>
                    <p>
                        <a class="btn btn-primary" role="button" href="#">Reset Game</a>
                    </p>
                    <p>
                        <a class="btn btn-primary" role="button" href="#">Help?</a><br />
                    </p>
                   
                    <uc1:InvestmentDecisionsX runat="server" ID="InvestmentDecisionsX" />
                    <br />
                    TURN
                </div>
                <div class="col-lg-4" style="width: 440px">
                </div>
            </div>
        </div>

    </form>
</body>
</html>















            <div class="col-lg-4" style="width:440px">
               <%-- <uc1:W4_InfoBoxes2 runat="server" ID="W4_InfoBoxes2" />--%>
                <svg id="d3" style="height: 400px; width: 400px;">  <%--style="background-image:url('matrix400_400.jpg')"--%>
                  <%--  <img src="../img/BostonBox/dog.jpg" />--%>
                   <%-- <svg height="210" width="500">
                        <image x="50" y="150" width='100' height="100" xlink:href="../img/BostonBox/dog.jpg"  />
                    </svg>--%>
                </svg>

            </div>
            <div class="col-lg-4" style="width: 700px">      
              <%--  <uc1:ProductPortfolio runat="server" ID="ProductPortfolio" />--%>
               <%-- <uc1:W_RIGHT_New_Products runat="server" ID="W_RIGHT_New_Products" />--%>
            </div>






