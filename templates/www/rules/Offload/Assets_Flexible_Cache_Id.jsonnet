local papi = import 'papi.libsonnet';
papi.rule {
  name: 'Assets Flexible Cache Id',
  comments: |||
    Include query string parameters abc in cache id.  src:
    templates/www/rules/Offload/Assets-Flex-CacheId.jsonnet
  |||,
  criteria: [
    papi.criteria.path {
      matchCaseSensitive: false,
      matchOperator: 'MATCHES_ONE_OF',
      values: [
        '/assets/*',
      ],
    },
  ],
  behaviors: [
    papi.behaviors.cacheId {
      elements: [
        'abc',
      ],
      includeValue: true,
      optional: true,
      rule: 'INCLUDE_QUERY_PARAMS',
    },
  ],
}
