namespace sap.ui.quotationmanagement;
using { managed } from '@sap/cds/common';

  entity Quotes : managed {
    key ID      : UUID  @(Core.Computed : true);
    commissionname         : String(40) @readonly; 
    payfrq      : Association to PremiumFrequency; 
    paymethod : String (30);
    suminsured : Integer;
    duration : Integer;
    annpremium : Decimal;
    frqpremium : Decimal;
    startdate : Date;
    criticality : Integer;
    product        : Association to Products;
    phID         : String(40); 
    phName       : String(40);
    phAddress       : String (60);
    phDOB     : Date;
    phAge     : Integer; @readonly
    phOccClass: String(40);
    phGender  : String(10);
    insID     : String(40);
    insName       : String(40);
    insAddress       : String (60);
    insDOB     : Date;
    insAge     : Integer; @readonly
    insOccClass: String(40);
    insGender  : String(10);
    quotedetails : Composition of many QuoteDetails on quotedetails.quote = $self;
    quotetype : Association to QuoteTypes;
    commission : Association to Commissions;
    status:Association to Status @readonly;// @Common : { Text : status.code,TextArrangement : #TextOnly};
  
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
entity Commissions : managed {
    key ID       : UUID ;
    commissionID  : String (10);
    commissionName        : String (40);
    quotes        : Association to Quotes ;
  }
  entity QuoteTypes : managed {
    key ID       : UUID ;
    quoteCode    : String (10);
    quoteName    : String (40);
    quotes       : Association to Quotes ;
  }
   entity Status{
    // key ID:UUID;
   key code:Integer @Common : { Text : Name,TextArrangement : #TextOnly};
    Name:String(100);
    //quote:Association to one Quotes on quote.status=$self;
  }
  entity GenderType : managed {
    key ID       : UUID ;
    genderCode   : String (10);
    genderName   : String (40);
    quotes       : Association to Quotes ;
  }