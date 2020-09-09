local papi = import 'papi.libsonnet';
local env = std.extVar('env');
local globals = std.extVar('globals');

{
  productId: papi.productId,
  ruleFormat: papi.ruleFormat,
  contractId: globals.contractId,
  groupId: globals.groupId,

  rules: papi.root {
    is_secure: false,

    variables: import 'rules/variables.jsonnet',

    comments: |||
      The behaviors in the Default Rule apply to all requests for the property 
      hostname(s) unless another rule overrides the Default Rule settings.


      Fun fact: this rule MUST be called 'default' in JSON, otherwise weird things happen.

      src: %s
    ||| % (std.thisFile),
    behaviors: [
      papi.behavior.origin {
        forwardHostHeader: 'ORIGIN_HOSTNAME',
        hostname: env.origin,
        customValidCnValues: ['{{Origin Hostname}}', '{{Forward Host Header}}'],
        standardCertificateAuthorities: ['akamai-permissive'],
        saasCnameEnabled: null,
        saasCnameLevel: null,
        saasType: null,
      },
      papi.behavior.cpCode {
        value: { id: env.cpCode },
      },
      papi.behavior.allowPost,
      papi.behavior.allowPut,
      papi.behavior.allowDelete,
      papi.behavior.mPulse {
        apiKey: '',
        bufferSize: '',
      },
    ],
    children: [
      import 'rules/Performance.jsonnet',
      import 'rules/Offload.jsonnet',
    ],
  }

}
