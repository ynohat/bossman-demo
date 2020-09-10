local rules = import "./templates/rules.jsonnet";

local template = {
  contractId: "C-1ED34DY",
  groupId: "177012"
} + rules;

{
  // DEV1

  "akamai/property/dev1/rules.json": template {
    rules+: {
      originHostname:: "dev1.o.acme.net",
      cpCode:: 585898
    },
  },

  "akamai/property/dev1/hostnames.json": [
    {
        "cnameFrom": "dev1.acme.net",
        "cnameTo": "ak.hogg.fr.edgekey.net",
        "cnameType": "EDGE_HOSTNAME"
    }
  ],

  // DEV2

  "akamai/property/dev2/rules.json": template {
    rules+: {
      originHostname:: "dev2.o.acme.net",
      cpCode:: 585898
    },
  },

  "akamai/property/dev2/hostnames.json": [
    {
        "cnameFrom": "dev2.acme.net",
        "cnameTo": "ak.hogg.fr.edgekey.net",
        "cnameType": "EDGE_HOSTNAME"
    }
  ],

  // DEV3

  "akamai/property/dev3/rules.json": template {
    rules+: {
      originHostname:: "dev3.o.acme.net",
      cpCode:: 585898
    },
  },

  "akamai/property/dev3/hostnames.json": [
    {
        "cnameFrom": "dev3.acme.net",
        "cnameTo": "ak.hogg.fr.edgekey.net",
        "cnameType": "EDGE_HOSTNAME"
    }
  ],

  // DEV4

  "akamai/property/dev4/rules.json": template {
    rules+: {
      originHostname:: "dev4.o.acme.net",
      cpCode:: 585898
    },
  },

  "akamai/property/dev4/hostnames.json": [
    {
        "cnameFrom": "dev4.acme.net",
        "cnameTo": "ak.hogg.fr.edgekey.net",
        "cnameType": "EDGE_HOSTNAME"
    }
  ],

  // DEV5

  "akamai/property/dev5/rules.json": template {
    rules+: {
      originHostname:: "dev5.o.acme.net",
      cpCode:: 585898
    },
  },

  "akamai/property/dev5/hostnames.json": [
    {
        "cnameFrom": "dev5.acme.net",
        "cnameTo": "ak.hogg.fr.edgekey.net",
        "cnameType": "EDGE_HOSTNAME"
    }
  ],

  // INTEGRATION

  "akamai/property/integration/rules.json": template {
    rules+: {
      originHostname:: "integration.o.acme.net",
      cpCode:: 585898
    },
  },

  "akamai/property/integration/hostnames.json": [
    {
        "cnameFrom": "integration.acme.net",
        "cnameTo": "ak.hogg.fr.edgekey.net",
        "cnameType": "EDGE_HOSTNAME"
    }
  ],

  // QA

  "akamai/property/qa/rules.json": template {
    rules+: {
      originHostname:: "qa.o.acme.net",
      cpCode:: 585898
    },
  },

  "akamai/property/qa/hostnames.json": [
    {
        "cnameFrom": "qa.acme.net",
        "cnameTo": "ak.hogg.fr.edgekey.net",
        "cnameType": "EDGE_HOSTNAME"
    }
  ],

  // PROD

  "akamai/property/prod/rules.json": template {
    rules+: {
      originHostname:: "prod.o.acme.net",
      cpCode:: 585898
    },
  },

  "akamai/property/prod/hostnames.json": [
    {
        "cnameFrom": "www.acme.com",
        "cnameTo": "ak.hogg.fr.edgekey.net",
        "cnameType": "EDGE_HOSTNAME"
    }
  ],
}
