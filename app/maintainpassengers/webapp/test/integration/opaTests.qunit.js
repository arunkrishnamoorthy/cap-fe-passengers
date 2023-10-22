sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'com/fe/ui/maintainpassengers/test/integration/FirstJourney',
		'com/fe/ui/maintainpassengers/test/integration/pages/PassengerList',
		'com/fe/ui/maintainpassengers/test/integration/pages/PassengerObjectPage'
    ],
    function(JourneyRunner, opaJourney, PassengerList, PassengerObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('com/fe/ui/maintainpassengers') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThePassengerList: PassengerList,
					onThePassengerObjectPage: PassengerObjectPage
                }
            },
            opaJourney.run
        );
    }
);