<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FiveForces.aspx.cs" Inherits="FiveForces" %>

<!DOCTYPE html>

<html ng-app="myApp">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>Five Forces - Interactive University</title>
    <script src="../packages/jQuery.1.9.1/Content/Scripts/jquery-1.9.1.min.js"></script>      
    <script src="../packages/bootstrap.3.0.2/content/Scripts/bootstrap.min.js"></script>
    <script src="../packages/angularjs.1.2.2/content/Scripts/angular.min.js"></script>
    <script src="../Scripts/Lib/ngm-if.js"></script>
    <script src="../Scripts/Lib/svg.js"></script>

    <script src="../Scripts/Lib/SVG/drawShapes.js"></script>



     <script src="../Scripts/FiveForces/makeForceSelections.js"></script>
    <script src="../Scripts/FiveForces/makeForceData.js"></script>

    <script src="../packages/jQuery.UI.Combined.1.10.3/Content/Scripts/jquery-ui-1.10.3.js"></script><%--tabs--%>
    <script src="../Scripts/Lib/FF/ui-bootstrap-custom-tpls-0.7.0.min.js"></script>
   
    <link href="../packages/jQuery.UI.Combined.1.10.3/Content/Content/themes/base/jquery-ui.css" rel="stylesheet" /><%--tabs--%>
    <link href="../packages/bootstrap.3.0.2/content/Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Styles/FiveForcesStyles.css" rel="stylesheet" />

   

    <script>
        $(function () {
            $("#tabs").tabs();
        });
    </script>
    <link rel="stylesheet" href="/resources/demos/style.css" />
</head>
<body ng-controller="DataCtrl">
    <form id="form1" runat="server">
        <div id="d2"></div>
        <div class="container" id="tabs">
            <ul>
                <li ng-repeat="five in fiveforces" style="font-size: 12px;"><a href="#tabs-{{$index}}">{{$index}} - {{five.title}}</a></li>
            </ul>
          <%--  <div id="tabs-0">
                //generiere factors automatisch? eigentlich nicht nötig
                <div ng-repeat="fac in factors">
                    <div ngm-if="fac.force_shortname == 'ENT'">
                        {{$index}}
                            {{fac.force_fullname}}               
                            {{fac.description}}  
                    </div>
                </div>

            </div>--%>
       <%--     <div ng-repeat="force in fiveforces">
                <div id={{force.forcetype}}>
                    {{force.forcetype}}
                </div>
            </div>--%>            
            <div id="tabs-0">
                <h2>{{fiveforces[0].forcetype}}</h2>
                - {{fiveforces[0].title}}                  
                           <div class="row">
                               <div class="col-6 col-sm-6 col-lg-4" style="border-style: solid; border-width: 1px">
                                   <h2>RIV1</h2>
                                   <div id="RIV1" style="height: 250px; width: 200px"></div>
                                   {{fiveforces[0].a}}                        
                                    <asp:HiddenField runat="server" ID="HiddenField10"></asp:HiddenField>
                                   <p id="RIV1_description"></p>
                                   <p class="sites">
                                       <input type="radio" class="input_hidden" name="site" id="Radio37" value="+10" /><label ng-click="selectionDone2('RIV1', 'minus')" class="investfield" for="ten">-</label>
                                       <input type="radio" class="input_hidden" name="site" id="Radio38" value="0" /><label ng-click="selectionDone2('RIV1', 'neutral')" class="investfield" for="zero">0</label>
                                       <input type="radio" class="input_hidden" name="site" id="Radio39" value="kill" /><label ng-click="selectionDone2('RIV1', 'plus')" class="investfield" for="kill">+</label>
                                   </p>
                               </div>

                               <div class="col-6 col-sm-6 col-lg-4" style="border-style: solid; border-width: 1px">
                                   <h2>RIV2</h2>
                                   <div id="RIV2" style="height: 250px; width: 200px"></div>
                                   {{fiveforces[0].b}}                                    
                                   <asp:HiddenField runat="server" ID="HiddenField11"></asp:HiddenField>
                                   <p id="RIV2_description"></p>
                                   <p class="sites">
                                       <input type="radio" class="input_hidden" name="site" id="Radio40" value="+10" /><label ng-click="selectionDone2('RIV2', 'minus')" class="investfield" for="ten">-</label>
                                       <input type="radio" class="input_hidden" name="site" id="Radio41" value="0" /><label ng-click="selectionDone2('RIV2', 'neutral')" class="investfield" for="zero">0</label>
                                       <input type="radio" class="input_hidden" name="site" id="Radio42" value="kill" /><label ng-click="selectionDone2('RIV2', 'plus')" class="investfield" for="kill">+</label>
                                   </p>
                               </div>
                               <div class="col-6 col-sm-6 col-lg-4" style="border-style: solid; border-width: 1px">
                                   <h2>RIV3</h2>
                                   <div id="RIV3"></div>
                                   {{fiveforces[0].c}}
                                    <asp:HiddenField runat="server" ID="HiddenField12"></asp:HiddenField>
                                   <p id="RIV3_description"></p>
                                   <p class="sites">
                                       <input type="radio" class="input_hidden" name="site" id="Radio43" value="+10" /><label ng-click="selectionDone2(RIV3', 'minus')" class="investfield" for="ten">-</label>
                                       <input type="radio" class="input_hidden" name="site" id="Radio44" value="0" /><label ng-click="selectionDone2('RIV3', 'neutral')" class="investfield" for="zero">0</label>
                                       <input type="radio" class="input_hidden" name="site" id="Radio45" value="kill" /><label ng-click="selectionDone2('RIV3', 'plus')" class="investfield" for="kill">+</label>
                                   </p>
                               </div>
                               <div class="col-6 col-sm-6 col-lg-4" style="border-style: solid; border-width: 1px">
                                   <h2>RIV4</h2>
                                   <div id="RIV4"></div>
                                   {{fiveforces[0].d}}
                                    <asp:HiddenField runat="server" ID="HiddenField13"></asp:HiddenField>
                                   <p id="RIV4_description"></p>
                                   <p class="sites">
                                       <input type="radio" class="input_hidden" name="site" id="Radio46" value="+10" /><label ng-click="selectionDone2('RIV4', 'minus')" class="investfield" for="ten">-</label>
                                       <input type="radio" class="input_hidden" name="site" id="Radio47" value="0" /><label ng-click="selectionDone2('RIV4', 'neutral')" class="investfield" for="zero">0</label>
                                       <input type="radio" class="input_hidden" name="site" id="Radio48" value="kill" /><label ng-click="selectionDone2('RIV4', 'plus')" class="investfield" for="kill">+</label>
                                   </p>
                               </div>
                               <div class="col-6 col-sm-6 col-lg-4" style="border-style: solid; border-width: 1px">
                                   <h2>RIV5</h2>
                                   <div id="RIV5"></div>
                                   {{fiveforces[0].e}}
                                    <asp:HiddenField runat="server" ID="HiddenField14"></asp:HiddenField>
                                   <p id="RIV5_description"></p>
                                   <p class="sites">
                                       <input type="radio" class="input_hidden" name="site" id="Radio49" value="+10" /><label ng-click="selectionDone2('RIV5', 'minus')" class="investfield" for="ten">-</label>
                                       <input type="radio" class="input_hidden" name="site" id="Radio50" value="0" /><label ng-click="selectionDone2('RIV5', 'neutral')" class="investfield" for="zero">0</label>
                                       <input type="radio" class="input_hidden" name="site" id="Radio51" value="kill" /><label ng-click="selectionDone2('RIV5', 'plus')" class="investfield" for="kill">+</label>
                                   </p>
                               </div>
                               <div class="col-6 col-sm-6 col-lg-4" style="border-style: solid; border-width: 1px">
                                   <h2>RIV6</h2>
                                   <div id="RIV6"></div>
                                   {{fiveforces[0].f}}
                                    <asp:HiddenField runat="server" ID="HiddenField15"></asp:HiddenField>
                                   <p id="RIV6_description"></p>
                                   <p class="sites">
                                       <input type="radio" class="input_hidden" name="site" id="Radio52" value="+10" /><label ng-click="selectionDone2('RIV6', 'minus')" class="investfield" for="ten">-</label>
                                       <input type="radio" class="input_hidden" name="site" id="Radio53" value="0" /><label ng-click="selectionDone2('RIV6', 'neutral')" class="investfield" for="zero">0</label>
                                       <input type="radio" class="input_hidden" name="site" id="Radio54" value="kill" /><label ng-click="selectionDone2('RIV6', 'plus')" class="investfield" for="kill">+</label>
                                   </p>
                               </div>
                           </div>




                <%--       <div ng-repeat="fac in factors">
                    <div ngm-if='fac.force_shortname == "RIV"'>
                        <div class="col-6 col-sm-6 col-lg-4" style="border-style: solid; border-width: 1px">
                            <h2>{{fac.factor_shortname}}</h2>
                            <div id="{{fac.factor_shortname}}" style="height: 250px; width: 200px"></div> 
                            <div id="{{fac.factor_hiddenTextId}}"><asp:HiddenField ID="HiddenField10" runat="server"></asp:HiddenField></div>                            
                         <p id="{{fac.factor_shortname}}_description">ggg</p>
                            <p class="sites">
                             <input type="radio" class="input_hidden" name="site" id="Radio37" value="+10" /><label ng-click="selectionDone2('RIV'+($index+1), 'minus')" class="investfield" for="ten">-</label>
                             <input type="radio" class="input_hidden" name="site" id="Radio38" value="0" /><label ng-click="selectionDone2('RIV'+($index+1), 'neutral')" class="investfield" for="zero">0</label>
                             <input type="radio" class="input_hidden" name="site" id="Radio39" value="kill" /><label ng-click="selectionDone2('RIV'+($index+1), 'plus')" class="investfield" for="kill">+</label>
                         </p>

                        </div>
                    </div>
                </div>--%>

            </div>
            <div id="tabs-1">
                {{fiveforces[1].forcetype}}
                {{fiveforces[1].title}}
                 <div class="row">    
                        
                     <div class="col-6 col-sm-6 col-lg-4" style="border-style: solid; border-width: 1px">
                         <h2>ENT1</h2>
                         <div id="ENT1" style="height: 250px; width: 200px"></div>
                         {{fiveforces[1].a}}                        
                        <asp:HiddenField runat="server" ID="HiddenField4"></asp:HiddenField>
                         <p id="ENT1_description"></p>
                         <p class="sites">
                             <input type="radio" class="input_hidden" name="site" id="Radio19" value="+10" /><label ng-click="selectionDone2('SUP1', 'minus')" class="investfield" for="ten">-</label>
                             <input type="radio" class="input_hidden" name="site" id="Radio20" value="0" /><label ng-click="selectionDone2('SUP1', 'neutral')" class="investfield" for="zero">0</label>
                             <input type="radio" class="input_hidden" name="site" id="Radio21" value="kill" /><label ng-click="selectionDone2('SUP1', 'plus')" class="investfield" for="kill">+</label>
                         </p>
                     </div>

                     <div class="col-6 col-sm-6 col-lg-4" style="border-style: solid; border-width: 1px">
                         <h2>ENT2</h2>
                         <div id="ENT2" style="height: 250px; width: 200px"></div>
                         {{fiveforces[1].b}}
                        <p id="lblENT2"></p>
                         <asp:HiddenField runat="server" ID="HiddenField5"></asp:HiddenField>
                         <p class="sites">
                             <input type="radio" class="input_hidden" name="site" id="Radio22" value="+10" /><label ng-click="selectionDone2('SUP2', 'minus')" class="investfield" for="ten">-</label>
                             <input type="radio" class="input_hidden" name="site" id="Radio23" value="0" /><label ng-click="selectionDone2('SUP2', 'neutral')" class="investfield" for="zero">0</label>
                             <input type="radio" class="input_hidden" name="site" id="Radio24" value="kill" /><label ng-click="selectionDone2('SUP2', 'plus')" class="investfield" for="kill">+</label>
                         </p>
                     </div>
                     <div class="col-6 col-sm-6 col-lg-4" style="border-style: solid; border-width: 1px">
                         <h2>ENT3</h2>
                         <div id="ENT3"></div>
                         {{fiveforces[1].c}}
                        <asp:HiddenField runat="server" ID="HiddenField6"></asp:HiddenField>
                         <p class="sites">
                             <input type="radio" class="input_hidden" name="site" id="Radio25" value="+10" /><label ng-click="selectionDone2('SUP3', 'minus')" class="investfield" for="ten">-</label>
                             <input type="radio" class="input_hidden" name="site" id="Radio26" value="0" /><label ng-click="selectionDone2('SUP3', 'neutral')" class="investfield" for="zero">0</label>
                             <input type="radio" class="input_hidden" name="site" id="Radio27" value="kill" /><label ng-click="selectionDone2('SUP3', 'plus')" class="investfield" for="kill">+</label>
                         </p>
                     </div>
                     <div class="col-6 col-sm-6 col-lg-4" style="border-style: solid; border-width: 1px">
                         <h2>ENT4</h2>
                         <div id="ENT4"></div>
                         {{fiveforces[1].d}}
                        <asp:HiddenField runat="server" ID="HiddenField7"></asp:HiddenField>
                         <p class="sites">
                             <input type="radio" class="input_hidden" name="site" id="Radio28" value="+10" /><label ng-click="selectionDone2('SUP4', 'minus')" class="investfield" for="ten">-</label>
                             <input type="radio" class="input_hidden" name="site" id="Radio29" value="0" /><label ng-click="selectionDone2('SUP4', 'neutral')" class="investfield" for="zero">0</label>
                             <input type="radio" class="input_hidden" name="site" id="Radio30" value="kill" /><label ng-click="selectionDone2('SUP4', 'plus')" class="investfield" for="kill">+</label>
                         </p>
                     </div>
                     <div class="col-6 col-sm-6 col-lg-4" style="border-style: solid; border-width: 1px">
                         <h2>ENT5</h2>
                         <div id="ENT5"></div>
                         {{fiveforces[1].e}}
                        <asp:HiddenField runat="server" ID="HiddenField8"></asp:HiddenField>
                         <p class="sites">
                             <input type="radio" class="input_hidden" name="site" id="Radio31" value="+10" /><label ng-click="selectionDone2('SUP5', 'minus')" class="investfield" for="ten">-</label>
                             <input type="radio" class="input_hidden" name="site" id="Radio32" value="0" /><label ng-click="selectionDone2('SUP5', 'neutral')" class="investfield" for="zero">0</label>
                             <input type="radio" class="input_hidden" name="site" id="Radio33" value="kill" /><label ng-click="selectionDone2('SUP5', 'plus')" class="investfield" for="kill">+</label>
                         </p>
                     </div>
                     <div class="col-6 col-sm-6 col-lg-4" style="border-style: solid; border-width: 1px">
                         <h2>ENT6</h2>
                         <div id="ENT6"></div>
                         {{fiveforces[1].f}}
                        <asp:HiddenField runat="server" ID="HiddenField9"></asp:HiddenField>
                         <p class="sites">
                             <input type="radio" class="input_hidden" name="site" id="Radio34" value="+10" /><label ng-click="selectionDone2('SUP6', 'minus')" class="investfield" for="ten">-</label>
                             <input type="radio" class="input_hidden" name="site" id="Radio35" value="0" /><label ng-click="selectionDone2('SUP6', 'neutral')" class="investfield" for="zero">0</label>
                             <input type="radio" class="input_hidden" name="site" id="Radio36" value="kill" /><label ng-click="selectionDone2('SUP6', 'plus')" class="investfield" for="kill">+</label>
                         </p>
                     </div>
                     <%--</div>--%>
                 </div>
            </div>
            <div id="tabs-2">
                {{fiveforces[2].forcetype}}
                {{fiveforces[2].title}}
                <div class="row">
                    <%--<div class="col-md-4">--%>
                    <div class="col-6 col-sm-6 col-lg-4" style="border-style: solid; border-width: 1px">
                        <h2>SUP-1</h2>
                        <div id="SUP1"></div>
                        {{fiveforces[2].a}}
                        <asp:HiddenField runat="server" ID="hiddenTextForBackend_SUP1"></asp:HiddenField>
                        <p class="sites">
                            <input type="radio" class="input_hidden" name="site" id="Radio4" value="+10" /><label ng-click="selectionDone2('SUP1', 'minus')" class="investfield" for="ten">-</label>
                            <input type="radio" class="input_hidden" name="site" id="Radio5" value="0" /><label ng-click="selectionDone2('SUP1', 'neutral')" class="investfield" for="zero">0</label>
                            <input type="radio" class="input_hidden" name="site" id="Radio6" value="kill" /><label ng-click="selectionDone2('SUP1', 'plus')" class="investfield" for="kill">+</label>
                        </p>
                    </div>
                    <div class="col-6 col-sm-6 col-lg-4" style="border-style: solid; border-width: 1px">
                        <h2>SUP-2</h2>
                        <div id="SUP2"></div>
                        {{fiveforces[2].b}}
                        <asp:HiddenField runat="server" ID="hiddenTextForBackend_SUP2"></asp:HiddenField>
                        <p class="sites">
                            <input type="radio" class="input_hidden" name="site" id="Radio1" value="+10" /><label ng-click="selectionDone2('SUP2', 'minus')" class="investfield" for="ten">-</label>
                            <input type="radio" class="input_hidden" name="site" id="Radio2" value="0" /><label ng-click="selectionDone2('SUP2', 'neutral')" class="investfield" for="zero">0</label>
                            <input type="radio" class="input_hidden" name="site" id="Radio3" value="kill" /><label ng-click="selectionDone2('SUP2', 'plus')" class="investfield" for="kill">+</label>
                        </p>
                    </div>
                    <div class="col-6 col-sm-6 col-lg-4" style="border-style: solid; border-width: 1px">
                        <h2>SUP-3</h2>
                        <div id="SUP3"></div>
                        {{fiveforces[2].c}}
                        <asp:HiddenField runat="server" ID="hiddenTextForBackend_SUP3"></asp:HiddenField>
                        <p class="sites">
                            <input type="radio" class="input_hidden" name="site" id="ten" value="+10" /><label ng-click="selectionDone2('SUP3', 'minus')" class="investfield" for="ten">-</label>
                            <input type="radio" class="input_hidden" name="site" id="zero" value="0" /><label ng-click="selectionDone2('SUP3', 'neutral')" class="investfield" for="zero">0</label>
                            <input type="radio" class="input_hidden" name="site" id="kill" value="kill" /><label ng-click="selectionDone2('SUP3', 'plus')" class="investfield" for="kill">+</label>
                        </p>
                    </div>
                    <div class="col-6 col-sm-6 col-lg-4" style="border-style: solid; border-width: 1px">
                        <h2>SUP-4</h2>
                        <div id="SUP4"></div>
                        {{fiveforces[2].d}}
                        <asp:HiddenField runat="server" ID="HiddenField1"></asp:HiddenField>
                        <p class="sites">
                            <input type="radio" class="input_hidden" name="site" id="Radio10" value="+10" /><label ng-click="selectionDone2('SUP4', 'minus')" class="investfield" for="ten">-</label>
                            <input type="radio" class="input_hidden" name="site" id="Radio11" value="0" /><label ng-click="selectionDone2('SUP4', 'neutral')" class="investfield" for="zero">0</label>
                            <input type="radio" class="input_hidden" name="site" id="Radio12" value="kill" /><label ng-click="selectionDone2('SUP4', 'plus')" class="investfield" for="kill">+</label>
                        </p>
                    </div>
                    <div class="col-6 col-sm-6 col-lg-4" style="border-style: solid; border-width: 1px">
                        <h2>SUP-5</h2>
                        <div id="SUP5"></div>
                        {{fiveforces[2].e}}
                        <asp:HiddenField runat="server" ID="HiddenField2"></asp:HiddenField>
                        <p class="sites">
                            <input type="radio" class="input_hidden" name="site" id="Radio13" value="+10" /><label ng-click="selectionDone2('SUP5', 'minus')" class="investfield" for="ten">-</label>
                            <input type="radio" class="input_hidden" name="site" id="Radio14" value="0" /><label ng-click="selectionDone2('SUP5', 'neutral')" class="investfield" for="zero">0</label>
                            <input type="radio" class="input_hidden" name="site" id="Radio15" value="kill" /><label ng-click="selectionDone2('SUP5', 'plus')" class="investfield" for="kill">+</label>
                        </p>
                    </div>
                    <div class="col-6 col-sm-6 col-lg-4" style="border-style: solid; border-width: 1px">
                        <h2>SUP-6</h2>
                        <div id="SUP6"></div>
                        {{fiveforces[2].f}}
                        <asp:HiddenField runat="server" ID="HiddenField3"></asp:HiddenField>
                        <p class="sites">
                            <input type="radio" class="input_hidden" name="site" id="Radio16" value="+10" /><label ng-click="selectionDone2('SUP6', 'minus')" class="investfield" for="ten">-</label>
                            <input type="radio" class="input_hidden" name="site" id="Radio17" value="0" /><label ng-click="selectionDone2('SUP6', 'neutral')" class="investfield" for="zero">0</label>
                            <input type="radio" class="input_hidden" name="site" id="Radio18" value="kill" /><label ng-click="selectionDone2('SUP6', 'plus')" class="investfield" for="kill">+</label>
                        </p>
                    </div>
                    <%--</div>--%>
                </div>
                How do you judge the overall situation in Force SUP, based on the individual Forces above?
                      <asp:HiddenField runat="server" ID="hiddenTextForBackend_SUP"></asp:HiddenField>
                <p class="sites">
                    <input type="radio" class="input_hidden" name="site" id="Radio7" /><label ng-click="selectionDone2('SUP', 'minus')" class="investfield" for="ten">-</label>
                    <input type="radio" class="input_hidden" name="site" id="Radio8" /><label ng-click="selectionDone2('SUP', 'neutral')" class="investfield" for="zero">0</label>
                    <input type="radio" class="input_hidden" name="site" id="Radio9" /><label ng-click="selectionDone2('SUP', 'plus')" class="investfield" for="kill">+</label>
                </p>
            </div>
            <div id="tabs-3">
                <p>Mauris eleifend est et turpis. Duis id erat. Suspendisse potenti. Aliquam vulputate, pede vel vehicula accumsan, mi neque rutrum erat, eu congue orci lorem eget lorem. Vestibulum non ante. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce sodales. Quisque eu urna vel enim commodo pellentesque. Praesent eu risus hendrerit ligula tempus pretium. Curabitur lorem enim, pretium nec, feugiat nec, luctus a, lacus.</p>
                <p>Duis cursus. Maecenas ligula eros, blandit nec, pharetra at, semper at, magna. Nullam ac lacus. Nulla facilisi. Praesent viverra justo vitae neque. Praesent blandit adipiscing velit. Suspendisse potenti. Donec mattis, pede vel pharetra blandit, magna ligula faucibus eros, id euismod lacus dolor eget odio. Nam scelerisque. Donec non libero sed nulla mattis commodo. Ut sagittis. Donec nisi lectus, feugiat porttitor, tempor ac, tempor vitae, pede. Aenean vehicula velit eu tellus interdum rutrum. Maecenas commodo. Pellentesque nec elit. Fusce in lacus. Vivamus a libero vitae lectus hendrerit hendrerit.</p>
            </div>
        </div>
        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
        <input id="btnUpdate" type="button" value="update()" ng-click="update()" /><br />

        <asp:HiddenField runat="server" ID="hiddenTextForBackend_ZENTRAL"></asp:HiddenField>

        <pre>data{{forceSelections | json}}</pre>

    </form>
</body>

<script>
    $(document).on('click', '.sites label', function () {
        $(this).addClass('selected').siblings().removeClass('selected');
    });
</script>
<script>

    angular.module('myApp', ['ui.bootstrap']);
    var DataCtrl = function ($scope, $http) {
     
        $scope.forceSelections = makeForceSelections($scope.forceSelections);
        
        $scope.selectionDone2 = function (_force, _verdict) {
            for (var i = 0; i < $scope.forceSelections.length; i++) {
                if ($scope.forceSelections[i].force == _force) {
                    $scope.forceSelections[i].verdict = _verdict;
                }
            }
            var s = angular.toJson($scope.forceSelections);
            $('hiddenTextForBackend_ZENTRAL').val = s;
        }
        //$scope.update = function () {
        //    $http.post('/api/fiveforces/', "uwe").success();
        //}
        $scope.update = function () {
            var j = angular.toJson($scope.forceSelections);
            var ajaxPage = "FiveForces.aspx?Save=1";
            var options = {
                type: "POST",
                url: ajaxPage,
                data: j,
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                async: false,
                success: function (response) {
                    alert("success");
                },
                // error: function (msg) { alert("failed: " + msg); }
            };
            //execute the ajax call and get a response
            var returnText = $.ajax(options).responseText;
            if (returnText == 1) {
                alert(returnText);
            }
        }
        $scope.fiveforces = [];
        $scope.fiveforces_orig = [];
        for (var i = 0; i < server_fiveforces.length; i++) {
            $scope.fiveforces.push(server_fiveforces[i]);
            $scope.fiveforces_orig.push(server_fiveforces[i]);
        }
        $scope.objects = [];       
        $scope.objects = makeForceData($scope.objects);


        $scope.factors = [];
        for (var i = 0; i < server_factors.length; i++) {
            $scope.factors.push(server_factors[i]);
        }

        var start = function () {

            var list = [];
            for (var i = 0; i < $scope.objects.length; i++) {
                if ($.inArray($scope.objects[i].force, list) == -1) {  // distincte "Force"
                    list.push($scope.objects[i].force);
                }
            }

            for (var j = 0; j < list.length; j++) {
                var x = list[j];
                var draw = SVG(x).size(300, 300);  //x -> in welches diV?
                drawShapes($scope.objects, x, draw)
                //for (var i = 0; i < $scope.objects.length; i++) {
                //    if ($scope.objects[i].force == x && $scope.objects[i].shape == 'rect') {
                //        var r = draw.rect($scope.objects[i].x, $scope.objects[i].y).fill($scope.objects[i].color).move($scope.objects[i].move_x, $scope.objects[i].move_y)
                //        .attr({fill:$scope.objects[i].fill, stroke: $scope.objects[i].stroke });
                //    }
                //    if ($scope.objects[i].force == x && $scope.objects[i].shape == 'line') {
                //        var l = draw.line($scope.objects[i].x1, $scope.objects[i].y1, $scope.objects[i].x2, $scope.objects[i].y2).stroke({ width: $scope.objects[i].stroke });
                //    }
                //    if ($scope.objects[i].force == x && $scope.objects[i].shape == 'circle') {
                //        var c = draw.circle($scope.objects[i].size).fill({ color: $scope.objects[i].color }).move($scope.objects[i].move_x, $scope.objects[i].move_y);
                //    }
                //    if ($scope.objects[i].force == x && $scope.objects[i].shape == 'polygon') {                        
                //        var p = draw.polygon($scope.objects[i].points[0] + ' ' + $scope.objects[i].points[1] + ' ' + $scope.objects[i].points[2]).fill(($scope.objects[i].fill)).stroke({ width: 1 }).move($scope.objects[i].move_x, $scope.objects[i].move_y);
                //    }                    
                //    if ($scope.objects[i].force == x && $scope.objects[i].shape == 'fixedpath') {
                //        var p = draw.path($scope.objects[i].blob).size($scope.objects[i].size_x, $scope.objects[i].size_y).move($scope.objects[i].move_x, $scope.objects[i].move_y); 
                //    }
                //    if ($scope.objects[i].force == x && $scope.objects[i].shape == 'text') {
                //        var text = draw.text($scope.objects[i].text).move($scope.objects[i].move_x, $scope.objects[i].move_y).font({ size: $scope.objects[i].textsize });//.attr({ x: $scope.objects[i].move_x, y: $scope.objects[i].move_y });
                //    }
                //    if ($scope.objects[i].force == x && $scope.objects[i].shape == 'info') {
                //        //$("#lblENT2").append($scope.objects[i].description);
                //        // $("#lbl"+$scope.objects[i].force).shape($scope.objects[i].description);
                //       // alert($scope.objects[i].force + "_description");
                //        $("#" + $scope.objects[i].force + "_description").append($scope.objects[i].description);                      
                //    }
                //    if ($scope.objects[i].force == x && $scope.objects[i].shape == 'path') {
                //        var path = draw.path($scope.objects[i].path[0] + ' ' + $scope.objects[i].path[1] + ' ' + $scope.objects[i].path[2] + ' ' + $scope.objects[i].path[3]).move($scope.objects[i].move_x, $scope.objects[i].move_y).attr({ id: "mypath", fill: $scope.objects[i].fill, 'fill-opacity': 0.5, stroke: $scope.objects[i].stroke, 'stroke-width': $scope.objects[i].strokeWidth });
                //        //Special für ECONOMIES OF SCALE - NOCH VERALLGEMEINERN
                //        var a = document.getElementById("mypath");
                //        len = a.getTotalLength();

                //        var pt_start = a.getPointAtLength(0);
                //        var pt = a.getPointAtLength(0.2 * a.getTotalLength());
                //        var c = draw.circle(7).fill({ color: "green" }).move(pt.x - pt_start.x + $scope.objects[i].move_x, pt.y - pt_start.y + $scope.objects[i].move_y);
                      
                //    }
                //}
            }
        };
        start();
    }
</script>
</html>



