<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Advisor_General.ascx.cs" Inherits="WebControls_Advisor_General" %>





<div class="three_product_boxes" style="background-color: #f0f1f2">
    <div class="greybar">ADVISORS</div>

</div>

<div class="grid_3">
    <table class="t"> <%--style="width: 160px"--%>
        <tr>
            <td class="td1">The CEO</td>
        </tr>
    </table>
    <div style="float: left">
        <img width="80" style="float: left" src="{{advisor_data[0].advisor_imagesource}}" />
        {{advisor_data[0].advisor_feedback}}
    </div>
</div>
    
<div class="grid_3">
     <table class="t"> <%--style="width: 160px"--%>
        <tr>
            <td class="td1">The Controller</td>
        </tr>
    </table>
    <div>
        <img width="80" style="float: left" src="{{advisor_data[1].advisor_imagesource}}" />
        {{advisor_data[1].advisor_feedback}}
    </div>

</div>
    




<div class="three_product_boxes">
    <%--http://stackoverflow.com/questions/2159843/how-to-make-div-height-increase-to-include-floated-image--%>
    <%-- <div ng-repeat="a in advisor_data">
        <div style="overflow: hidden;">
            <img width="80" style="float: left" src="{{a.advisor_imagesource}}" />
            {{a.advisor_feedback}}
        </div>
    </div>--%>

</div>

<div class="three_product_boxes">


</div>
