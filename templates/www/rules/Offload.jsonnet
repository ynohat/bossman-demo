local papi = import 'papi.libsonnet';
papi.rule {
  name: 'Offload',
  comments: |||
    Controls caching, which offloads traffic away from the origin. Most objects
    types are not cached. However, the child rules override this behavior for
    certain subsets of requests.  src: templates/www/rules/Offload.jsonnet
  |||,
  behaviors: [
    papi.behaviors.caching {
      behavior: 'NO_STORE',
    },
    papi.behaviors.cacheError {
      enabled: true,
      preserveStale: true,
      ttl: '74s',
    },
    papi.behaviors.downstreamCache {
      allowBehavior: 'LESSER',
      behavior: 'MUST_REVALIDATE',
      sendHeaders: 'CACHE_CONTROL_AND_EXPIRES',
      sendPrivate: false,
    },
    papi.behaviors.tieredDistribution {
      enabled: true,
      tieredDistributionMap: 'CH2',
    },
  ],
  children: [
    import 'Offload/Demandware_Static.jsonnet',
    import 'Offload/CSS_and_Javascript.jsonnet',
    import 'Offload/Static_objects.jsonnet',
    import 'Offload/Uncacheable_Responses.jsonnet',
    import 'Offload/Assets_Flexible_Cache_Id.jsonnet',
  ],
}
