local papi = import 'papi.libsonnet';

papi.rule {
  name: 'Offload',
  comments: |||
    Controls caching, which offloads traffic away from the origin. Most objects 
    types are not cached.
    However, the child rules override this behavior for certain subsets of requests.
    
    src: %s
  ||| % (std.thisFile),
  behaviors: [
    papi.behaviors.caching {
      behavior: 'NO_STORE',
      honorMustrevalidateEnabled: null,
      honorPrivateEnabled: null,
      mustRevalidate: null,
    },
    papi.behaviors.cacheError {
      ttl: "73s"
    },
    papi.behaviors.downstreamCache {
      behavior: "MUST_REVALIDATE"
    },
    papi.behaviors.tieredDistribution,
  ],
  children: [
    import 'Offload/Demandware-Static.jsonnet',
    import 'Offload/CSS-and-Javascript.jsonnet',
    import 'Offload/Static-objects.jsonnet',
    import 'Offload/Uncacheable-Responses.jsonnet',
    import 'Offload/Assets-Flex-CacheId.jsonnet',
  ],
}
