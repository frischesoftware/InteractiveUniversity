function initColors(_data, _colorsplayer, _colorscompetition) {
    // eine lokale Kopie außerhalb des Loops für colorsplayer, innerhalb für colorscompetition (wiederholt sich pro Markt)
    var local_colorsplayer = [];
    for (var m = 0; m < _colorsplayer.length; m++) {
        local_colorsplayer.push(_colorsplayer[m]);
    }

    // bereits (in vorangegangenen Runden) vergebene Farben entfernen
    for (var z1 = 0; z1 < _data.length; z1++) {   // muß nicht auf == playerProduct eingeschränkt werden, da player und competition-Farben sich nicht überschneiden
        for (var z2 = 0; z2 < local_colorsplayer.length; z2++) {
            if (_data[z1].primaryColor == local_colorsplayer[z2]) {
                local_colorsplayer.splice(z2,1);
            }
        }
    }


    for (var i = 0; i < _data.length; i++) {     
        if (_data[i].playerProduct == '1') {
            if (_data[i].primaryColor == "orange") { // nur wenn noch nicht zugewiesen! Farben bleiben
                _data[i].primaryColor = local_colorsplayer.shift(); // nimm oberste Farbe aus dem Farbarray und gibs dem jew. Playerproduct
                _data[i].secondaryColor = _data[i].primaryColor;
            }
           
            var local_colorscompetition = []; // die competition-graufarben lokal kopieren (array wird mit "shift" geleert)
            for (n = 0; n < _colorscompetition.length; n++) {
                local_colorscompetition.push(_colorscompetition[n]);
            }

            for (var j = 0; j < _data.length; j++) { // nochmal durchlaufen und allen dazugehörigen die grauen Farben geben
                if (_data[i].marketName == _data[j].marketName && i != j) { // alle anderen Prod im gl Markt, aber nicht unser Playerprod
                    if (_data[j].primaryColor == "orange") {
                        _data[j].primaryColor = local_colorscompetition.shift();
                        _data[j].secondaryColor = _data[i].primaryColor;
                    }
                }
            }
        }
    }
    return _data;
}