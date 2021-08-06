local papi = import 'papi.libsonnet';

papi.rule {
  name: 'Static objects',
  comments: |||
    Overrides the default caching behavior for images, music, and similar objects 
    that are cached on the edge server.
    Because these object types are static, the TTL is long.
    
    src: %s
  ||| % (std.thisFile),
  criteria: [
    papi.criteria.fileExtension {
      values: ['au', 'bin', 'bmp', 'cab', 'carb', 'cct', 'cdf', 'class', 'doc', 'dcr', 'dtd', 'exe', 'flv', 'gcf', 'gff', 'gif', 'grv', 'hdml', 'hqx', 'ico', 'ini', 'jpeg', 'jpg', 'mov', 'mp3', 'nc', 'pct', 'pdf', 'png', 'ppc', 'pws', 'swa', 'swf', 'txt', 'vbs', 'w32', 'wav', 'wbmp', 'wml', 'wmlc', 'wmls', 'wmlsc', 'xsd', 'zip', 'pict', 'tif', 'tiff', 'mid', 'midi', 'ttf', 'eot', 'woff', 'woff2', 'otf', 'svg', 'svgz', 'webp', 'jxr', 'jar', 'jp2'],
    },
  ],
  behaviors: [
    papi.behavior.caching {
      honorMustrevalidateEnabled: null,
      honorPrivateEnabled: null,
      ttl: '3d',
    },
    papi.behavior.prefreshCache,
    papi.behavior.prefetchable,
  ],
}
