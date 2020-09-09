local env = std.extVar('env');

{
  ["akamai/property/%s/rules.json" % env.propertyName]: import './www/rules.jsonnet',
  ["akamai/property/%s/hostnames.json" % env.propertyName]: import './www/hostnames.jsonnet',
  ["akamai/property/%s/tests.json" % env.propertyName]: import './www/tests.jsonnet',
}
