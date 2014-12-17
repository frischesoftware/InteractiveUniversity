function countType(_data, _data_playerproduct, type) {
    var typeCount = 0; // z.B. 0 CashCows
    for (var i = 0; i < _data.length ; i++) {
        if (_data[i].playerProduct == '1') {
            if (GetCurrentProductType(_data, _data[i]) == type) {
                typeCount += 1;
            }
        }
    }
    return typeCount;

}
