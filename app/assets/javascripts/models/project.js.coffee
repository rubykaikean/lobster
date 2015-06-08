# for more details see: http://emberjs.com/guides/models/defining-models/

Lobster.Project = DS.Model.extend
  name: DS.attr 'string'
  description: DS.attr 'string'
  statusId: DS.attr 'number'
  companyId: DS.attr 'number'
