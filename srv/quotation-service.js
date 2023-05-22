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
            if(quote.status){ 
                if (quote.status.code==3 ) {
                quote.criticality = 3;
            } else {
                quote.criticality = 2;
            }}           
        
        else{
            if (quote.status_code==3 ) {
                quote.criticality = 3;
            } else {
                quote.criticality = 2;
            }
        }
        });
    })
    /*
     * Implementation of this service to trigger while creating quotation to generate the age value 
     * based on Policy Begin Date and Date of Birth.
    */
    this.before('CREATE','Quotes', req => {
       const birthDate = req.data.phDOB
       const policyBeginDate  = req.data.startdate
       console.log("**********"+birthDate)
       console.log("**********"+policyBeginDate)
       const year_difference = new Date(policyBeginDate).getFullYear() - new Date(birthDate).getFullYear()
       req.data.phAge = year_difference       
       console.log("**********...calculatedAge.........."+year_difference)
     })
     this.before('UPDATE','Quotes', req => {
        const birthDate = req.data.phDOB
        const policyBeginDate  = req.data.startdate
        console.log("**********"+birthDate)
        console.log("**********"+policyBeginDate)
        const year_difference = new Date(policyBeginDate).getFullYear() - new Date(birthDate).getFullYear()
        req.data.phAge = year_difference       
        console.log("**********...calculatedAge.........."+year_difference)
      })
    
     /*
     * Implementation of this service to trigger while creating quotation to generate the age value 
     * of Insured Person based on Policy Begin Date and Date of Birth.
    */
    this.before('CREATE','Quotes', req => {
        const birthDate = req.data.insDOB
        const policyBeginDate  = req.data.startdate
        console.log("**********"+birthDate)
        console.log("**********"+policyBeginDate)
        const year_difference = new Date(policyBeginDate).getFullYear() - new Date(birthDate).getFullYear()
        req.data.insAge = year_difference       
        console.log("**********...calculatedAge.........."+year_difference)
      })
      this.before('UPDATE','Quotes', req => {
        const birthDate = req.data.insDOB
        const policyBeginDate  = req.data.startdate
        console.log("**********"+birthDate)
        console.log("**********"+policyBeginDate)
        const year_difference = new Date(policyBeginDate).getFullYear() - new Date(birthDate).getFullYear()
        req.data.insAge = year_difference       
        console.log("**********...calculatedAge.........."+year_difference)
      })
      this.before('NEW','Quotes', async req=>{ 
      
        req.data.status_code=1;
     // var query=  UPDATE.entity `Quotes` .set `status_code = 1`;
      //var query2= await cds.update(Quotes, req.data.ID).set({status_code:1});
        // await cds.transaction(req).run(query2);
 
 
         // cds.transaction(req).run(`UPDATE ${"QuotationService.Quotes.drafts"} SET
         // status_code=1`)
        //var query= UPDATE `QuotationService.Quotes.drafts` .set `status_code = 1` .where `ID=${req.data.ID}`
 
         //cds.transaction(req).run(query);
 
         
         //return next();
     })
      this.before('CREATE','Quotes',async req=>{
         req.data.status_code=2;
     });
	const prod = await cds.connect.to('ProductsMetadata');
        this.on('READ', 'Products', async () => {                
        return await prod.run(SELECT.from("Products").where({TariffVers: "01"}));       
    })   
});