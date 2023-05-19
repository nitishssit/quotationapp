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
  entity Commissions as projection on my.Commissions;
  entity QuoteTypes as projection on my.QuoteTypes;
  entity Status as projection on my.Status;
  entity GenderType as projection on my.GenderType;
  
}
