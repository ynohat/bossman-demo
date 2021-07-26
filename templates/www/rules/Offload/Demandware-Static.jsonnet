local papi = import 'papi.libsonnet';

papi.rule {
  name: "Demandware Static",
  comments: |||
    eCDN returns an Age header to ensure a correct downstream TTL.

    The best option is to use "Honor Origin Cache Control" for content with
    a path matching demandware.static, and send the lowest of remaining ttl
    or origin cache control max-age downstream.

    src: %s
  ||| % (std.thisFile),
  criteria: [
    papi.criteria.path {
      values: ["*/on/demandware.static/*"],
    },
  ],
  behaviors: [
    papi.behavior.caching {
      behavior: "CACHE_CONTROL",
      mustRevalidate: false,
      honorPrivateEnabled: true,
      honorMustrevalidateEnabled: true,
      defaultMaxage: '7d',
    },
    papi.behavior.downstreamCache {
      behavior: 'ALLOW',
      allowBehavior: 'LESSER',
      sendHeaders: 'CACHE_CONTROL_AND_EXPIRES',
    },
  ],
}