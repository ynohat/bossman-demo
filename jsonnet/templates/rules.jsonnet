local papi = import '../papi.libsonnet';

{
  productId: papi.productId,
  ruleFormat: papi.ruleFormat,
  variables: import './variables.jsonnet',
  rules: import './default.jsonnet'
}
