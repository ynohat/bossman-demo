local papi = import 'papi.libsonnet';
papi.rule {
  name: 'Demandware Static',
  comments: |||
    eCDN returns an Age header to ensure a correct downstream TTL.  The best
    option is to use "Honor Origin Cache Control" for content with a path
    matching demandware.static, and send the lowest of remaining ttl or origin
    cache control max-age downstream.  src:
    templates/www/rules/Offload/Demandware-Static.jsonnet
  |||,
  criteria: [
    papi.criteria.path {
      matchCaseSensitive: false,
      matchOperator: 'MATCHES_ONE_OF',
      values: [
        '*/on/demandware.static/*',
      ],
    },
  ],
  behaviors: [
    papi.behaviors.caching {
      behavior: 'CACHE_CONTROL',
      defaultTtl: '7d',
      honorMustrevalidateEnabled: true,
      honorPrivateEnabled: true,
      mustRevalidate: false,
    },
    papi.behaviors.downstreamCache {
      allowBehavior: 'LESSER',
      behavior: 'ALLOW',
      sendHeaders: 'CACHE_CONTROL_AND_EXPIRES',
      sendPrivate: false,
    },
  ],
}
