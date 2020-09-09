local globals = std.extVar('globals');

(import '../.defaults.jsonnet') {
  name: error 'environment name is required',

  propertyName: 'www-%s' % [self.name],
  hostname: 'www-%s.%s' % [self.name, globals.zone],
  edgeHostname: globals.edgeHostname,
  cpCode: globals.cpCode,
  origin: 'httpbin.org',
}
