local test = import 'github.com/akamai-contrib/postman-jsonnet/akamai.libsonnet';
local env = std.extVar('env');

test.suite {
  name: 'www tests for [%s]' % env.name,

  vars: env,

  item: [
    test.case {
      name: 'Origin and cache settings',

      request: test.GET('http://{{hostname}}') +
        test.pragma.getCacheKey,

      tests: [
        test.assertHeaderMatches('Cache key matches %s' % env.origin, 'x-cache-key', '/%s/' % env.origin),
      ]
    }
  ]
}