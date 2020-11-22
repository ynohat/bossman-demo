local papi = import '../papi.libsonnet';

papi.root {
  originHostname:: null,
  cpCode:: null,

  name: 'default',
  is_secure: false,
  comments: |||
    The behaviors in the Default Rule apply to all requests for the property 
    hostname(s) unless another rule overrides the Default Rule settings.
    
    Fun fact: this rule MUST be called 'default' in JSON, otherwise weird things happen.
    
    src: %s
  ||| % (std.thisFile),
  behaviors: [
    papi.behavior.origin {
      hostname: $.originHostname,
      customValidCnValues: ['{{Origin Hostname}}', '{{Forward Host Header}}'],
      standardCertificateAuthorities: ['akamai-permissive'],
      saasCnameEnabled: null,
      saasCnameLevel: null,
      saasType: null,
    },
    papi.behavior.cpCode {
      value: { id: $.cpCode },
    },
    papi.behavior.allowPost,
    papi.behavior.allowPut,
    papi.behavior.allowDelete,
    papi.behavior.mPulse {
      apiKey: "",
      bufferSize: ""
    },
  ],
  children: [
    import 'default/Performance.jsonnet',
    import 'default/Offload.jsonnet',
  ],
}
