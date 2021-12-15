local papi = import 'papi.libsonnet';
papi.rule {
  name: 'JPEG Images',
  comments: |||
    Improves load time by applying Adaptive Image Compression (AIC) to all JPEG
    images. The poorer the connection quality, the more AIC compresses the image
    files.  src: templates/www/rules/Performance/JPEG-Images.jsonnet
  |||,
  criteria: [
    papi.criteria.fileExtension {
      matchCaseSensitive: false,
      matchOperator: 'IS_ONE_OF',
      values: [
        'jpg',
        'jpeg',
        'jpe',
        'jif',
        'jfif',
        'jfi',
      ],
    },
  ],
  behaviors: [
    papi.behaviors.adaptiveImageCompression {
      compressMobile: true,
      compressStandard: true,
      tier1MobileCompressionMethod: 'BYPASS',
      tier1MobileCompressionValue: 80,
      tier1StandardCompressionMethod: 'BYPASS',
      tier1StandardCompressionValue: 80,
      tier2MobileCompressionMethod: 'COMPRESS',
      tier2MobileCompressionValue: 60,
      tier2StandardCompressionMethod: 'BYPASS',
      tier2StandardCompressionValue: 60,
      tier3MobileCompressionMethod: 'COMPRESS',
      tier3MobileCompressionValue: 40,
      tier3StandardCompressionMethod: 'COMPRESS',
      tier3StandardCompressionValue: 40,
    },
  ],
}
