<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CashFlow_SCORE.ascx.cs" Inherits="CashFlow_SCORE" %>
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


<%--<div class='container' style='width:140px;height:70px;line-height:70px'>
    <a href='#'>
    <img class='resize_fit_center'
      src='http://i.imgur.com/H9lpVkZ.jpg' />
    </a>
</div>--%>






<div style="border: solid 1px; margin-top: 10px; -webkit-border-radius: 15px; -moz-border-radius: 15px; border-radius: 15px; padding:10px;  text-align: center; position:relative;">

     <div style="border: solid 1px; height: 100%; vertical-align: middle;">
         <img src="../img/BostonBox/scoreboard.png" style="height: 70px; max-width: 100%; padding: 0px" />

         <p style="font-weight: bold; font-size: 30px; color: green; font-family: 'digital'; z-index: 50; position: absolute; top: 37px; left: 75px;">
             {{gamedata[0].allMarketsCashFlowAllTime}}
         </p>
     </div>
</div>



