<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Introduction.aspx.cs" Inherits="Introduction" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>

  <script src="Scripts/Lib/d3.v3.min.js"></script>
    <script src="Scripts/1_BostonBox/E_designDiagram.js"></script>
    <link href="Styles/uwesStyles.css" rel="stylesheet" />
 

</head>
<body>
    <form id="form1" runat="server">
        <div>
            Welcome to the Growth Share matrix, an interactive learning simulation from Interactive-University.com
        </br> It's free, no signup needed. Start immediately in short, 5-minute sessions!
        </div>
        </br>
        <div id="origMatrix">
            You should come with a basic understanding of the Growth Share Matrix or Boston Box, 
            maybe from your Business Management classes, from business strategy meetings or 
            from https://en.wikipedia.org/wiki/Boston_Box
        </div>
        <div id="d3_origMatrix"></div>

        <div id="equalSizes">
            Except for advanced scenarios and real world case studies, the market/business size is set to be identical for all products/markets.
            Otherwise a decision made for one of the "big" products could diminish the impact of decisions made for "smaller" products.
        </div>
        <div id="d3_equalSizes"></div>
        <div id ="onlyHighAndLow">
            The Growth Share matrix knows of "high growth" (Question Marks, Stars) and "low growth" sectors (Cash Cows, Dogs). Withing these catetories the growth rate
            does not matter. So in order to fit elements on in the diagram without overlap, the growth rates are "spread out" vertically. Note: a growth
        </div>
        <div id="d3_onlyHighAndLow"></div>

        <div id="showingCompetitors">
            Competing products are added to show market dynamics - the strongest competitor might try to catch up with our product. <br/>
            Colors! <br/>
            To minimize complexity the number of markets is limited for introductory scenarios
        </div>
        <div id="d3_showingCompetitors"></div>

        <script type="text/javascript">
            //var exampleData___ = [
            //{ name: 'Pentrix', r: 25, r_equalSizes: 10, x: 30, y: 170, y_onlyHighAndLow: 170 },
            //{ name: 'Dorlan', r: 25, r_equalSizes: 10, x: 160, y: 30, y_onlyHighAndLow: 30 },
            //{ name: 'Xentax', r: 20, r_equalSizes: 10, x: 300, y: 50, y_onlyHighAndLow: 70 },
            //{ name: 'Longal', r: 10, r_equalSizes: 10, x: 360, y: 30, y_onlyHighAndLow: 100 },
            //{ name: 'Energan', r: 10, r_equalSizes: 10, x: 370, y: 40, y_onlyHighAndLow: 140 },
            //{ name: 'Eviron', r: 20, r_equalSizes: 10, x: 140, y: 310, y_onlyHighAndLow: 310 },
            //{ name: 'Bendac', r: 15, r_equalSizes: 10, x: 180, y: 220, y_onlyHighAndLow: 220 },
            //{ name: 'Lotran', r: 17, r_equalSizes: 10, x: 190, y: 380, y_onlyHighAndLow: 380 },
            //{ name: 'Energan', r: 12, r_equalSizes: 10, x: 240, y: 240, y_onlyHighAndLow: 240 },
            //{ name: 'Zodial', r: 10, r_equalSizes: 10, x: 250, y: 330, y_onlyHighAndLow: 330 }
            //];
 
            var w = 400; var h = 400; var padding = 20;            
            var xScale = d3.scale.linear().domain([2, 0]).range([padding, w - padding]);
            var yScale = d3.scale.linear().domain([0, 2]).range([h - padding, padding]);
            var xAxis = d3.svg.axis().scale(xScale).orient("bottom");
            var yAxis = d3.svg.axis().scale(yScale).orient("left");


            var exampleData = [
            { marketName: 'Pentrax', name: 'Pentrix', r: 25, r_equalSizes: 10, x: 30, y: 170, y_onlyHighAndLow: 170, playerProduct: '1', primaryColor : '#a01717', secondaryColor : '#a01717', circleText: 1},
            { marketName: 'Pentrax', name: 'Pentrax', r: 25, r_equalSizes: 10, x: 250, y: 170, y_onlyHighAndLow: 170, playerProduct: '0',  primaryColor : '#9ca2a6', secondaryColor : '#a01717', circleText: 2},
            { marketName: 'Pentrax', name: 'Pentrux', r: 25, r_equalSizes: 10, x: 290, y: 170, y_onlyHighAndLow: 170, playerProduct: '0', primaryColor: '#9ca2a6', secondaryColor: '#a01717', circleText: 3 },
            { name: 'Dorlan', r: 25, r_equalSizes: 10, x: 160, y: 30, y_onlyHighAndLow: 30 },
            { marketName: 'Xentrax', name: 'Xentax', r: 20, r_equalSizes: 10, x: 300, y: 50, y_onlyHighAndLow: 70, playerProduct: '1', primaryColor: '#1F4689', secondaryColor: '#1F4689', circleText: 4 },
            { marketName: 'Xentrax', name: 'Xentrux', r: 20, r_equalSizes: 10, x: 50, y: 50, y_onlyHighAndLow: 70, playerProduct: '0', primaryColor: '#9ca2a6', secondaryColor: '#1F4689', circleText: 5 },
            { marketName: 'Xentrax', name: 'Xentix', r: 20, r_equalSizes: 10, x: 360, y: 50, y_onlyHighAndLow: 70, playerProduct: '0', primaryColor: '#9ca2a6', secondaryColor: '#1F4689', circleText: 6 },
            { name: 'Longal', r: 10, r_equalSizes: 10, x: 360, y: 30, y_onlyHighAndLow: 100 },
            { name: 'Energan', r: 10, r_equalSizes: 10, x: 370, y: 40, y_onlyHighAndLow: 140 },
            { name: 'Eviron', r: 20, r_equalSizes: 10, x: 140, y: 310, y_onlyHighAndLow: 310 },
            { name: 'Bendac', r: 15, r_equalSizes: 10, x: 180, y: 220, y_onlyHighAndLow: 220 },
            { name: 'Lotran', r: 17, r_equalSizes: 10, x: 190, y: 360, y_onlyHighAndLow: 360 },
            { name: 'Braviton', r: 12, r_equalSizes: 10, x: 240, y: 240, y_onlyHighAndLow: 240 },
            { marketName: 'Zodial', name: 'Zodial', r: 10, r_equalSizes: 10, x: 250, y: 330, y_onlyHighAndLow: 330, playerProduct: '1', primaryColor: '#7bade1', secondaryColor: '#7bade1', circleText: 4 },
            { marketName: 'Zodial', name: 'Zodiax', r: 10, r_equalSizes: 10, x: 130, y: 330, y_onlyHighAndLow: 330, playerProduct: '0', primaryColor: '#9ca2a6', secondaryColor: '#7bade1', circleText: 4 },
            { marketName: 'Zodial', name: 'Zodilin', r: 10, r_equalSizes: 10, x: 380, y: 330, y_onlyHighAndLow: 330, playerProduct: '0', primaryColor: '#9ca2a6', secondaryColor: '#7bade1', circleText: 4 },
            ];

           
            drawSVG("#d3_origMatrix", "origMatrix");
            drawSVG("#d3_equalSizes", "equalSizes");
            drawSVG("#d3_onlyHighAndLow", "onlyHighAndLow");

            drawSVG("#d3_showingCompetitors", "showingCompetitors");
            

            function drawSVG(elem, scenario) {
                svg = d3.select(elem).append("svg").attr("width", w).attr("height", h).style("border-style", "solid").style("border-width", "thin").style("border-color", "#747d82");
                E_designDiagram();
                drawCircles(exampleData, scenario);
            } 

            function drawSVG2(elem, scenario) {
                svg = d3.select(elem).append("svg").attr("width", w).attr("height", h).style("border-style", "solid").style("border-width", "thin").style("border-color", "#747d82");
                E_designDiagram();
            }                      

            function drawCircles(data, scenario) {
                var circle = svg.selectAll("circle").data(exampleData);

                var node = svg.selectAll(".node");
                node = node.data(data);
                node.enter().append("circle")
                     .attr("r", function (d) {
                         if (scenario=="origMatrix") {  // nimm die echten Kreisgrößen
                             if (d.playerProduct != '0') {
                                 return d.r;
                             }
                         }
                         else {
                             if (scenario == "showingCompetitors") {  // beim letzten Diagram nur die relevaten Märkte einblenden
                                 if (d.playerProduct == '0' || d.playerProduct =='1') {
                                     return d.r_equalSizes;
                                 }
                                 else {
                                     return 0;
                                 }
                             }
                             else {
                                 if (d.playerProduct != '0') {
                                     return d.r_equalSizes;     // nimm r=10 bei allen Szenarien, aber lass die Competitors weg
                                 }
                                 
                             }
                             
                         }
                     })
                     .attr("cx", function (d) { return d.x; })
                     .attr("cy", function (d) {
                         if (scenario == "onlyHighAndLow") {
                             return d.y_onlyHighAndLow;
                         }
                         else {
                             return d.y;
                         }                         
                     })
                     .attr("fill", function(d) {
                         if (scenario == "showingCompetitors") {
                             return d.primaryColor;
                         }
                         else {
                             return "orange";
                         }
                     } )                                          
                    .attr("stroke", function(d) {
                        if (scenario == "showingCompetitors") {
                            return d.secondaryColor;
                        }
                        else {
                            return "red";
                        }
                    }
                    );

                node.enter().append("svg:text")
                 //.attr("class", "blingText")
                 .attr("x", function (d) {
                     return d.x - d.r;
                 })
                 .attr("y", function (d) {
                     if (scenario != "showingCompetitors") {
                         if (d.playerProduct != '0') {
                             if (scenario == "origMatrix") {
                                 return d.y + d.r + 15;  //Schriftabstand unter dem Kreis in Abhängigkeit vom jeweiligen Radius
                             }
                             else if (scenario == "onlyHighAndLow") {
                                 return d.y_onlyHighAndLow + 10 + 10;
                             }
                             else {
                                 return d.y + 10 + 10; // Schriftabstand: fixer Radius (10) 
                             }
                         }
                     }
                     else {
                       //  if (d.playerProduct == '0' || d.playerProduct == '1') {
                             return d.y + 10 + 10;
                        // }
                     }

                 })
                 .text(function (d) { return d.name })
                 .attr("dy", ".35em").attr("font-size", "12px").attr("fill", "red")             //.attr("font-family", "Conv_framd")
                .attr("visibility", function (d) {
                    if (scenario != "showingCompetitors") {
                        if (d.playerProduct == '0') {  // zeige keine Konkurrenzprodukte außer bei "showingCompetitors"
                            return "hidden"
                        }
                    }
                    else {
                        if (d.playerProduct == '0' || d.playerProduct == '1') {  // bei "showingCompetitors" zeige nur PP = 1 oder PP = 0
                            return "visible";
                        }
                        else {
                            return "hidden";
                        }
                    }
                })
                ;
            }

            
            

        </script>
    </form>

</body>
</html>
