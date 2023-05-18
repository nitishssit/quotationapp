using QuotationService from './quotation-service';

annotate QuotationService.Quotes with {
	status          @title: 'Status';
	product         @title: 'Product';
	startdate       @title: 'Start Date';
	payfrq		    @title: 'Payment Frequency';
	paymethod		@title: 'Payment Method';
	suminsured		@title: 'Sum Insured';
	duration		@title: 'Cover Duration (years)';
	annpremium		@title: 'Annual Premium';
	frqpremium		@title: 'Payment Frequency Premium';
	phName          @title: 'Policyholder Name';
	phAddress       @title: 'Policyholder Address';
	phDOB      		@title: 'Date of birth';
    phAge      		@title: 'Age';
	phGender		@title : 'Gender';
	phOccClass      @title: 'Occupational Class';
	insName			@title : 'Insured Person Name';
	insAddress		@title : 'Insured Person Address';
	insAge			@title : 'Age';
	insDOB			@title : 'Date of birth';
	insGender		@title : 'Gender';
	insOccClass		@title :  'Occupation Class';
}
annotate QuotationService.QuoteDetails with {
	ID @(
		UI.Hidden,
		Common: {
		Text: coveragename
		}
	);
	coveragecode  @title: 'Coverage Code';
	coveragename  @title: 'Coverage Name';
	startdate     @title: 'Start Date';
	enddate       @title: 'End Date';
	insuredobject @title : 'Insured';
	suminsured	  @title: 'Sum Insured';
	annpremium	  @title: 'Annual Premium';
	frqpremium	  @title: 'Payment Frequency Premium';
	coverages  	  @title: 'Coverage';
	product  	  @title: 'Product';
}

annotate QuotationService.Products with {
	ID @(
		UI.Hidden,
		Common: {
		Text: productname
		}
	);
	productcode  @title: 'Product Code';
	productname  @title: 'Product Name';
	validity     @title: 'Validity';
	quotes       @title: 'Quotes';
}

annotate QuotationService.Coverages with {
	ID @(
		UI.Hidden,
		Common: {
		Text: coveragename
		}
	);
	coveragecode  @title: 'Coverage Code';
	coveragename  @title: 'Coverage Name';
	validity     @title: 'Validity';
	product       @title: 'Product';
}

annotate QuotationService.PremiumFrequency with {
    
    Frequency @title : 'Payment Frequency';

}

annotate QuotationService.Quotes with @(
	UI: {
		HeaderInfo: {
			TypeName: 'Quote',
			TypeNamePlural: 'Quotes',
			Title          : {
                $Type : 'UI.DataField',
                Value : phName
            },
			Description : {
				$Type: 'UI.DataField',
				Value: product_ID
			}
		},
		HeaderFacets  : [
			{
			$Type : 'UI.ReferenceFacet',
			Target : '@UI.DataPoint#Status'
		}
		],
		LineItem: [
			{Value: phName},
			{Value: phAddress},
			{
				Value: status,
				Criticality: criticality
			},
			{Value: product_ID},
			{Value: startdate}
		],
		Facets: [
			{$Type: 'UI.ReferenceFacet', Label: 'Policy Owner Details', Target: '@UI.FieldGroup#PolicyOwnerDetails'},
			{$Type: 'UI.ReferenceFacet', Label: 'Insured Person Details', Target: '@UI.FieldGroup#InsuredPersonDetails'},
			{$Type: 'UI.ReferenceFacet', Label: 'Quote Details', Target: '@UI.FieldGroup#QuoteDetails'},
		/*	{$Type: 'UI.ReferenceFacet', Label: 'Product Details', Target: '@UI.FieldGroup#ProductDetails'},*/
			{$Type: 'UI.ReferenceFacet', Label: 'Coverage Details', Target: 'quotedetails/@UI.LineItem'}
		/*	{$Type: 'UI.ReferenceFacet', Label: 'Premium Details', Target: '@UI.FieldGroup#PremiumDetails', ![@UI.Hidden] :IsActiveEntity}*/
		],
		DataPoint#Status : {
			Value : status,
			//Label : 'Status',
			Criticality : criticality
		},
		FieldGroup#PolicyOwnerDetails: {
            Data: [
                {Value: phName},
                {Value: phDOB},
				{Value: phGender},
                {Value: phAge},
                {Value: phAddress},
				{Value: phOccClass}				
            ]
        },
		FieldGroup#InsuredPersonDetails: {
            Data: [
                {Value: insName},
                {Value: insDOB},
				{Value: insGender},
                {Value: insAge},
                {Value: insAddress},
				{Value: insOccClass}				
            ]
        },
		FieldGroup#QuoteDetails: {
			Data: [
				{Value: startdate},
				{Value: duration},
				{Value: payfrq_ID},
				{Value: paymethod},
				{Value: suminsured},
				{Value: annpremium},
				{Value: frqpremium}
				
			]
		},
		FieldGroup#ProductDetails: {
			Data: [
				{Value: suminsured},
				{Value: annpremium},
				{Value: frqpremium}
			]
		},
		FieldGroup#PremiumDetails: {
			Data: [
				{Value: phAddress},
				{Value: payfrq_ID},
				{Value: paymethod},
				{Value: suminsured},
				{Value: duration},
				{Value: annpremium},
				{Value: frqpremium}
			]
		}
	},
) {

};

annotate QuotationService.QuoteDetails with @(
	UI: {
		LineItem  : [
			{Value: coverages_ID},
			{Value: startdate},
			{Value: enddate},
			{Value: insuredobject},
			{Value: suminsured},
			{Value: annpremium},
			{Value: frqpremium},
		],
		Facets: [
			{$Type:'UI.ReferenceFacet', Label: 'Coverage Details', Target: '@UI.FieldGroup#CoverageDetails'}
		],
		FieldGroup#CoverageDetails: {
			Data: [
				{Value: coverages_ID},
				//{Value: coveragename},
				{Value: startdate},
				{Value: enddate},
				{Value: insuredobject},
				{Value: suminsured},
				{Value: annpremium},
				{Value: frqpremium}
			]
		}
	}
);

annotate QuotationService.Quotes with {
	product @(
		Common: {
			//show name, not id for product in the context of quotes
			Text: product.productname  , TextArrangement: #TextOnly,
			ValueList: {
				Label: 'Products',
				CollectionPath: 'Products',
				Parameters: [
					{ $Type: 'Common.ValueListParameterInOut',
						LocalDataProperty: product_ID,
						ValueListProperty: 'ID'
					},
					{ $Type: 'Common.ValueListParameterDisplayOnly',
						ValueListProperty: 'productcode'
					},
					{ $Type: 'Common.ValueListParameterDisplayOnly',
						ValueListProperty: 'productname'
					}
				]
			}
		}
	);
}

annotate QuotationService.QuoteDetails with {
	coverages @(
		Common: {
			//show name, not id for coverage in the context of quotedetails
			Text: coverages.coveragename  , TextArrangement: #TextOnly,
			ValueList: {
				Label: 'Coverages',
				CollectionPath: 'Coverages',
				Parameters: [
					{ $Type: 'Common.ValueListParameterInOut',
						LocalDataProperty: coverages_ID,
						ValueListProperty: 'ID'
					},
					{ $Type: 'Common.ValueListParameterDisplayOnly',
						ValueListProperty: 'coveragecode'
					},
					{ $Type: 'Common.ValueListParameterDisplayOnly',
						ValueListProperty: 'coveragename'
					}
				]
			}
		}
	);
}

//Frequency Help drop down changes - BEGIN
annotate QuotationService.Quotes with {
    payfrq @(Common: {
        //show name, not id for coverage in the context of quotedetails
        Text           : payfrq.Frequency,
        TextArrangement: #TextOnly,
        ValueList      : {
            Label         : 'Frequency',
            CollectionPath: 'PremiumFrequency',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: payfrq_ID,
                    ValueListProperty: 'ID'
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'Frequency'
                }
            ]
        }
    });
}
//Frequency Help drop down changes - END