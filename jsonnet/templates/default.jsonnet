local papi = import '../papi.libsonnet';

{
  originHostname:: null,
  cpCode:: null,

  name: 'default',
  comments: |||
    The behaviors in the Default Rule apply to all requests for the property 
    hostname(s) unless another rule overrides the Default Rule settings.
  |||,
  behaviors: [
    papi.behavior.origin {
      customValidCnValues: ['{{Origin Hostname}}', '{{Forward Host Header}}'],
      hostname: $.originHostname,
      standardCertificateAuthorities: ['akamai-permissive'],
    },
    papi.behavior.cpCode {
      value: { id: $.cpCode },
    },
    papi.behavior.allowPost,
    papi.behavior.mPulse,
  ],
  children: [
    import 'default/Performance.jsonnet',
    import 'default/Offload.jsonnet',
  ],
}
