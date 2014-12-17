<%@ Control Language="C#" AutoEventWireup="true" CodeFile="W_RIGHT_New_Products.ascx.cs" Inherits="W12_Products_Markets_Boxes" %>


<div class="three_product_boxes grid_6 alpha">
    <div class="greybar">NEW INVESTMENTS</div>
    <div class="grid_4 alpha">
        <div class="t">
            <div>
                <div class="cPH cPCol1">MARKET</div>
                <div class="cPH cPCol2">CHOOSE</div>
                <div class="cPH cPCol3">Click <br /> to add</div>
                <div class="cPH cPCol3">To be <br /> added in <br /> turn</div>
            </div>
        </div>
    </div>    
</div>
<div class="three_product_boxes grid_6 alpha" style="background-color: #ffffff; font-size: 11px; border-left: solid thin; border-bottom: solid thin; border-right: solid thin; border-color: #747d82;">
    <div class="grid_4 alpha">
        <div ng-repeat="u in data_unborn_server">
            <div ngm-if='u.playerProduct == "1"'>
                <div class="cPDetL cPCol1" style="color: {{u.primaryColor}}">{{u.marketName}}</div>
                <div class="cPDetL cPCol2" ngm-if='"1" == "1"' dir-circle-unborn id="b{{u.ci}}" the-color="u.ci"></div>
                
                <div ngm-if="gamedata[0].turn >= u.toBeAddedInTurn" class="cPDetL cPCol3"><label class="investfield" for="chkAdd" style="display:inline-block; line-height:15px; vertical-align:middle; font-size: 11px; width: 30px" ng-click="addProduct($index, u.ci)" id="c{{u.ci}}" >+add</label></div>
                <div ngm-if="gamedata[0].turn <  u.toBeAddedInTurn" class="cPDetL cPCol3"><label class="investfield disabled" for="chkAdd" style="font-size: 11px; line-height:15px; width: 30px">+add</label></div>
                      
                <div class="cPDetL cPCol3" style="color: {{u.primaryColor}}">{{u.toBeAddedInTurn}}</div>
            </div>
        </div>
    </div>
</div>






<%--<div class="three_product_boxes" style="background-color: #f0f1f2">
    <div class="greybar" style="text-align: center">NEW INVESTMENTS</div>
    <table class="t">
        <tr>
            <td>MARKET</td>
            <td>CHOOSE</td>
            <td>Click to add</td>
            <td>To be added in turn</td>
        </tr>
    </table>
</div>
<div class="three_product_boxes">
    <table class="t">
        <tbody>
            <tr ng-repeat="u in data_unborn_server">
                <td ngm-if='u.playerProduct == "1"' style="color: {{u.primaryColor}}">{{u.marketName}}</td>                
                <td ngm-if='u.playerProduct == "1"' dir-circle-unborn id="b{{u.ci}}" the-color="u.ci"></td>
                <td ngm-if='u.playerProduct == "1"'>
                    <p id="checks">
                        
                        <label ng-click="addProduct($index, u.ci)" id="c{{u.ci}}" class="investfield" for="chkAdd" style="font-size: 12px; width: 30px">+add</label>
                    </p>
                </td>   
                <td ngm-if='u.playerProduct == "1"' style="color: {{u.primaryColor}}"> {{u.toBeAddedInTurn}}</td>     
            </tr>
        </tbody>
    </table>
</div>--%>


<%--<input type="checkbox" id="chkAdd" ng-model="data_unborn_server[$index].investmentDecisionMade" />--%>

<%--  <td ngm-if='u.playerProduct == "1"'>{{u.name}}</td>--%>
           <%--<td ngm-if='u.playerProduct == "1"'>{{u.investmentDecisionMade}}</td>--%>