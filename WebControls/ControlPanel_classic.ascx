<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ControlPanel_classic.ascx.cs" Inherits="WebControls_ControlPanel_classicl" %>
<div id="ecke_oben_rechts">
                        <div class="three_product_boxes" style="background-color: #f0f1f2">
                            <div class="greybar">
                                CONTROL PANEL                        
                            </div>
                        </div>


                        <table id="table_eingabebereich_oben">
                            <thead>
                                <tr style="vertical-align: bottom">
                                    <td>
                                        <input style="vertical-align: central; margin-left: 10px" class="bluebutton" type="button" id="Button1" value="{{gamedata[0].turn}}" /></td>
                                    <td>Cash Flow from Operations</br>LAST TURN</td>
                                    <td>Cash Flow from Investment</br>LAST TURN</td>
                                    <td>TOTAL CASH FLOW</br>LAST TURN</td>
                                    <td>TOTAL</br>CASH FLOW</td>
                                    <td style="border-left: solid thin; border-right: solid thin">LAPS TO GO</td>
                                    <td style="width: 80px">NEW</br>INVESTMENT</td>
                                </tr>
                                <tr>
                                    <td colspan="7">
                                        <hr class="hr1">
                                    </td>
                                </tr>
                            </thead>
                            <tbody ng-repeat="p in data_playerproduct">
                                <tr>
                                    <td style="text-align: left; padding-left: 10px; color: {{p.primaryColor}}">{{p.name}}</td>
                                    <td>{{p.salesLastTurn}}</td>
                                    <%--sales = cashflow + invest--%>
                                    <td>{{p.investedLastTurn}}</td>
                                    <td>{{p.cashFlowThisTurn}}</td>
                                    <td>{{p.cashFlowAllTime}}</td>
                                    <td style="border-left: solid thin; border-right: solid thin">
                                        <span>
                                            <span ngm-if='p.y >=1' class="turnfield">{{p.marketLifeTimeUp}}</span>
                                            <span ngm-if='p.y <1' class="turnfield">-</span>
                                            <span class="turnfield">{{p.marketLifeTimeDown}}
                                            </span>
                                        </span>
                                    </td>
                                    <td id="extrabreit">
                                        <p id="sites">
                                            <input type="radio" name="site" id="ten" value="+10" /><label ng-click="changeInvestmentThisTurn($index, 10)" class="investfield" for="ten">+10</label>
                                            <%--ng-model="data_playerproduct[$index].investedThisTurn" --%>
                                            <input type="radio" name="site" id="zero" value="0" /><label ng-click="changeInvestmentThisTurn($index, 0)" class="investfield" for="zero">0</label>
                                            <%--ng-model="data_playerproduct[$index].investedThisTurn" --%>
                                            <input type="radio" name="site" id="kill" value="kill" /><label ng-click="changeInvestmentThisTurn($index, 'kill')" class="investfield" for="kill">X</label>
                                            <%--ng-model="data_playerproduct[$index].investedThisTurn" --%>
                                        </p>

                                        <%--<select style="height: 15px" ng-model="data_playerproduct[$index].investedThisTurn" ng-options="i for i in ['+10','0','kill']"></select></td>     --%>
                                        <%--<tt>investedThisTurn = {{data_playerproduct[$index].investedThisTurn}}</tt>--%>
                                    </td>
                                </tr>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="7">
                                        <hr class="hr1">
                                    </td>
                                </tr>
                                <tr ng-repeat="g in gamedata">
                                    <td style="text-align: left; padding-left: 10px">Total</td>
                                    <td>{{gamedata[0].allMarketsSalesLastTurn}}</td>
                                    <td>{{gamedata[0].allMarketsInvestLastTurn}}</td>
                                    <td>{{gamedata[0].allMarketsCashFlowLastTurn}}</td>
                                    <td>{{gamedata[0].allMarketsCashFlowAllTime}}</td>
                                    <td style="border-left: solid thin; border-right: solid thin"></td>
                                    <td>
                                        <input class="redbutton" type="button" id="btnNextAngular" ng-click="nextTurnAngular()" value="NEXT" />
                                    </td>
                                </tr>
                            </tfoot>

                        </table>
                        <div id="TextTabelleObenRechts">
                            This panel shows our products and their financial data. 
                        "Sales Last Turn" depends on the quadrant (Star, Question Mark, Dog, Cash Cow). Substract
                        "Investment Last Turn" and you get the "Cash Flow Last Turn". "Cash Flow Last Turn" over time is added
                        up to the "Total Cash Flow" for this product.
                        </div>
                    </div>