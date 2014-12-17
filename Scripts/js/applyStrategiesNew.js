

function applyStrategiesNew(data, data_playerproduct) {
    //_.each([1, 2, 34], alert);
    var c_up = 0;
    var c_down = 0;
    var c_competitorcount;
    var minMarketShare = 15;
    var maxMarketShare = 65; //50
    var maxMarketShareFactor = 1.9; // don't let it be 44% vs. 20%, the scale for relative market share just goes to 2.


    for (var i = 0; i < data_playerproduct.length; i++) {
        var _currentProductType = GetCurrentProductType(data, data_playerproduct[i]);

        var ourCompetitorsInthisMarket = getOurCompetitorsInThisMarket(data_playerproduct[i].marketName, data);
        var ourProductInThisMarket = getOurProductInThisMarket(data_playerproduct[i].marketName, data);
        var bestCompetitorInMarket = getBestCompetitorInMarket(data_playerproduct[i].marketName, data);

        var ms_before = data[ourProductInThisMarket].x;

        if (_currentProductType === "CashCow" || _currentProductType === "Dog") {

            c_down = data_playerproduct[i].stepsize_down;


            if (data_playerproduct[i].investedThisTurn === 10) {
                // +c_down bedeutet: betrachte die Situation NACH erfolgter Änderung -> der Wert darf den Grenzwert gar nicht erst überschreiten
                if (data[ourProductInThisMarket].x + c_down >= maxMarketShare
                    || (data[ourProductInThisMarket].x + c_down) / (data[bestCompetitorInMarket].x - c_down) >= maxMarketShareFactor) { }

                else {
                    data[ourProductInThisMarket].x += c_down;
                    data[bestCompetitorInMarket].x -= c_down;
                }
            }
            else if (data_playerproduct[i].investedThisTurn === 0) {
                if (data[ourProductInThisMarket].x - c_down <= minMarketShare
                    || (data[bestCompetitorInMarket].x - c_down) / (data[ourProductInThisMarket].x - c_down) >= maxMarketShareFactor) { }  //damit der beste comp. nicht "abhaut"
                else {
                    data[ourProductInThisMarket].x -= c_down;
                    data[bestCompetitorInMarket].x += c_down;
                }
            }
        }

        else if (_currentProductType === "Questionmark" || _currentProductType === "Star") {

            c_up = data_playerproduct[i].stepsize_up;

            if (data_playerproduct[i].investedThisTurn === 10) {
                if (data[ourProductInThisMarket].x + c_up >= maxMarketShare
                    || (data[ourProductInThisMarket].x + c_up) / (data[bestCompetitorInMarket].x - c_down) >= maxMarketShareFactor) { }
                else {
                    data[ourProductInThisMarket].x += c_up;
                    data[bestCompetitorInMarket].x -= c_up;
                }
            }
            else if (data_playerproduct[i].investedThisTurn === 0) {
                if (data[ourProductInThisMarket].x - c_up <= minMarketShare
                    || (data[bestCompetitorInMarket].x + c_up) / (data[ourProductInThisMarket].x - c_up) >= maxMarketShareFactor) { }
                else {
                    data[ourProductInThisMarket].x -= c_up;
                    data[bestCompetitorInMarket].x += c_up;
                }
            }

        }

        // Dies läuft noch innerhalb der Schleife über alle PlayerProducts:
        /*
        // VERMEIDE GLEICHSTAND VON #1 UND #2 - DIE THEORIE SIEHT DIES NICHT VOR UND ES SIEHT NICHT GUT AUS IM DIAGRAMM
        if (data[ourProductInThisMarket].x == data[bestCompetitorInMarket].x) {
            data[ourProductInThisMarket].ms_loan -= 2;
            data[ourProductInThisMarket].x += 2;
            data[bestCompetitorInMarket].x -= 2;
        }
            // PRÜFE OB EIN MS_LOAN VORHANDEN IST UND OB DIESER IN DIESER RUNDE AUFGELÖST WERDEN KANN (WENN GENÜGEND ABSTAND DA IST)
        else if (data[ourProductInThisMarket].ms_loan != 0 &&    //gibt es einen Market Share Loan?
                    (data[ourProductInThisMarket].x + c_down >= data[bestCompetitorInMarket].x - c_down + 6 ||   //haben wir genügend Abstand
                    data[ourProductInThisMarket].x + c_down <= data[bestCompetitorInMarket].x - c_down - 6)
                ) {
            data[ourProductInThisMarket].ms_loan += 2;   // dann zahle den Loan zurück
            data[ourProductInThisMarket].x -= 2;
        }
        */
        var ms_after = data[ourProductInThisMarket].x;
        var delta = ms_after - ms_before;
        data[ourProductInThisMarket].x_delta = delta;
        
    }
    return data;
}



//http://www.naden.de/blog/javascript-foreach
Array.prototype.foreach = function (callback) {
    for (var k = 0; k < this.length; k++) {
        callback(k, this[k]);
    }
}

function getOurCompetitorsInThisMarket(currentMarketName, _data) {
    var thisMarketArray = [];
    for (var i = 0; i < _data.length; i++) {
        if (_data[i].marketName === currentMarketName) {  // only products in this market
            if (_data[i].playerProduct === '0') {  // only competitors
                thisMarketArray.push(i);
            }
        }
    }
    return thisMarketArray;
}

function getOurProductInThisMarket(currentMarketName, _data) {

    for (var i = 0; i < _data.length; i++) {
        if (_data[i].marketName === currentMarketName) {  // only products in this market
            if (_data[i].playerProduct === '1') {  // only competitors
                return i;
            }
        }
    }
}

function getBestCompetitorInMarket(currentMarketName, _data) {
    var maxMarketShareOfPlayersInMarketWhoIsNotPlayerProduct = 0;
    var indexBestCompetitor;

    for (var i = 0; i < _data.length; i++) {
        if (_data[i].marketName === currentMarketName && _data[i].playerProduct === '0') {  // only products in this market, only competitors
            if (_data[i].x > maxMarketShareOfPlayersInMarketWhoIsNotPlayerProduct) {     // only if this one has better market share than the previous best
                maxMarketShareOfPlayersInMarketWhoIsNotPlayerProduct = _data[i].x;
                indexBestCompetitor = i;
            }
        }
    }
    return indexBestCompetitor;
}
