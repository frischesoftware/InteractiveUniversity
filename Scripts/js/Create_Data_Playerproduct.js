function Create_Data_Playerproduct(data) {
    // for Protovis, und für "Next/Evaluierung der Investments/CurrentType..."
    var data_playerproduct = new Array();
    for (var ia = 0; ia < data.length; ia++) {
        if (data[ia].playerProduct == 1) {
            data_playerproduct.push(data[ia]);
        }
    }
    return data_playerproduct;
}


