/* checksum : dffe28844a63cafde7c8785cf205123f */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx'
service ProductsMetadata {};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Contract: Basic View on Texts (PRODUKC)'
entity ProductsMetadata.Products {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Product'
  @sap.quickinfo : 'Product Code'
  key code : String(5) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tariff Version'
  @sap.quickinfo : 'Product Tariff Version'
  key TariffVers : String(10) not null;
  @sap.label : 'Product Code - Short Text'
  @sap.quickinfo : 'Product Specification'
  Short : String(15);
  @sap.label : 'Product Code - Long Text'
  @sap.quickinfo : 'Product Specification'
  Large : String(50);
};