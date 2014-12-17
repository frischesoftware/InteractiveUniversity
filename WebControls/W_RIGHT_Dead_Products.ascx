<%@ Control Language="C#" AutoEventWireup="true" CodeFile="W_RIGHT_Dead_Products.ascx.cs" Inherits="W_RIGHT_Dead_Products" %>


<div class="three_product_boxes grid_6 alpha">
    <div class="greybar">DISCONTINUTED INVESTMENTS</div>
    <div class="grid_4 alpha">
        <div class="t">
            <div>
                <div class="cPH cPCol1">MARKET</div>
                <div class="cPH cPCol2">CF</div>
            </div>
        </div>
    </div>
</div>
<div class="three_product_boxes grid_6 alpha" style="background-color: #ffffff; font-size: 11px; border-left: solid thin; border-bottom: solid thin; border-right: solid thin; border-color: #747d82;">
    <div class="grid_4 alpha">
        <div ng-repeat="u in data_dead">
            <div ngm-if='u.playerProduct == "1"'>
                 <div class="cPDetL cPCol1" style="color: {{u.primaryColor}}">{{u.marketName}}</div>
                <div class="cPDetL cPCol2" dir-circle-unborn id="b{{u.ci}}" the-color="u.ci"></div>
                <div>{{u.cashFlowAllTime}}</div>
            </div>
        </div>
    </div>
</div>


<%--<div class="three_product_boxes" style="background-color: #f0f1f2">
    <div class="greybar">FORMER PRODUCTS</div>
    <table class="t" style="width: 160px">
        <tr>
            <td class="td1">MARKET</td>
            <td class="td3">CF</td>  
        </tr>
    </table>
</div>
<div class="three_product_boxes">
    <table class="t">
        <tbody>
            <tr ng-repeat="u in data_dead">
                <td ngm-if='u.playerProduct == "1"' style="color: {{u.primaryColor}}">{{u.marketName}}</td>
                <td ngm-if='u.playerProduct == "1"' dir-circle-unborn id="b{{u.ci}}" the-color="u.ci"></td>
                <td ngm-if='u.playerProduct == "1"'>{{u.cashFlowAllTime}}
                </td>
               
            </tr>
        </tbody>
    </table>

</div>--%>

<%--Σ --%>
 <%--<td ngm-if='u.playerProduct == "1"'>{{u.investmentDecisionMade}}</td>--%>