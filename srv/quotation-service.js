const cds = require('@sap/cds')
/**
 * Implementation for Quotation Management service defined in ./quotation-service.cds
 */
module.exports = cds.service.impl(async function() {
    /*
    * Implementation of this service to trigger afer reating quotation to set the
    * criticality of the quote based on quote status.
    */
    this.after('READ', 'Quotes', quotesData => {
        const quotes = Array.isArray(quotesData) ? quotesData : [quotesData];
        quotes.forEach(quote => {
            if (quote.status == "Approved") {
                quote.criticality = 3;
            } else {
                quote.criticality = 2;
            }
        });
    })
    /*
     * Implementation of this service to trigger while creating quotation to generate the age value 
     * based on Policy Begin Date and Date of Birth.
    */
    this.before('CREATE','Quotes', req => {
       const birthDate = req.data.insuredDob
       const policyBeginDate  = req.data.startdate
       console.log("**********"+birthDate)
       console.log("**********"+policyBeginDate)
       const year_difference = new Date(policyBeginDate).getFullYear() - new Date(birthDate).getFullYear()
       req.data.insuredAge = year_difference       
       console.log("**********...calculatedAge.........."+year_difference)
     })
});