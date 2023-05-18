namespace sap.ui.quotationmanagement;
using { managed } from '@sap/cds/common';

  entity Quotes : managed {
    key ID      : UUID  @(Core.Computed : true);
    status        : String(20);
    payfrq      : Association to PremiumFrequency; 
    paymethod : String (30);
    suminsured : Integer;
    duration : Integer;
    annpremium : Decimal;
    frqpremium : Decimal;
    startdate : Date;
    criticality : Integer;
    product        : Association to Products;
    phName       : String(40);
    phAddress       : String (60);
    phDOB     : Date;
    phAge     : Integer;
    phOccClass: String(40);
    phGender  : String(10);
    insName       : String(40);
    insAddress       : String (60);
    insDOB     : Date;
    insAge     : Integer;
    insOccClass: String(40);
    insGender  : String(10);
   // quotedetails : Association to many QuoteDetails on quotedetails.quote = $self;
    quotedetails : Composition of many QuoteDetails on quotedetails.quote = $self;
    
  }

  entity Products : managed {
    key ID       : UUID  @(Core.Computed : true);
    productcode  : String (10);
    productname        : String (40);
    validity     : String;
    quotes        : Association to many Quotes on quotes.product = $self;
  }

  entity Coverages : managed {
    key ID       : UUID  @(Core.Computed : true);
    coveragecode  : String (10);
    coveragename        : String (40);
    validity     : String;
    product        : Association to Products;
  }

entity QuoteDetails : managed {
    key ID      : UUID  @(Core.Computed : true);
    //quote : Association to Quotes;
    quote : Association to one Quotes;
    coverages : Association to Coverages;
    product : Association to Products;
    coveragecode  : String (10);
    coveragename        : String (40);
    startdate : Date;
    enddate : Date;
    insuredobject : String;
    suminsured : Integer;
    annpremium : Decimal;
    frqpremium : Decimal;
    criticality : Integer;
  }

    entity PremiumFrequency:managed{
    key ID  :  String;//UUID @(Core.Computed: true);
    Frequency   : String(20);
    //Frequency : Composition of  many Quotes on Frequency.payfrq= $self; //Association to many Quotes on freqDescr.payfrq = $self;
  }