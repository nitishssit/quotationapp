sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'qm/quotation/test/integration/FirstJourney',
		'qm/quotation/test/integration/pages/QuotesList',
		'qm/quotation/test/integration/pages/QuotesObjectPage'
    ],
    function(JourneyRunner, opaJourney, QuotesList, QuotesObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('qm/quotation') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheQuotesList: QuotesList,
					onTheQuotesObjectPage: QuotesObjectPage
                }
            },
            opaJourney.run
        );
    }
);