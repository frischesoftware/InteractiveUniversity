

// für die Tabelle oben rechts
function determineTotalCashFlowEtc(_data, _gamedata, _data_dead) {
    _gamedata[0].allMarketsSalesLastTurn = 0;
    _gamedata[0].allMarketsInvestLastTurn = 0;
    _gamedata[0].allMarketsCashFlowLastTurn = 0;
    _gamedata[0].allMarketsCashFlowAllTime = 0;

    for (var i = 0; i < _data.length; i++) {
        if (_data[i].playerProduct == 1) {
            _gamedata[0].allMarketsSalesLastTurn += _data[i].salesLastTurn;
            _gamedata[0].allMarketsInvestLastTurn += _data[i].investedLastTurn;
            _gamedata[0].allMarketsCashFlowLastTurn += _data[i].cashFlowThisTurn;
            _gamedata[0].allMarketsCashFlowAllTime += _data[i].cashFlowAllTime;
        }
    }
    for (var j = 0; j < _data_dead.length; j++) {
        if (_data_dead[j].playerProduct == 1) {
            _gamedata[0].allMarketsCashFlowAllTime += _data_dead[j].cashFlowAllTime;
        }
    }


    // determine "numberOfBadTurnsSoFar" - Wie ist "Bad Round" definiert? Sagen wir, wenn der Gesamtcashflow negativ ist
    if (_gamedata[0].allMarketsCashFlowLastTurn <= 0) {
        _gamedata[0].numberOfBadTurnsSoFar += 1;
    }


    if (_gamedata[0].allMarketsCashFlowAllTime <= 0) {
        //alert("game over condition due to CashFlowAllTime ==" + _gamedata[0].allMarketsCashFlowAllTime);
    }




    return _gamedata;
}
