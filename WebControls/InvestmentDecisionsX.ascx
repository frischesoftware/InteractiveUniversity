<%@ Control Language="C#" AutoEventWireup="true" CodeFile="InvestmentDecisionsX.ascx.cs" Inherits="ControlPanel_small" %>

<style>
    .intern {
        background-color: #ffffff;
        font-size: 11px;
        border-left: solid thin;
        border-bottom: solid thin;
        border-right: solid thin;
        border-color: #747d82;
    }


    .row-offset-0 {
        margin-left: 0;
        margin-right: 0;
    }

        .row-offset-0 > * {
            padding-left: 0;
            padding-right: 0;
        }
</style>





<div class="runderRand">

    
        <p style="text-align: center; font-size: larger; margin-top: 10px;">
            INVESTMENT DECISIONS
        </p>


    <div class="row-offset-0">
        <div class="col-lg-7 cPBox_ControlPanel" style="background-color: #ffffff; border: none; font-size: large;float:left;">
          <div style="width: 110px; float:left">
              Produkte
          </div>
            <div style="width: 24px; float:left">$</div>
            <div style="width: 24px; float:left">0</div>
            <div style="width: 24px; float:left">X</div>
                
           
            
        </div>
        <div class="col-lg-5" style="background-color: #ffffff; border: none; font-size: small;float:left;"> <%--f0f1f2--%>
            <div >
               turns until market
            </div>
            <div > <%--style="float:left"--%>
                slowdown ... death
                </div>
        </div>

    </div>


    <div class="row-offset-0">
        <div class="col-lg-7 cPBox_ControlPanel" style="background-color: #ffffff;">
            <div ng-repeat="p in data_playerproduct">
                <div style="height: 30px; width: 110px; float: left; text-align: left; padding-top: 7px; color: {{p.primaryColor}}">
                    {{p.name}}
                </div>
                <div style="float: left">
                    <div id="sites" style="height: 30px">
                        <input class="zzz_cPControlpanelLeft" type="radio" name="site" id="Radio1" value="+10" /><label ng-click="changeInvestmentThisTurn($index, 10)" class="investfield" style="height: 22px; width: 24px; margin-top: 5px;">+10</label>
                        <input class="zzz_cPControlpanelLeft" type="radio" name="site" id="Radio2" value="0" /><label ng-click="changeInvestmentThisTurn($index, 0)" class="investfield" style="height: 22px; width: 24px; margin-top: 5px">0</label>
                        <input class="zzz_cPControlpanelLeft" type="radio" name="site" id="Radio3" value="kill" /><label ng-click="changeInvestmentThisTurn($index, 'kill')" class="investfield" style="height: 22px; width: 24px; margin-top: 5px">X</label>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-5" style="background-color: #ffffff;">
            <div ng-repeat="p in data_playerproduct">
                <div style="height: 30px">
                    <div ngm-if='p.y >=1' class="cPH cPControlpanelRight" style="width: 45px; float: left; padding-top: 7px;">{{p.marketLifeTimeUp}}</div>
                    <div ngm-if='p.y <1' class="cPH cPControlpanelRight" style="width: 45px; float: left; padding-top: 7px;">-</div>
                    <div class="cPH cPControlpanelRight" style="width: 45px; float: left; padding-top: 7px;">{{p.marketLifeTimeDown + p.marketLifeTimeUp}}</div>
                </div>
            </div>
        </div>
    </div>

</div>


