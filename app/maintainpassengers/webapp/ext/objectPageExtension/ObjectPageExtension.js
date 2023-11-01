sap.ui.define([
    "sap/m/MessageToast"
], function(MessageToast) {
    'use strict';

    return {
        testExtension: function(oEvent) {
            MessageToast.show("Custom handler invoked.");
        }
    };
});
