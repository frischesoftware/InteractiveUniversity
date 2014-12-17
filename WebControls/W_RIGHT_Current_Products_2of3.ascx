<%@ Control Language="C#" AutoEventWireup="true" CodeFile="W_RIGHT_Current_Products_2of3.ascx.cs" Inherits="W5_BlueButtons" %>


<%-- <div id="links" class="grid_6 ">
                    <div class="three_product_boxes">
                        <div class="greybar">ACTIVE SCENARIO</div>
                        <div class="t">{{gamedata[0].currentActiveGame}} </div>
                    </div>
                    <div class="three_product_boxes" style=" background-color: #ffffff">--%>





<%--three_product_boxes--%>  <%--boxHeader--%>
<div class="three_product_boxes grid_7 alpha">
    <div class="greybar">CURRENT PORTFOLIO</div>
    <div class="grid_3 alpha">
        <div class="t">
            <div>
                <div class="cPH cPCol1">MARKET</div>
                <div class="cPH cPCol2">NR.</div>
                <div class="cPH cPCol3">MARKET </br>SHARE</div>
                <div class="cPH cPCol4">+/-</div>
            </div>
        </div>
    </div>
    <div class="grid_3">
        <div class="t">
            <div>
                Total Cash Flow
            </div>
            <div>
                <div class="cPDetL cPDetR1">{{gamedata[0].allMarketsSalesLastTurn}}</div>
                <div class="cPDetL cPDetR1">{{gamedata[0].allMarketsInvestLastTurn}}</div>
                <div class="cPDetL cPDetR1">{{gamedata[0].allMarketsCashFlowLastTurn}}</div>
            </div>
        </div>
    </div>
    <div class="grid_1 omega cPBox">
        Project </br> Managers
    </div>

</div>



<%-- <div class="three_product_boxes">--%>
<div class="three_product_boxes grid_7 alpha" style="background-color: #ffffff; font-size: 11px; border-left: solid thin; border-bottom: solid thin; border-right: solid thin; border-color: #747d82;">
    <%--style="border-bottom: solid thin; border-left: solid thin; border-color: #747d82; --%>
    <div ng-repeat="p in data_playerproduct">
        <div class="cPBox" style="width:230px;">
            <div class="t_">
                <div class="cPSubH cPSubH1" style="overflow: hidden;">
                        {{p.marketName | uppercase}}
                </div>
                 <div class="cPSubH cPSubH1" style="overflow: hidden;">
                         {{p.cashFlowAllTime}} min: {{p.winningTotalCFForThisProduct_minimal}} opt: {{p.winningTotalCFForThisProduct_optimal}}
                </div>
                <div ng-repeat="d in data">
                    <div ngm-if='d.marketName == p.marketName'>
                        <%--PRODUKTNAME--%>
                        <div ngm-if='d.playerProduct == "1"' id="{{d.circleText}}" class="cPDetL cPCol1" style="color: {{d.primaryColor}}">{{d.name}}</div>
                        <div ngm-if='d.playerProduct == "0"' class="cPDetL cPCol1">{{d.name}}</div>

                        <%--KREIS--%>
                        <div dir-circle-active the-color="d.ci" class="cPDetL cPCol2"></div>
                        <%-- <td>{{d.ci}}</td>--%>
                        <div ngm-if='d.playerProduct == "1"' style="color: {{d.primaryColor}}" class="cPDetL cPCol3">{{d.x}}%</div>
                        <div ngm-if='d.playerProduct == "0"' class="cPDetL cPCol3">{{d.x}}%</div>
                        <div ngm-if='d.playerProduct == "1"' style="color: {{d.primaryColor}}" class="cPDetL cPCol4 ">{{d.x_delta}}</div>
                        </br>
                    </div>
                </div>
            </div>
        </div>
        <div class="cPBox" style="border-left: solid thin; border-color: #747d82;width:210px;">
            <%--CASH FLOW - INVESTED = BALANCE--%>
            <div class="t_" style="border-left: none">
                <div class="cPSubH">
                    <div>
                        <div class="cPDetL cPDetR1">                          
                                Cash Flow                           
                        </div>
                        <div class="cPDetL cPDetR1">                            
                                - Invested                           
                        </div>
                        <div class="cPDetL cPDetR1">                           
                                = Balance                           
                        </div>
                    </div>
                </div>
                <div ng-repeat="d in data">
                    <div ngm-if='d.marketName == p.marketName'>
                        <div ngm-if='d.playerProduct == "1"' class="cPDetL cPDetR1">{{p.salesLastTurn}}</div>
                        <div ngm-if='d.playerProduct == "0"' class="cPDetL cPDetR1">-</div>
                        <div ngm-if='d.playerProduct == "1"' class="cPDetL cPDetR1">{{p.investedLastTurn}}</div>
                        <div ngm-if='d.playerProduct == "0"' class="cPDetL cPDetR1">-</div>                        
                        <div ngm-if='d.playerProduct == "1"' class="cPDetL cPDetR1">{{p.cashFlowThisTurn}}</div>
                        <div ngm-if='d.playerProduct == "0"' class="cPDetL cPDetR1">-</div>
                    </div>
                </div>
            </div>
        </div>

        <div class="cPBox" style="width:95px">
               <div class="t_" style="border: none">
                <div ng-repeat="d in data" ng-show="d.playerProduct">
                    <div ngm-if='d.marketName == p.marketName'>
                        <div ngm-if='d.marketName == p.marketName'>
                            <div ngm-if='d.marketName == p.marketName'>
                                <div style="display: inline-block; overflow: hidden;">
                                   <%-- <div class="grid_4">--%>
                                        <div>
                                            <dir-advisor>
                                            </dir-advisor>                                                                                                                                             
                                        </div>
                                    <%--</div>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>    
        </div>
    </div>
</div>



         