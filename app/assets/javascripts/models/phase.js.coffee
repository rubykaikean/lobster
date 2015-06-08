# for more details see: http://emberjs.com/guides/models/defining-models/

Lobster.Phase = DS.Model.extend
  name: DS.attr 'string'
  description: DS.attr 'string'
  statusId: DS.attr 'number'
  projectId: DS.attr 'number'
