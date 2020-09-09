local papi = import '../../papi.libsonnet';

{
  name: 'Offload',
  comments: |||
    Controls caching, which offloads traffic away from the origin. Most objects 
    types are not cached.
    However, the child rules override this behavior for certain subsets of requests.
  |||,
  behaviors: [
    papi.behavior.caching {
      behavior: 'NO_STORE',
    },
    papi.behavior.cacheError,
    papi.behavior.downstreamCache,
    papi.behavior.tieredDistribution,
  ],
  children: [
    import 'Offload/CSS-and-Javascript.jsonnet',
    import 'Offload/Static-objects.jsonnet',
    import 'Offload/Uncacheable-Responses.jsonnet',
  ],
}
