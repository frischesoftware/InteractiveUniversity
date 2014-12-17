function refreshDataPlayerproduct(_data) {
    _data_playerproduct = [];
    for (var i = 0; i < _data.length; i++) {
        if (_data[i].playerProduct == '1') {
            _data_playerproduct.push(_data[i]);
        }
    }
    return _data_playerproduct
}