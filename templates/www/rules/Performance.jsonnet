local papi = import 'papi.libsonnet';
papi.rule {
  name: 'Performance',
  comments: |||
    Improves the performance of delivering objects to end users. Behaviors in
    this  rule are applied to all requests as appropriate.  src:
    templates/www/rules/Performance.jsonnet
  |||,
  behaviors: [
    papi.behaviors.enhancedAkamaiProtocol,
    papi.behaviors.http2,
    papi.behaviors.allowTransferEncoding {
      enabled: true,
    },
    papi.behaviors.removeVary {
      enabled: true,
    },
    papi.behaviors.sureRoute {
      enableCustomKey: false,
      enabled: true,
      forceSslForward: false,
      raceStatTtl: '30m',
      testObjectUrl: '/akamai/srto2.html',
      toHostStatus: 'INCOMING_HH',
      type: 'PERFORMANCE',
    },
    papi.behaviors.prefetch {
      enabled: true,
    },
  ],
  children: [
    import 'Performance/JPEG_Images.jsonnet',
    import 'Performance/Compressible_Objects.jsonnet',
  ],
}
