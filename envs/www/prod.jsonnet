
local globals = std.extVar('globals');

(import '.defaults.jsonnet') {
  name: 'prod',
  hostname: 'www.%s' % globals.zone,
}