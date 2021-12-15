local papi = import 'papi.libsonnet';
papi.rule {
  name: 'CSS and Javascript',
  comments: |||
    Overrides the default caching behavior for CSS and JavaScript objects that
    are  cached on the edge server. Because these object types are dynamic, the
    TTL is  brief.  src: templates/www/rules/Offload/CSS-and-Javascript.jsonnet
  |||,
  criteria: [
    papi.criteria.fileExtension {
      matchCaseSensitive: false,
      matchOperator: 'IS_ONE_OF',
      values: [
        'css',
        'js',
        'jsx',
      ],
    },
  ],
  behaviors: [
    papi.behaviors.caching {
      behavior: 'MAX_AGE',
      mustRevalidate: false,
      ttl: '30d',
    },
    papi.behaviors.prefreshCache {
      enabled: true,
      prefreshval: 80,
    },
    papi.behaviors.prefetchable {
      enabled: true,
    },
  ],
}
