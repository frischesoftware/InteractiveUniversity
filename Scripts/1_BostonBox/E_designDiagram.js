
function E_designDiagram(_gamesetupdata) {

    svg.append("g").attr("class", "x axis").attr("transform", "translate(0," + h / 2 + ")").attr("fill", "none").attr("stroke", "#747d82").attr("stroke-width", 1).attr("font-size", "10px").call(xAxis);
    svg.append("g").attr("class", "y axis").attr("transform", "translate(" + w / 2 + ",0)").attr("fill", "none").attr("stroke", "#747d82").attr("stroke-width", 1).attr("font-size", "10px").call(yAxis);

    svg.append('svg:text').attr('text-anchor', 'middle').attr("fill", "#747d82").attr("font-size", 12)//.attr("font-family", "Conv_framd")
        .attr('x', -60).attr('y', 215).attr('transform', 'rotate(-90)')
        .text('Market Growth')

    svg.append('svg:text').attr('text-anchor', 'left').attr("fill", "#747d82").attr("font-size", 12)//.attr("font-family", "Conv_framd")
        .attr('x', 15).attr('y', 220)
        .text('Relative Market Share');

    svg.append('svg:text').attr('text-anchor', 'left').attr("fill", "#747d82").attr("font-size", 12)//.attr("font-family", "Conv_framd")
        .attr('x', 15).attr('y', 30)
        .text('Stars [+' + _gamesetupdata[0].cfStar + ']');

    svg.append('svg:text').attr('text-anchor', 'left').attr("fill", "#747d82").attr("font-size", 12)//.attr("font-family", "Conv_framd")
        .attr('x', 15).attr('y', 380)
        .text('Cash Cow [+' + _gamesetupdata[0].cfCC + ']');

    svg.append('svg:text').attr('text-anchor', 'right').attr("fill", "#747d82").attr("font-size", 12)//.attr("font-family", "Conv_framd")
        .attr('x', 260).attr('y', 30)
        .text('Question Marks [+' + _gamesetupdata[0].cfQM + ']');

    svg.append('svg:text').attr('text-anchor', 'right').attr("fill", "#747d82").attr("font-size", 12)//.attr("font-family", "Conv_framd")
        .attr('x', 330).attr('y', 380)
        .text('Dogs [' + _gamesetupdata[0].cfDog+ ']');

}