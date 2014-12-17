function applyGameDataChanges(_gamedata, _data, _data_playerproduct) {
    _gamedata[0].cashFlowThisTurn = 0;
    for (var i = 0; i < _data.length; i++) {
        if (_data[i].playerProduct == 1) {
            //data[i].cashFlowThisTurn: Live aktualisiert?
            //gamedata[0].cashFlowThisTurn: rundenweise aktualisiert?
            _gamedata[0].cashFlowThisTurn = parseInt(_gamedata[0].cashFlowThisTurn) + parseInt(_data[i].cashFlowThisTurn);
        }
    }
    _gamedata[0].cashFlowAllTime = parseInt(_gamedata[0].cashFlowAllTime) + parseInt(_gamedata[0].cashFlowThisTurn);
    return _gamedata;
}