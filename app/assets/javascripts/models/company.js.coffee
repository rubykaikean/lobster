# for more details see: http://emberjs.com/guides/models/defining-models/

Lobster.Company = DS.Model.extend
  name: DS.attr 'string'
  registrationNumber: DS.attr 'string'
  address: DS.attr 'string'
  phoneNumber: DS.attr 'string'
  faxNumber: DS.attr 'string'
