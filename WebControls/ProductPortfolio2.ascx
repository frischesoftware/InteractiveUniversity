<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ProductPortfolio2.ascx.cs" Inherits="W5_BlueButtons" %>

<style>
    .cell {
        width: 65px;
        float: left;
        text-align: right;
    }
</style>

<div class="col-lg-12 runderRand">
    <div>PRODUCT PORTFOLIO</div>
    <div class="col-lg-6" style="padding:0px;">
  
            <div>
                <div class="topheadline_left market">MARKET</div>
                <div class="topheadline_left nr">NR.</div>
                <div class="topheadline_left ms">MARKET </br>SHARE</div>
                <div class="topheadline_left plusminus">+/-</div>
            </div>
        
    </div>
  <div class="col-lg-6" style="padding:0px;">

            <div class="topheadline_right" style="width:100%; text-align:center;">
                Total Cash Flow
            </div>
            <div>
                <div class="topheadline_right cPDetR1">{{gamedata[0].allMarketsSalesLastTurn}}</div>
                <div class="topheadline_right cPDetR1">{{gamedata[0].allMarketsInvestLastTurn}}</div>
                <div class="topheadline_right cPDetR1">{{gamedata[0].allMarketsCashFlowLastTurn}}</div>
            </div>
        </div>
    </div>
   <%-- <div class="grid_1 omega cPBox">
        Project </br> Managers
    </div>--%>

</div>







         