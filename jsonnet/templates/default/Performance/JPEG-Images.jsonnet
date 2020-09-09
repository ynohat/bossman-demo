local papi = import '../../../papi.libsonnet';

{
  name: 'JPEG Images',
  comments: |||
    Improves load time by applying Adaptive Image Compression (AIC) to all JPEG 
    images. The poorer the connection quality, the more AIC compresses the image 
    files.
  |||,
  criteria: [
    papi.criteria.fileExtension {
      values: ['jpg', 'jpeg', 'jpe', 'jif', 'jfif', 'jfi'],
    },
  ],
  behaviors: [
    papi.behavior.adaptiveImageCompression,
  ],
}
