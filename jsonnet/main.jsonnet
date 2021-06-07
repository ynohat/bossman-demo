local rules = import './templates/rules.jsonnet';

local template = {
  contractId: 'C-1ED34DY',
  groupId: '177012',
} + rules;

{
  // DEV1

  'akamai/property/dev1/rules.json': template {
    rules+: {
      originHostname:: 'httpbin.org',
      cpCode:: 585898,
    },
  },

  'akamai/property/dev1/hostnames.json': [
    {
      cnameFrom: 'dev1.acme.net',
      cnameTo: 'ak.hogg.fr.edgekey.net',
      cnameType: 'EDGE_HOSTNAME',
    },
  ],

  // DEV2

  'akamai/property/dev2/rules.json': template {
    rules+: {
      originHostname:: 'httpbin.org',
      cpCode:: 585898,
    },
  },

  'akamai/property/dev2/hostnames.json': [
    {
      cnameFrom: 'dev2.acme.net',
      cnameTo: 'ak.hogg.fr.edgekey.net',
      cnameType: 'EDGE_HOSTNAME',
    },
  ],

  // DEV3

  'akamai/property/dev3/rules.json': template {
    rules+: {
      originHostname:: 'httpbin.org',
      cpCode:: 585898,
    },
  },

  'akamai/property/dev3/hostnames.json': [
    {
      cnameFrom: 'dev3.acme.net',
      cnameTo: 'ak.hogg.fr.edgekey.net',
      cnameType: 'EDGE_HOSTNAME',
    },
  ],

  // INTEGRATION

  'akamai/property/integration/rules.json': template {
    rules+: {
      originHostname:: 'httpbin.org',
      cpCode:: 585898,
    },
  },

  'akamai/property/integration/hostnames.json': [
    {
      cnameFrom: 'integration.acme.net',
      cnameTo: 'ak.hogg.fr.edgekey.net',
      cnameType: 'EDGE_HOSTNAME',
    },
  ],

  // PROD

  'akamai/property/prod/rules.json': template {
    rules+: {
      originHostname:: 'httpbin.org',
      cpCode:: 585898,
    },
  },

  'akamai/property/prod/hostnames.json': [
    {
      cnameFrom: 'www.acme.com',
      cnameTo: 'ak.hogg.fr.edgekey.net',
      cnameType: 'EDGE_HOSTNAME',
    },
  ],
}
