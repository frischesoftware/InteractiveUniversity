function applyDeletionsFirst(data, data_playerproduct) {
    //var plu = _(data).pluck('marketName');
    //var tobekilled = _(data).where({ investedThisTurn: "kill" });
    var nottobekilled = _(data).where({ playerProduct: "1" });
    nottobekilled = _(nottobekilled).reject(function (r) { return r.investedThisTurn === "kill" });

    data = _.filter(data, function (a) {
        return _.find(nottobekilled, function (b) {
            return a.marketName === b.marketName;
        });
    });


    //for (var i = data_playerproduct.length - 1; i >= 0 ; i--) {
    //    if (data_playerproduct[i].investedThisTurn === "kill") { // remove Product from Market
    //        for (var j = 0; j < data.length; j++) {
    //            if (data[j].ci === data_playerproduct[i].ci) {
    //                data.splice(j, 1);
    //            }
    //        }
    //        for (var k = data.length - 1; k >= 0; k--) {
    //            if (data[k].marketName === data_playerproduct[i].marketName) {  // only products in this market
    //                if (data[k].playerProduct === '0') {  // only competitors
    //                    data.splice(k, 1);
    //                }
    //            }
    //        }
    //    }
    //}
    return data;
}