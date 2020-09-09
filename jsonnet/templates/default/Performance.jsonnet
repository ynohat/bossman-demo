local papi = import '../../papi.libsonnet';

{
  name: 'Performance',
  comments: |||
    Improves the performance of delivering objects to end users. Behaviors in this 
    rule are applied to all requests as appropriate.
  |||,
  behaviors: [
    papi.behavior.enhancedAkamaiProtocol,
    papi.behavior.http2,
    papi.behavior.allowTransferEncoding,
    papi.behavior.removeVary,
    papi.behavior.sureRoute {
      testObjectUrl: "/akamai/srto.html"
    },
    papi.behavior.prefetch,
  ],
  children: [
    import 'Performance/JPEG-Images.jsonnet',
    import 'Performance/Compressible-Objects.jsonnet',
  ],
}
