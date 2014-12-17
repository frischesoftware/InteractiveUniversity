<%@ Control Language="C#" AutoEventWireup="true" CodeFile="W_RIGHT_Current_Products_wide.ascx.cs" Inherits="W5_BlueButtons" %>

<div class="three_product_boxes" style="background-color: #f0f1f2;">
    <div class="greybar">CURRENT PORTFOLIO</div>
    <div class="t" style="border: none">
        <div class="s">
            <div class="cPH cPH1">MARKET</div>
            <div class="cPH cPH2">NR.</div>
            <div class="cPH cPH3">MARKET SHARE</div>
            <div class="cPH cPH4">+/-</div>
        </div>
    </div>
</div>


<div ng-repeat="p in data_playerproduct">
    <%-- <div class="three_product_boxes">--%>
    <div class="grid_13 alpha" style="border: solid thin; border-top:none; border-color: #747d82; width: 1018px">
        <div class="cPBox">
            <div class="t_">
                <div class="cPSubH cPSubH0">
                    <div style="width: 100%; height: 100%; overflow: hidden;">
                        {{p.marketName | uppercase}}
                    </div>
                </div>
                <div ng-repeat="d in data">
                    <div ngm-if='d.marketName == p.marketName'>
                        <%--PRODUKTNAME--%>
                        <div ngm-if='d.playerProduct == "1"' id="{{d.circleText}}" class="cPDetL cPDetL1" style="color: {{d.primaryColor}}">{{d.name}}</div>
                        <div ngm-if='d.playerProduct == "0"' class="cPDetL cPDetL1" >{{d.name}}</div>

                        <%--KREIS--%>
                        <div dir-circle-active the-color="d.ci" class="cPDetL cPDetL2"></div>
                        <%-- <td>{{d.ci}}</td>--%>
                        <div ngm-if='d.playerProduct == "1"' style="color: {{d.primaryColor}}" class="cPDetL cPDetL3">{{d.x}}%</div>
                        <div ngm-if='d.playerProduct == "0"' class="cPDetL cPDetL3">{{d.x}}%</div>
                        <div ngm-if='d.playerProduct == "1"' style="color: {{d.primaryColor}}" class="cPDetL cPDetL4 ">{{d.x_delta}}</div>
                        </br>
                    </div>
                </div>
            </div>
        </div>
        <div class="cPBox">
            <%--CASH FLOW - INVESTED = BALANCE--%>
            <div class="t_" style="border-left: none">
                <div>
                    <div>
                        <div class="cPSubH cPSubH1">
                          
                                Cash Flow
                           
                        </div>
                        <div class="cPSubH cPSubH1">
                            
                                - Invested
                           
                        </div>
                        <div class="cPSubH cPSubH1">
                           
                                = Balance
                           
                        </div>
                    </div>
                </div>
                <div ng-repeat="d in data">
                    <div ngm-if='d.marketName == p.marketName'>
                        <div ngm-if='d.playerProduct == "1"' class="cPDetL cPDetR1">{{p.investedLastTurn}}</div>
                        <div ngm-if='d.playerProduct == "0"' class="cPDetL cPDetR1">-</div>
                        <div ngm-if='d.playerProduct == "1"' class="cPDetL cPDetR1">{{p.cashFlowThisTurn}}</div>
                        <div ngm-if='d.playerProduct == "0"' class="cPDetL cPDetR1">-</div>
                        <div ngm-if='d.playerProduct == "1"' class="cPDetL cPDetR1">{{p.salesLastTurn}}</div>
                        <div ngm-if='d.playerProduct == "0"' class="cPDetL cPDetR1">-</div>
                    </div>
                </div>
            </div>
        </div>

        <%--ADVISORS--%>
        <div style="float: left">
            <div class="t" style="border: none">
                <div ng-repeat="d in data" ng-show="d.playerProduct">
                    <div ngm-if='d.marketName == p.marketName'>
                        <div ngm-if='d.marketName == p.marketName'>

                            <div ngm-if='d.marketName == p.marketName'>
                                <%--<div ng-show="d.playerProduct" style="display: inline-block; overflow: hidden;">--%>
                                <div style="display: inline-block; overflow: hidden;">
                                    <%--ngm-if='d.playerProduct == "1"'--%>
                                    <div class="grid_4">
                                        <div>
                                            <dir-advisor />
                                            </dir-advisor>                                                                                                                                             
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%--GESICHTER UND FEEDBACK--%>

        <%--         <div class="grid_3 omega" style="float: left; width: 200px; font-size: 12px">                
                <div ng-repeat="d in data">
                    <div ngm-if='d.marketName == p.marketName'>                        
                        <div ngm-if='d.playerProduct == "1"' style="overflow: hidden;">
                            <img width="80" style="float: left" src="img/alt_joyride%20icons/ceos.jpg" />
                            {{d.advisor_feedback}}
                        </div>
                    </div>                    
                </div>

            </div>
        --%>

        <%--</div>--%>
    </div>


    <%--<img style=" width:80px;  display: inline-block;  float:left;"src="img/alt_joyride%20icons/ceos.jpg" />--%>
