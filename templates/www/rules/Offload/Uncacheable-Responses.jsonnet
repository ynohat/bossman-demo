local papi = import 'papi.libsonnet';

papi.rule {
  name: 'Uncacheable Responses',
  comments: |||
    Overrides the default downstream caching behavior for uncacheable object types. 
    Instructs the edge server to pass Cache-Control and/or Expire headers from the
    origin to the client.
    
    src: %s
  ||| % (std.thisFile),
  criteria: [
    papi.criteria.cacheability {
      matchOperator: 'IS_NOT',
    },
  ],
  behaviors: [
    papi.behavior.downstreamCache {
      behavior: 'TUNNEL_ORIGIN',
    },
  ],
}
