sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'com/fe/fpm/maintainpassengersfpm/test/integration/FirstJourney',
		'com/fe/fpm/maintainpassengersfpm/test/integration/pages/PassengerMain'
    ],
    function(JourneyRunner, opaJourney, PassengerMain) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('com/fe/fpm/maintainpassengersfpm') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThePassengerMain: PassengerMain
                }
            },
            opaJourney.run
        );
    }
);