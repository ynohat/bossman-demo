local mkDocs = import '../lib/mkDocs.libsonnet';
local env = std.extVar('env');

local rules = import './www/rules.jsonnet';
local hostnames = import './www/hostnames.jsonnet';

{
  ["akamai/property/%s/docs.md" % env.propertyName]: mkDocs.fromProperty(env.propertyName, rules, hostnames),
}
