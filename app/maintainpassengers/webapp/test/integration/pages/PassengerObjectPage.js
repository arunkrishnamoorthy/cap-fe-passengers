sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'com.fe.ui.maintainpassengers',
            componentId: 'PassengerObjectPage',
            contextPath: '/Passenger'
        },
        CustomPageDefinitions
    );
});