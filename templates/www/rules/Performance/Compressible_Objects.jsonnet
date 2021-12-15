local papi = import 'papi.libsonnet';
papi.rule {
  name: 'Compressible Objects',
  comments: |||
    Compresses content to improve performance of clients with slow connections.
    Applies Last Mile Acceleration to requests when the returned object supports
    gzip compression.  src: templates/www/rules/Performance/Compressible-
    Objects.jsonnet
  |||,
  criteria: [
    papi.criteria.contentType {
      matchCaseSensitive: false,
      matchOperator: 'IS_ONE_OF',
      matchWildcard: true,
      values: [
        'text/*',
        'application/javascript',
        'application/x-javascript*',
        'application/json',
        'application/x-json',
        'application/*+json',
        'application/*+xml',
        'application/text',
        'application/vnd.microsoft.icon',
        'application/vnd-ms-fontobject',
        'application/x-font-ttf',
        'application/x-font-opentype',
        'application/x-font-truetype',
        'application/xmlfont/eot',
        'application/xml',
        'font/opentype',
        'font/otf',
        'font/eot',
        'image/svg+xml',
        'image/vnd.microsoft.icon',
      ],
    },
  ],
  behaviors: [
    papi.behaviors.gzipResponse {
      behavior: 'ORIGIN_RESPONSE',
    },
  ],
}
