<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TipsFromTheCEO.ascx.cs" Inherits="WebControls_TipsFromTheCEO" %>

<div style="border: solid 1px; margin-top: 10px; -webkit-border-radius: 15px; -moz-border-radius: 15px; border-radius: 15px; padding:10px">
    <p style="color: blue">Tips from the CEO</p>
    <div style="display: inline-block; overflow: hidden;">
        <img width="70" style="float: right" src="{{advisor_data[0].advisor_imagesource}}" />
        {{advisor_data[0].advisor_feedback}}
    </div>
</div>
