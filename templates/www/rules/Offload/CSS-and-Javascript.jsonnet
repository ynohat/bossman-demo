local papi = import 'papi.libsonnet';

papi.rule {
  name: 'CSS and Javascript',
  comments: |||
    Overrides the default caching behavior for CSS and JavaScript objects that are 
    cached on the edge server. Because these object types are dynamic, the TTL is 
    brief.
    
    src: %s
  ||| % (std.thisFile),
  criteria: [
    papi.criteria.fileExtension {
      values: ['css', "js", "jsx"],
    },
  ],
  behaviors: [
    papi.behavior.caching {
      honorMustrevalidateEnabled: null,
      honorPrivateEnabled: null,
      ttl: '30d',
    },
    papi.behavior.prefreshCache {
      prefreshval: 80
    },
    papi.behavior.prefetchable,
  ],
}
