// ProductType: Star, Questionmark, CashCow, Dog
// Current: current to this turn - investments change market share, time changes growth -> ProductTypes can change



function GetCurrentProductType(_data, relevantData) {
    var _currentProductType; // the TYPE of one product in a given turn, to determine reaction to certain investment

    var maxMarketShare = 0;
    var ourProductHasTheBiggestMarketShare = 1; // start with true
    for (var i = 0; i < _data.length; i++) {
        if (_data[i].marketName === relevantData.marketName) {
            if (_data[i].x > maxMarketShare) {
                maxMarketShare = _data[i].x;
            }
        }
    }
    if (relevantData.x < maxMarketShare) {
        ourProductHasTheBiggestMarketShare = 0;
    }
    if (ourProductHasTheBiggestMarketShare === 1)  // Star or CashCow
    {
        if (relevantData.y > 1) {
            _currentProductType = "Star";
        }
        else {
            _currentProductType = "CashCow";
        }
    }
    else {                                          // QuestionMark or Dog
        if (relevantData.y > 1) {
            _currentProductType = "Questionmark";
        }
        else {
            _currentProductType = "Dog";
        }
    }

    return _currentProductType;
}