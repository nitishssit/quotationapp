using {sap.ui.quotationmanagement as my} from '../db/schema';

@path: 'service/quote'
service QuotationService {
  entity Quotes as projection on my.Quotes;
    annotate Quotes with @odata.draft.enabled;
  entity Products as projection on my.Products;
    annotate Products with @odata.draft.enabled;
  entity Coverages as projection on my.Coverages;
    annotate Coverages with @odata.draft.enabled;
  entity QuoteDetails as projection on my.QuoteDetails;
  entity PremiumFrequency as projection on my.PremiumFrequency;
       annotate PremiumFrequency with @odata.draft.enabled;

    
}
