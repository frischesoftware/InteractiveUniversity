<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ControlPanel_small.ascx.cs" Inherits="ControlPanel_small" %>

<style>
    .intern {
        background-color: #ffffff;
        font-size: 11px;
        border-left: solid thin;
        border-bottom: solid thin;
        border-right: solid thin;
        border-color: #747d82;
    }
</style>

<div >
    <div class="grid_6 alpha three_product_boxes" style="background-color: #f0f1f2;">
        <div class="greybar">CONTROL PANEL</div>
        <div class="grid_3 alpha">
            <div class="t">
                <div>
                    <div class="cPH cPH3">
                        <input style="vertical-align: central; margin-top: 10px; margin-left: 10px" class="bluebutton" type="button" id="Button1" value="{{gamedata[0].turn}}" />
                    </div>
                    <%-- <div class="cPH cPH3" style="width: 100px; margin-top: 5px;">NEWINVESTMENT</div>--%>
                </div>
            </div>
        </div>
        <div class="grid_3 omega">
            <div class="t">
                <div>
                    <div class="cPH cPCol1">Turns until market slowdown</div>
                    <div class="cPH cPCol1">Turns until market death</div>                                       
                </div>
            </div>
        </div>
     
    </div>
    <div class="grid_6 alpha three_product_boxes intern">
        <div class="cPBox_ControlPanel" style="border-bottom: solid thin; border-color: #747d82;">
            <div ng-repeat="p in data_playerproduct">
                    <%--<div class="cPDetL cPDetR1" style="width: 100px" color: {{p.primaryColor}}">{{p.name}}</div>--%>
                    <div class="cPH cPDetR1 cPControlpanelLeft" style="width: 100px; text-align: left; padding-left: 10px; color: {{p.primaryColor}}">{{p.name}}</div>
                    <div style="float: left">
                        <%--<p class="cPDetL_ cPDetR1_" style="width: 150px; float: left" id="sites">--%>
                        <div id="sites">
                            <input class="cPControlpanelLeft" type="radio" name="site" id="Radio1" value="+10" /><label ng-click="changeInvestmentThisTurn($index, 10)" class="investfield" for="ten">+10</label>
                            <input class="cPControlpanelLeft" type="radio" name="site" id="Radio2" value="0" /><label ng-click="changeInvestmentThisTurn($index, 0)" class="investfield" for="zero">0</label>
                            <input class="cPControlpanelLeft" type="radio" name="site" id="Radio3" value="kill" /><label ng-click="changeInvestmentThisTurn($index, 'kill')" class="investfield" for="kill">X</label>
                        </div>
                        <%--</p>--%>
                    </div>
                    <%--<div class="cPH cPDetR1" style="text-align: left; padding-left: 10px; color: {{p.primaryColor}}">{{p.name}}</div>--%>
                    <%--<select style="height: 15px" ng-model="data_playerproduct[$index].investedThisTurn" ng-options="i for i in ['+10','0','kill']"></select></td>     --%>
                    <%--<tt>investedThisTurn = {{data_playerproduct[$index].investedThisTurn}}</tt>--%>
            </div>

        </div>
        <div class="cPBox_ControlPanel" style="border-bottom: solid thin; border-left: solid thin; border-color: #747d82;">
             <div ng-repeat="p in data_playerproduct">                 
                 <div>                     
                     <div ngm-if='p.y >=1' class="cPH cPControlpanelRight " style="width: 100px; float:left">{{p.marketLifeTimeUp}}</div> <%--turnfield--%>
                     <div ngm-if='p.y <1' class="cPH cPControlpanelRight" style="width: 100px; float:left">-</div>
                     <div class="cPH cPControlpanelRight" style="width: 100px;float:left">{{p.marketLifeTimeDown + p.marketLifeTimeUp}}</div>
                 </div>
             </div>
        </div>
        <div class="grid_4 alpha">
            <input class="" type="button" id="btnNextAngular" ng-click="nextTurnAngular()" value="NEXT" disabled="disabled" />
        </div>
    </div>



</div>



<%--ng-model="data_playerproduct[$index].investedThisTurn" --%>