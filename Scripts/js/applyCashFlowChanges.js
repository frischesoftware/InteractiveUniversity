
function applyCashFlowChanges(_data, data_playerproduct, _gamesetupdata) {
    // determine the ProductType AFTER the market share was changed, then pay out the cash flow accordingly
    for (var i = 0; i < _data.length; i++) {  //alle Produkte
        if (_data[i].playerProduct == 1) {    //für jedes unserer Produkte   


            // AUCH IN DBGAME ÄNDERN!!!!!!!!

            if (GetCurrentProductType(_data, _data[i]) === "CashCow") {
                _data[i].salesLastTurn = _gamesetupdata[0].cfCC // 30;
                _data[i].cashFlowThisTurn = _data[i].salesLastTurn - parseInt(_data[i].investedThisTurn);
            }
            else if (GetCurrentProductType(_data, _data[i]) === "Dog") {
                _data[i].salesLastTurn = _gamesetupdata[0].cfDog;
                _data[i].cashFlowThisTurn = _data[i].salesLastTurn - parseInt(_data[i].investedThisTurn);
            }
            else if (GetCurrentProductType(_data, _data[i]) === "Star") {
                _data[i].salesLastTurn = _gamesetupdata[0].cfStar; // neutral +10, aber -10 Invest, wenn man normal vorgeht (war -5)
                _data[i].cashFlowThisTurn = _data[i].salesLastTurn - parseInt(_data[i].investedThisTurn);
            }
            else if (GetCurrentProductType(_data, _data[i]) === "Questionmark") {
                _data[i].salesLastTurn = _gamesetupdata[0].cfQM; // 0, damit es irgendwie mit der Cash Cow balanciert wird. 3QM -> -30. I CC: 20/30.  negativ auch mit +5, aber -10 Invest (war 0)
                _data[i].cashFlowThisTurn = _data[i].salesLastTurn - parseInt(_data[i].investedThisTurn);
            }

            _data[i].investedLastTurn = _data[i].investedThisTurn;
            _data[i].cashFlowAllTime = parseInt(_data[i].cashFlowAllTime) + parseInt(_data[i].cashFlowThisTurn);
        }
    }
    return _data;
}