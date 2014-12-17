function addRemovedMarket(_data, data_playerproduct, _data_dead) {
    //var _data_dead = [];  // take the one that already exists, keep older deleted products, just add the new ones
    for (var i = 0; i < _data.length; i++) {
        if (_data[i].marketName == data_playerproduct.marketName) {
            _data_dead.push(_data[i]);
        }
    }
    return _data_dead;
}