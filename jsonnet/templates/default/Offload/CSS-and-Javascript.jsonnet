local papi = import '../../../papi.libsonnet';

{
  name: 'CSS and Javascript',
  comments: |||
    Overrides the default caching behavior for CSS and JavaScript objects that are 
    cached on the edge server. Because these object types are dynamic, the TTL is 
    brief.
  |||,
  criteria: [
    papi.criteria.fileExtension {
      values: ['css', "js"],
    },
  ],
  behaviors: [
    papi.behavior.caching {
      ttl: '7d',
    },
    papi.behavior.prefreshCache,
    papi.behavior.prefetchable,
  ],
}
