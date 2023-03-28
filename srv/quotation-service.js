
const cds = require('@sap/cds')

/**
 * Implementation for Quotation Management service defined in ./quotation-service.cds
 */
module.exports = cds.service.impl(async function() {
    this.after('READ', 'Quotes', quotesData => {
        const quotes = Array.isArray(quotesData) ? quotesData : [quotesData];
        quotes.forEach(quote => {
            if (quote.status == "Approved") {
                quote.criticality = 3;
            } else {
                quote.criticality = 2;
            }
        });
    });
});