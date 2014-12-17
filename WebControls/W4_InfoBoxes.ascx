<%@ Control Language="C#" AutoEventWireup="true" CodeFile="W4_InfoBoxes.ascx.cs" Inherits="W4_InfoBoxes" %>
<%--<asp:Label ID="lbl1" runat="server" Text="Turn" CssClass="bluebar" Height="19.5px"></asp:Label>
<asp:Label ID="Label2" runat="server" Text="Turn" CssClass="bluebar" Height="19.5px"></asp:Label>
<asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
<label style="font-size: large; font-weight: 700">{{gamedata[0].turn}}  </label>
<br>
<asp:Label ID="Label4" runat="server" Text="CASH" CssClass="bluebar" Height="19.5px"></asp:Label>
<label style="font-size: large; font-weight: 700">{{gamedata[0].cash}}  </label>
<asp:Label ID="lblTurn" runat="server" Text="Label"></asp:Label>
<label style="font-size: large; font-weight: 700">{{gamedata[0].turn}}  </label>
<br>
<asp:Label ID="Label1" runat="server" Text="CASH" CssClass="bluebar" Height="19.5px"></asp:Label>
<label style="font-size: large; font-weight: 700">{{gamedata[0].cash}}  </label>--%>

<div id="leftSideBar" class="grid_3 alpha three_product_boxes" style="background-color: #ffffff;">
    <div class="greybar">GAME DATA</div>
    <div class="availablegamesCells">
        <div class="three_product_boxes">Info</div>

        <div class="three_product_boxes" style="background-color: #ffffff;">
         <%--   Game Ends after either:
            <div>{{gameSetupData[0].maxTurns}} Turns total</div>
            <div>max. {{gameSetupData[0].maxBadRounds}} bad Turns</div>
            <div>max. negative </br> Cashflow of {{gameSetupData[0].maxNegativeCF}}</div>
            </hr>--%>
            <div style="font-size:20px">Total Cash Flow {{gamedata[0].allMarketsCashFlowAllTime}} </div>
        </div>
    </div>
</div>
