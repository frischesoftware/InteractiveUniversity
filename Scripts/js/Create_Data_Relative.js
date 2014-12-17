
function Create_Data_Relative(_data, data_playerproduct) {
    // relative Marktanteile (1.25, 0.8, 0.4, 0.2 ....)
    var data_relative = new Array();
    for (var ib = 0; ib < _data.length; ib++) {
        var _temp =
            {
                "ci": _data[ib].ci,
                "x": _data[ib].x,
                "y": _data[ib].y,
                "z": _data[ib].z,
                "name": _data[ib].name,
                "playerProduct": _data[ib].playerProduct,
                "f": _data[ib].f,
                "primaryColor": _data[ib].primaryColor,
                "secondaryColor": _data[ib].secondaryColor,
                "circleText": _data[ib].circleText,
                "cashFlowThisTurn": _data[ib].cashFlowThisTurn
            };
        data_relative.push(_temp);
        //data_relative.push(_data[ib]);
    }

    var position_max_marketshare = 0;    // position des elements mit dem größten MarketShare in diesem Markt (1.25)
    var position_second_marketshare; // position des elements mit dem zweitgrößten MarketShare in diesem Markt (0.8)

    for (var ic = 0; ic < data_playerproduct.length; ic++) {
        for (var j = 0; j < data_relative.length; j++) {  // determine biggest market share (all others are relative to that)
            if (data_relative[j].y === data_playerproduct[ic].y) {    // y = Growth; eindeutige id für Markt.
                if (data_relative[j].x > data_relative[position_max_marketshare].x) {
                    position_max_marketshare = j;
                }
            }
        }
        // irgendein Startwert für die Position vom 2.größten. Sollte aber nicht der Startwert vom größten sein!
        if (position_max_marketshare === 0) {
            position_second_marketshare = 1;
        }
        else {
            position_second_marketshare = 0;
        }

        for (var k = 0; k < data_relative.length; k++) {  // alles in "data"...
            if (data_relative[k].y === data_playerproduct[ic].y) { // ... wo 
                if (data_relative[k].x < data_relative[position_max_marketshare].x) {
                    if (data_relative[k].x > data_relative[position_second_marketshare].x) {
                        position_second_marketshare = k;
                    }
                }
            }
        }
        //berechne die relativen Marktanteile hier:
        var value_max_marketshare = data_relative[position_max_marketshare].x;
        var value_second_marketshare = data_relative[position_second_marketshare].x;
        for (var l = 0; l < data_relative.length; l++) {
            if (data_relative[l].y === data_playerproduct[ic].y) {
                if (l === position_max_marketshare) {
                    data_relative[position_max_marketshare].x = value_max_marketshare / value_second_marketshare;
                }
                else if (l === position_second_marketshare) {
                    data_relative[position_second_marketshare].x = value_second_marketshare / value_max_marketshare;
                }
                else {
                    data_relative[l].x = data_relative[l].x / value_max_marketshare;
                }
            }
        }
    }
    return data_relative;
}