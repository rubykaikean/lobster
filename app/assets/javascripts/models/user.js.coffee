# for more details see: http://emberjs.com/guides/models/defining-models/

Lobster.User = DS.Model.extend
  fullName: DS.attr 'string'
  nickName: DS.attr 'string'
  typeId: DS.attr 'number'
  companyId: DS.attr 'number'
  slug: DS.attr 'string'
