# for more details see: http://emberjs.com/guides/models/defining-models/

Lobster.ProductType = DS.Model.extend
  name: DS.attr 'string'
  description: DS.attr 'string'
  productId: DS.attr 'number'
