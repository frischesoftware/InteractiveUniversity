<%@ Control Language="C#" AutoEventWireup="true" CodeFile="W_RIGHT_Current_Products.ascx.cs" Inherits="W5_BlueButtons" %>

<div class="three_product_boxes" style="background-color: #f0f1f2">
    <div class="greybar" style="text-align: center">CURRENT PORTFOLIO</div>
    <table class="t">
        <tr>
            <td class="td1">MARKET</td>
            <td class="td2">NR.</td>
            <td class="td3">MS%</td>
        </tr>
    </table>
</div>
<div ng-repeat="p in data_playerproduct">
    <div class="three_product_boxes">
        <div class="grid_6">
            <div class="grid_3" style="float: left; width: 200px">
                <table class="t">
                    <thead>
                        <tr>
                            <td class="SubheadlineMarket">{{p.marketName | uppercase}}</td>
                        </tr>
                    </thead>
                    <tbody ng-repeat="d in data">
                        <tr ngm-if='d.marketName == p.marketName'>
                            <td ngm-if='d.playerProduct == "1"' id="{{d.circleText}}" class="td1" style="color: {{d.primaryColor}}">{{d.name}}</td>
                            <td ngm-if='d.playerProduct == "0"' class="td1">{{d.name}}</td>

                            <td dir-circle-active the-color="d.ci" class="td2"></td>
                            <%-- <td>{{d.ci}}</td>--%>
                            <td ngm-if='d.playerProduct == "1"' style="color: {{d.primaryColor}}" class="td3">{{d.x}}%</td>
                            <td ngm-if='d.playerProduct == "0"' style="text-align: right" class="td3">{{d.x}}%</td>
                            <%--        <td>
                        <img width="80" src="img/alt_joyride%20icons/ceos.jpg" />
                        this is hardcoded feedback
                    </td>--%>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="grid_3" style="float: left; width: 200px">
                <%--                <table>
                    <thead>
                        <tr>
                            <td>Advisors</td>
                        </tr>
                    </thead>
                    <tbody  ng-repeat="d in data">
                        <div style="overflow: hidden; float:left">
                            <img width="80" src="img/alt_joyride%20icons/ceos.jpg" />
                            this is hardcoded feedback
                        </div>
                    </tbody>
                </table>--%>
                <div ng-repeat="d in data">
                    <div ngm-if='d.marketName == p.marketName'>                        
                        <div ngm-if='d.playerProduct == "1"' style="overflow: hidden;">
                            <img width="80" style="float: left" src="img/alt_joyride%20icons/ceos.jpg" />
                            {{d.advisor_feedback}}
                        </div>
                    </div>                    
                </div>

            </div>
        </div>

    </div>
</div>
