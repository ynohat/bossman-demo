local papi = import 'papi.libsonnet';
papi.rule {
  name: 'Uncacheable Responses',
  comments: |||
    Overrides the default downstream caching behavior for uncacheable object
    types.  Instructs the edge server to pass Cache-Control and/or Expire
    headers from the origin to the client.  src:
    templates/www/rules/Offload/Uncacheable-Responses.jsonnet
  |||,
  criteria: [
    papi.criteria.cacheability {
      matchOperator: 'IS_NOT',
      value: 'CACHEABLE',
    },
  ],
  behaviors: [
    papi.behaviors.downstreamCache {
      allowBehavior: 'LESSER',
      behavior: 'TUNNEL_ORIGIN',
      sendHeaders: 'CACHE_CONTROL_AND_EXPIRES',
      sendPrivate: false,
    },
  ],
}
