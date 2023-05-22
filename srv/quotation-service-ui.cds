using QuotationService from './quotation-service';

annotate QuotationService.Quotes with {
	status       @title: 'Status';
	product         @title: 'Product';
	commissionname @title: 'Commission Partner Name';
    commission     @title: 'Commission ID';
	startdate       @title: 'Start Date';
	payfrq		    @title: 'Payment Frequency';
	paymethod		@title: 'Payment Method';
	suminsured		@title: 'Sum Insured';
	duration		@title: 'Cover Duration (years)';
	annpremium		@title: 'Annual Premium';
	frqpremium		@title: 'Payment Frequency Premium';
	phID			@title: 'Policy Owner ID';
	phName          @title: 'Policy Owner Name';
	phAddress       @title: 'Address';
	phDOB      		@title: 'Date of Birth';
    phAge      		@title: 'Age';
	phGender		@title : 'Gender';
	phOccClass      @title: 'Occupational Class';
	insID    		@title : 'Insured ID';
	insName			@title : 'Insured Name';
	insAddress		@title : 'Insured Address';
	insAge			@title : 'Age';
	insDOB			@title : 'Date of Birth';
	insGender		@title : 'Gender';
	insOccClass		@title :  'Occupation Class';
	quotetype      @title: 'Quote Type';
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

annotate ProductsMetadata.Products with {
	/*code @(
		UI.Hidden,
		Common: {
		Text: code
		}
	);*/
	code  @title: 'Product Code';
	Short  @title: 'Product Short';
	Large    @title: 'Product Large';
	
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

annotate QuotationService.QuoteTypes with {
    ID  @(
        UI.Hidden,
        Common: {
		Text: quoteName
		}
    );
    quoteCode @title: 'Quote Code';
    quoteName @title: 'Quote Name';
}

annotate QuotationService.GenderType with {
    ID             @(
        UI.Hidden,
        Common: {Text: genderName}
    );
    genderCode   @title: 'Gender Code';
    genderName @title: 'Gender Name';

}



annotate QuotationService.Commissions with {
    ID             @(
        UI.Hidden,
        Common: {Text: commissionName}
    );
    commissionID   @title: 'Commission Code';
    commissionName @title: 'Commission Name';

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
                Value : quotetype_ID,
            },
			/*Description : {
				$Type: 'UI.DataField',
				Value: product_ID
			}*/
		},
		HeaderFacets  : [
			{
			$Type : 'UI.ReferenceFacet',
			Target : '@UI.DataPoint#Status'
		}
		],
		LineItem: [
			{Value: phName},
			{Value: commission.commissionName},
			{Value: phAddress},
			{
				Value: status_code,
				Criticality: criticality
			},
			{Value: product_code},
			{Value: startdate}
		],
		Facets: [
			{
            $Type : 'UI.ReferenceFacet',Label : 'General Section',Target: '@UI.FieldGroup#GeneralSection'},
			{$Type: 'UI.ReferenceFacet', Label: 'Policy Owner Details', Target: '@UI.FieldGroup#PolicyOwnerDetails'},
			{$Type: 'UI.ReferenceFacet', Label: 'Insured Person Details', Target: '@UI.FieldGroup#InsuredPersonDetails'},
			{$Type: 'UI.ReferenceFacet', Label: 'Quote Details', Target: '@UI.FieldGroup#QuoteDetails'},
		/*	{$Type: 'UI.ReferenceFacet', Label: 'Product Details', Target: '@UI.FieldGroup#ProductDetails'},*/
			{$Type: 'UI.ReferenceFacet', Label: 'Coverage Details', Target: 'quotedetails/@UI.LineItem'}
		/*	{$Type: 'UI.ReferenceFacet', Label: 'Premium Details', Target: '@UI.FieldGroup#PremiumDetails', ![@UI.Hidden] :IsActiveEntity}*/
		],
		DataPoint#Status : {
			Value : status_code,
			Criticality : criticality
		},
		  FieldGroup #GeneralSection: {Data: [
        // {Value: commissionname},
        {Value: commission_ID},
        {Value: startdate},
        {Value: product_code},
        // {Value: policyterm},
        // {Value: premiumterm},
        {Value: commission.commissionName}


    ]},
		FieldGroup#PolicyOwnerDetails: {
            Data: [
				{Value: phID},
                {Value: phName},
                {Value: phDOB},
				{Value: phGender_ID},
                {Value: phAge},
                {Value: phAddress},
				{Value: phOccClass}				
            ]
        },
		FieldGroup#InsuredPersonDetails: {
            Data: [
				{Value: insID},
                {Value: insName},
                {Value: insDOB},
				{Value: insGender_ID},
                {Value: insAge},
                {Value: insAddress},
				{Value: insOccClass}				
            ]
        },
		FieldGroup#QuoteDetails: {
			Data: [
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
			ValueListWithFixedValues,
			//Text: product.Large, TextArrangement: #TextOnly,
			ValueList: {
				Label: 'Products',
				CollectionPath: 'Products',
				Parameters: [
					{ $Type: 'Common.ValueListParameterInOut',
						LocalDataProperty: product_code,
						ValueListProperty: 'code'
					},
					{ $Type: 'Common.ValueListParameterDisplayOnly',
						ValueListProperty: 'Short'
					},
					{ $Type: 'Common.ValueListParameterDisplayOnly',
						ValueListProperty: 'Large'
					}
				]
			}
		}
	);
	status @(
		Common : { Text : status.Name, TextArrangement : #TextOnly, }
	)
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
annotate QuotationService.Quotes with {
    commission @(Common: {
        //show name, not id for coverage in the context of quotedetails
        Text           : commission.commissionName,
        TextArrangement: #TextOnly,
        ValueList      : {
            Label         : 'Commissions',
            CollectionPath: 'Commissions',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: commission_ID,
                    ValueListProperty: 'ID'
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'commissionID'
                },
                {
                    $Type            : 'Common.ValueListParameterOut',
                    LocalDataProperty: commissionname,
                    ValueListProperty: 'commissionName'
                }
            ]
        }
    });
}
annotate QuotationService.Quotes with {
    insGender @(Common: {
        //show name, not id for coverage in the context of quotedetails
        Text           : insGender.genderName,
        TextArrangement: #TextOnly,
        ValueList      : {
            Label         : 'GenderType',
            CollectionPath: 'GenderType',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: insGender_ID,
                    ValueListProperty: 'ID'
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'genderCode'
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'genderName'
                }
            ]
        }
    });
}
annotate QuotationService.Quotes with {
    phGender @(Common: {
        //show name, not id for coverage in the context of quotedetails
        Text           : phGender.genderName,
        TextArrangement: #TextOnly,
        ValueList      : {
            Label         : 'GenderType',
            CollectionPath: 'GenderType',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: phGender_ID,
                    ValueListProperty: 'ID'
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'genderCode'
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'genderName'
                }
            ]
        }
    });
}
annotate QuotationService.Quotes with {
    quotetype @(Common: {
        //show name, not id for coverage in the context of quotedetails
        Text           : quotetype.quoteName,
        TextArrangement: #TextOnly,
        ValueList      : {
            Label         : 'QuoteTypes',
            CollectionPath: 'QuoteTypes',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: quotetype_ID,
                    ValueListProperty: 'ID'
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'quoteCode'
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'quoteName'
                }
            ]
        }
    });
}