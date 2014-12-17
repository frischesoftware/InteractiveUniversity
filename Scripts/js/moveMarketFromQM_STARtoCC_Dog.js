function moveMarketFromQM_STARtoCC_Dog(_data, data_playerproduct) {
    var newGrowthRateForMarket = findSuitableGrowthRateWhenDown(_data);
    for (var i = 0; i < _data.length; i++) {
        if (_data[i].marketName === data_playerproduct.marketName) {
            _data[i].y = newGrowthRateForMarket;
        }
    }
    return _data;
}

function findSuitableGrowthRateWhenDown(_data) {
    var possibleGrowthRatesDown = [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9];
    for (var i = 0; i < _data.length; i++) {
        if (_data[i].playerProduct == 1) {
            if (_data[i].y <= 1) {  // alle bereits existierenden MAs raussuchen
                for (var j = 0; j < possibleGrowthRatesDown.length; j++) {
                    if (possibleGrowthRatesDown[j] == _data[i].y) {   // existiert dieser MA noch in possibleGrowthRatesDown?
                        possibleGrowthRatesDown.remove(j);  // dann dort entfernen
                    }
                }
            }
        }
    }
    // jetzt sollten wir freie Auswahl aus possibleGrowthRatesDown haben:
    var item = possibleGrowthRatesDown[Math.floor(Math.random() * possibleGrowthRatesDown.length)];
    return item;
}



// Array Remove - By John Resig (MIT Licensed)
Array.prototype.remove = function (from, to) {
    var rest = this.slice((to || from) + 1 || this.length);
    this.length = from < 0 ? this.length + from : from;
    return this.push.apply(this, rest);
};