local papi = import 'papi.libsonnet';

papi.rule {
  name: "Assets Flexible Cache Id",
  comments: |||
    Include query string parameters abc in cache id.

    src: %s
  ||| % (std.thisFile),
  criteria: [
    papi.criteria.path {
      values: ["/assets/*"],
    },
  ],
  behaviors: [
    papi.behaviors.cacheId {
      rule: "INCLUDE_QUERY_PARAMS",
      includeValue: true,
      optional: true,
      elements: ["abc"]
    },
  ],
}