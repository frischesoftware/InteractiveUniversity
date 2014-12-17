function updateMarketLifeTime(_data)
{
    for (var i = 0; i < _data.length; i++) {

        //aufräumen: Invest "+10" wird zu "10", sonst kann man nicht rechnen
        if (_data[i].investedThisTurn == "+10") {_data[i].investedThisTurn = 10 }
        else if (_data[i].investedThisTurn == "0") { _data[i].investedThisTurn = 0 }

        if (_data[i].playerProduct == '1') {
            var _currentProdType = GetCurrentProductType(_data, _data[i])
            if (_currentProdType === "CashCow" || _currentProdType === "Dog") {  // Product ist DOWN -> zuerst behandeln, damit nicht ein Produkt von UP nach DOWN und gleich nochmal DOWN geht                             
                if (_data[i].marketLifeTimeDown < 1) {
                    //remove - nach oben verlegt                                 
                }
                else {
                    _data[i].marketLifeTimeDown -= 1;
                }
            }
            else if (_currentProdType === "Questionmark" || _currentProdType === "Star") { // Produkt ist UP  
                if (_data[i].marketLifeTimeUp < 1) {
                    _data = moveMarketFromQM_STARtoCC_Dog(_data, _data[i]);
                //    displayDataRefresh();
                }
                else {
                    _data[i].marketLifeTimeUp -= 1;
                }
            }
        }
    }
    return _data;
}