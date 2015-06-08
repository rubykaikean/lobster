# for more details see: http://emberjs.com/guides/models/defining-models/

Lobster.Product = DS.Model.extend
  name: DS.attr 'string'
  typeId: DS.attr 'number'
  description: DS.attr 'string'
  statusId: DS.attr 'number'
  phaseId: DS.attr 'number'
