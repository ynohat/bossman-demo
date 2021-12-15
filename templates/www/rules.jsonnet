local papi = import 'papi.libsonnet';
local env = std.extVar('env');

{
  productId: 'SPM',
  ruleFormat: 'v2020-03-04',
  contractId: 'ctr_C-1ED34DY',
  groupId: 'grp_200128',
  rules: papi.root {
    name: 'default',
    comments: |||
      The behaviors in the Default Rule apply to all requests for the property
      hostname(s) unless another rule overrides the Default Rule settings.
      
      Fun fact: this rule MUST be called 'default' in JSON, otherwise weird things
      happen.
      
      src: templates/www/rules.jsonnet
    |||,
    options: {
      is_secure: false,
    },
    variables: import 'pmvariables.jsonnet',
    behaviors: [
      papi.behaviors.origin {
        cacheKeyHostname: 'ORIGIN_HOSTNAME',
        compress: true,
        customCertificateAuthorities: [],
        customCertificates: [],
        customValidCnValues: [
          '{{Origin Hostname}}',
          '{{Forward Host Header}}',
        ],
        enableTrueClientIp: false,
        forwardHostHeader: 'ORIGIN_HOSTNAME',
        hostname: env.origin,
        httpPort: 80,
        httpsPort: 443,
        originCertsToHonor: 'STANDARD_CERTIFICATE_AUTHORITIES',
        originSni: true,
        originType: 'CUSTOMER',
        standardCertificateAuthorities: [
          'akamai-permissive',
        ],
        trueClientIpClientSetting: false,
        trueClientIpHeader: 'True-Client-IP',
        useUniqueCacheKey: false,
        verificationMode: 'PLATFORM_SETTINGS',
      },
      papi.behaviors.cpCode {
        value: { id: env.cpCode },
      },
      papi.behaviors.allowPost {
        allowWithoutContentLength: false,
        enabled: true,
      },
      papi.behaviors.allowPut {
        enabled: true,
      },
      papi.behaviors.allowDelete {
        allowBody: false,
        enabled: true,
      },
      papi.behaviors.mPulse {
        apiKey: '',
        bufferSize: '',
        configOverride: '',
        enabled: true,
        requirePci: false,
      },
    ],
    children: [
      import 'rules/Performance.jsonnet',
      import 'rules/Offload.jsonnet',
    ],
  },
}
