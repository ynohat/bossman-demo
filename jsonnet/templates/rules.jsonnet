local papi = import '../papi.libsonnet';

{
  productId: papi.productId,
  ruleFormat: papi.ruleFormat,
  rules: import './default.jsonnet'
}
