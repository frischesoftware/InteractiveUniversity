function drawShapes(_objects, x, draw, id) {
    //force ist von FiveForces, und entspricht einem "Bild", also "Bild 1..Bild n"

    
    


    for (var i = 0; i < _objects.length; i++) {
        if (_objects[i].force == x && _objects[i].shape == 'rect') {
            var r = draw.rect(_objects[i].x, _objects[i].y).fill(_objects[i].color).move(_objects[i].move_x, _objects[i].move_y)
            .attr({ fill: _objects[i].fill, stroke: _objects[i].stroke })
            .attr({ "id": _objects[i].id })
            .attr({ "class": _objects[i]._class });

            
        }
        if (_objects[i].force == x && _objects[i].shape == 'line') {
            var l = draw.line(_objects[i].x1, _objects[i].y1, _objects[i].x2, _objects[i].y2).stroke({ width: _objects[i].stroke });
        }
        if (_objects[i].force == x && _objects[i].shape == 'circle') {
            var c = draw.circle(_objects[i].size).fill({ color: _objects[i].color }).move(_objects[i].move_x, _objects[i].move_y)
                .attr({ "id": _objects[i].id })
                .attr({ "class": _objects[i]._class });
        }
        if (_objects[i].force == x && _objects[i].shape == 'polygon') {
            var p = draw.polygon(_objects[i].points[0] + ' ' + _objects[i].points[1] + ' ' + _objects[i].points[2]).fill((_objects[i].fill)).stroke({ width: 1 }).move(_objects[i].move_x, _objects[i].move_y);
        }
        if (_objects[i].force == x && _objects[i].shape == 'fixedpath') {
            var p = draw.path(_objects[i].blob).size(_objects[i].size_x, _objects[i].size_y).move(_objects[i].move_x, _objects[i].move_y)
                .attr({ "class": _objects[i]._class })
                .attr({ "id": _objects[i].id });
                
        }
        if (_objects[i].force == x && _objects[i].shape == 'text') {
            var text = draw.text(_objects[i].text).move(_objects[i].move_x, _objects[i].move_y).font({ size: _objects[i].textsize })
            .attr({ "id": _objects[i].id })
            .attr({ "class": _objects[i].class });
            //.attr({ x: _objects[i].move_x, y: _objects[i].move_y });
        }
        if (_objects[i].force == x && _objects[i].shape == 'info') {
            //$("#lblENT2").append(_objects[i].description);
            // $("#lbl"+_objects[i].force).shape(_objects[i].description);
            // alert(_objects[i].force + "_description");
            $("#" + _objects[i].force + "_description").append(_objects[i].description);
        }
        if (_objects[i].force == x && _objects[i].shape == 'path') {
            var path = draw.path(_objects[i].path[0] + ' ' + _objects[i].path[1] + ' ' + _objects[i].path[2] + ' ' + _objects[i].path[3]).move(_objects[i].move_x, _objects[i].move_y).attr({ id: "mypath", fill: _objects[i].fill, 'fill-opacity': 0.5, stroke: _objects[i].stroke, 'stroke-width': _objects[i].strokeWidth });
            //Special für ECONOMIES OF SCALE - NOCH VERALLGEMEINERN
            var a = document.getElementById("mypath");
            len = a.getTotalLength();

            var pt_start = a.getPointAtLength(0);
            var pt = a.getPointAtLength(0.2 * a.getTotalLength());
            var c = draw.circle(7).fill({ color: "green" }).move(pt.x - pt_start.x + _objects[i].move_x, pt.y - pt_start.y + _objects[i].move_y);

        }
    }
}