function up(_data, _data_playerproduct) {
    //nochmal mit http://jsfiddle.net/eNe3U/27/ schauen, warum die nodes selbst nicht zu löschen sind
    // sollte mit   node.exit().transition().delay(1000)
    //                  .duration(1000).remove(); 
    //gehen

    var circle = svg.selectAll("circle").data(_data, function (d) { return d.ci; });
    var text = svg.selectAll(".textClass").data(_data, function (d) { return d.ci; });
    var node = svg.selectAll(".node");
    node = node.data(_data, function (d) { return d.ci; });

    node.enter().append("circle")
        .attr("class", function (d) { return "node " + d.ci; })
        .attr("cx", function (d) { return xScale(d.x); }).attr("cy", function (d) { return yScale(d.y); }).attr("r", 10)
        .attr("stroke", function (d) { return d.secondaryColor; }).style("stroke-width", 2)
        .attr("fill", function (d) { return d.primaryColor; });

    node.enter().append("svg:text")
        .attr("class", "textClass")
        .attr("x", function (d) { return xScale(d.x); }).attr("y", function (d) { return yScale(d.y); }).attr("text-anchor", "middle")
        .attr("dy", ".35em").attr("font-size", "14px").attr("fill", "white")  //.attr("font-family", "Conv_framd")
        .text(function (d) { return d.circleText; });

    circle.transition().delay(0).duration(500).attr("cx", function (d) { return xScale(d.x); }).attr("cy", function (d) { return yScale(d.y); })
    text.transition().delay(0).duration(500).attr("x", function (d) { return xScale(d.x); }).attr("y", function (d) { return yScale(d.y); })

        circle.exit().remove();  //delete  
        text.exit().remove();  //delete  
}