<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Game_State.ascx.cs" Inherits="WebControls_Game_State" %>
<div class="grid_6 alpha three_product_boxes" style="background-color: #f0f1f2;">
    <div class="greybar">GAME STATE</div>
    <div class="grid_3 alpha">
        <div class="t">
            <div class="cPH">how things should be after {{gameSetupData[0].maxTurns}} rounds</div>
        </div>
    </div>
    <div class="grid_3 omega">
        <div class="t">
            <div class="cPH">how things are now</div>
        </div>
    </div>
</div>
<div class="grid_6 alpha three_product_boxes intern">

        <div class="cPBox" style="width: 150px">
            <div class="t_" style="border: none">
                <div style="display: inline-block; overflow: hidden;">
                    <div>
                        <img width="70" style="float: left" src="{{advisor_data[0].advisor_imagesource}}" />
                        {{advisor_data[0].advisor_feedback}}
                    </div>
                </div>
            </div>
        </div>

        <div class="cPBox_ControlPanel" style="border-bottom: solid thin; border-color: #747d82; width: 154px;">
            <div style="float: left">
                <div>Cash Cows: {{gameSetupData[0].endStateCC}}</div>
                <div>Dogs: {{gameSetupData[0].endStateDog}}</div>
                <div>Question Marks: {{gameSetupData[0].endStateQM}}</div>
                <div>Stars: {{gameSetupData[0].endStateStar}}</div>
            </div>
        </div>
        <div class="cPBox_ControlPanel" style="border-bottom: solid thin; border-left: solid thin; border-color: #747d82; width: 154px;">
            <div style="float: left">
                <div>Cash Cows: {{CC_count}}</div>
                <div>Dogs: {{Dog_count}}</div>
                <div>Question Marks: {{QM_count}}</div>
                <div>Stars: {{Star_count}}</div>
            </div>
        </div>

</div>
