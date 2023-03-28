sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'qm.quotation',
            componentId: 'QuotesObjectPage',
            entitySet: 'Quotes'
        },
        CustomPageDefinitions
    );
});