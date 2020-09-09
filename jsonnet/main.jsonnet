local rules = import "./templates/rules.jsonnet";

{
  // INTEGRATION

  "akamai/property/integration/rules.json": rules {
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

  "akamai/property/qa/rules.json": rules {
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

}