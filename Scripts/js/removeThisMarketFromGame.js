// ein Markt kann nicht einfach gelöscht werden.
// er muß als gelöscht markiert werden, aber weiter bestehen, damit die Summenspalten korrekt berechnet werden



function removeThisMarketFromGame(_data, data_playerproduct) {
    var _data_after_deletion = [];
    for (var i = 0; i < _data.length; i++) {  //später: aufs Altenteil kopieren/Daten zum Server aktualisieren etc.
        if (_data[i].marketName != data_playerproduct.marketName) {
            _data_after_deletion.push(_data[i]);
        }
    }
    return _data_after_deletion;
}

