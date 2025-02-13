# Property: www-prod

Product : SPM
Rule Format : v2020-03-04

## Hostnames

www.bossman-demo.ak.hogg.fr CNAME ak.hogg.fr.edgekey.net ; EDGE_HOSTNAME


## Rules

## default

```
The behaviors in the Default Rule apply to all requests for the property
hostname(s) unless another rule overrides the Default Rule settings.

Fun fact: this rule MUST be called 'default' in JSON, otherwise weird things
happen.

:shrug:

src: templates/www/rules.jsonnet

```

Criteria

```json
[

]
```

Behaviors

```json
[
  {
    "name": "origin",
    "options": {
      "cacheKeyHostname": "ORIGIN_HOSTNAME",
      "compress": true,
      "customCertificateAuthorities": [

      ],
      "customCertificates": [

      ],
      "customValidCnValues": [
        "{{Origin Hostname}}",
        "{{Forward Host Header}}"
      ],
      "enableTrueClientIp": false,
      "forwardHostHeader": "ORIGIN_HOSTNAME",
      "hostname": "httpbin.org",
      "httpPort": 80,
      "httpsPort": 443,
      "originCertsToHonor": "STANDARD_CERTIFICATE_AUTHORITIES",
      "originSni": true,
      "originType": "CUSTOMER",
      "standardCertificateAuthorities": [
        "akamai-permissive"
      ],
      "trueClientIpClientSetting": false,
      "trueClientIpHeader": "True-Client-IP",
      "useUniqueCacheKey": false,
      "verificationMode": "PLATFORM_SETTINGS"
    }
  },
  {
    "name": "cpCode",
    "options": {
      "value": {
        "id": 585898
      }
    }
  },
  {
    "name": "allowPost",
    "options": {
      "allowWithoutContentLength": false,
      "enabled": true
    }
  },
  {
    "name": "allowPut",
    "options": {
      "enabled": true
    }
  },
  {
    "name": "allowDelete",
    "options": {
      "allowBody": false,
      "enabled": true
    }
  },
  {
    "name": "mPulse",
    "options": {
      "apiKey": "",
      "bufferSize": "",
      "configOverride": "",
      "enabled": true,
      "requirePci": false
    }
  }
]
```

### Performance

```
Improves the performance of delivering objects to end users. Behaviors in
this  rule are applied to all requests as appropriate.  src:
templates/www/rules/Performance.jsonnet

```

Criteria

```json
[

]
```

Behaviors

```json
[
  {
    "name": "enhancedAkamaiProtocol",
    "options": {

    }
  },
  {
    "name": "http2",
    "options": {

    }
  },
  {
    "name": "allowTransferEncoding",
    "options": {
      "enabled": true
    }
  },
  {
    "name": "removeVary",
    "options": {
      "enabled": true
    }
  },
  {
    "name": "sureRoute",
    "options": {
      "enableCustomKey": false,
      "enabled": true,
      "forceSslForward": false,
      "raceStatTtl": "30m",
      "testObjectUrl": "/akamai/srto2.html",
      "toHostStatus": "INCOMING_HH",
      "type": "PERFORMANCE"
    }
  },
  {
    "name": "prefetch",
    "options": {
      "enabled": true
    }
  }
]
```

#### JPEG Images

```
Improves load time by applying Adaptive Image Compression (AIC) to all JPEG
images. The poorer the connection quality, the more AIC compresses the image
files.  src: templates/www/rules/Performance/JPEG-Images.jsonnet

```

Criteria

```json
[
  {
    "name": "fileExtension",
    "options": {
      "matchCaseSensitive": false,
      "matchOperator": "IS_ONE_OF",
      "values": [
        "jpg",
        "jpeg",
        "jpe",
        "jif",
        "jfif",
        "jfi"
      ]
    }
  }
]
```

Behaviors

```json
[
  {
    "name": "adaptiveImageCompression",
    "options": {
      "compressMobile": true,
      "compressStandard": true,
      "tier1MobileCompressionMethod": "BYPASS",
      "tier1MobileCompressionValue": 80,
      "tier1StandardCompressionMethod": "BYPASS",
      "tier1StandardCompressionValue": 80,
      "tier2MobileCompressionMethod": "COMPRESS",
      "tier2MobileCompressionValue": 60,
      "tier2StandardCompressionMethod": "BYPASS",
      "tier2StandardCompressionValue": 60,
      "tier3MobileCompressionMethod": "COMPRESS",
      "tier3MobileCompressionValue": 40,
      "tier3StandardCompressionMethod": "COMPRESS",
      "tier3StandardCompressionValue": 40
    }
  }
]
```



#### Compressible Objects

```
Compresses content to improve performance of clients with slow connections.
Applies Last Mile Acceleration to requests when the returned object supports
gzip compression.  src: templates/www/rules/Performance/Compressible-
Objects.jsonnet

```

Criteria

```json
[
  {
    "name": "contentType",
    "options": {
      "matchCaseSensitive": false,
      "matchOperator": "IS_ONE_OF",
      "matchWildcard": true,
      "values": [
        "text/*",
        "application/javascript",
        "application/x-javascript*",
        "application/json",
        "application/x-json",
        "application/*+json",
        "application/*+xml",
        "application/text",
        "application/vnd.microsoft.icon",
        "application/vnd-ms-fontobject",
        "application/x-font-ttf",
        "application/x-font-opentype",
        "application/x-font-truetype",
        "application/xmlfont/eot",
        "application/xml",
        "font/opentype",
        "font/otf",
        "font/eot",
        "image/svg+xml",
        "image/vnd.microsoft.icon"
      ]
    }
  }
]
```

Behaviors

```json
[
  {
    "name": "gzipResponse",
    "options": {
      "behavior": "ORIGIN_RESPONSE"
    }
  }
]
```




### Offload

```
Controls caching, which offloads traffic away from the origin. Most objects
types are not cached. However, the child rules override this behavior for
certain subsets of requests.  src: templates/www/rules/Offload.jsonnet

```

Criteria

```json
[

]
```

Behaviors

```json
[
  {
    "name": "caching",
    "options": {
      "behavior": "NO_STORE"
    }
  },
  {
    "name": "cacheError",
    "options": {
      "enabled": true,
      "preserveStale": true,
      "ttl": "74s"
    }
  },
  {
    "name": "downstreamCache",
    "options": {
      "allowBehavior": "LESSER",
      "behavior": "MUST_REVALIDATE",
      "sendHeaders": "CACHE_CONTROL_AND_EXPIRES",
      "sendPrivate": false
    }
  },
  {
    "name": "tieredDistribution",
    "options": {
      "enabled": true,
      "tieredDistributionMap": "CH2"
    }
  }
]
```

#### Demandware Static

```
eCDN returns an Age header to ensure a correct downstream TTL.  The best
option is to use "Honor Origin Cache Control" for content with a path
matching demandware.static, and send the lowest of remaining ttl or origin
cache control max-age downstream.  src:
templates/www/rules/Offload/Demandware-Static.jsonnet

```

Criteria

```json
[
  {
    "name": "path",
    "options": {
      "matchCaseSensitive": false,
      "matchOperator": "MATCHES_ONE_OF",
      "values": [
        "*/on/demandware.static/*"
      ]
    }
  }
]
```

Behaviors

```json
[
  {
    "name": "caching",
    "options": {
      "behavior": "CACHE_CONTROL",
      "defaultTtl": "7d",
      "honorMustrevalidateEnabled": true,
      "honorPrivateEnabled": true,
      "mustRevalidate": false
    }
  },
  {
    "name": "downstreamCache",
    "options": {
      "allowBehavior": "LESSER",
      "behavior": "ALLOW",
      "sendHeaders": "CACHE_CONTROL_AND_EXPIRES",
      "sendPrivate": false
    }
  }
]
```



#### CSS and Javascript

```
Overrides the default caching behavior for CSS and JavaScript objects that
are  cached on the edge server. Because these object types are dynamic, the
TTL is  brief.  src: templates/www/rules/Offload/CSS-and-Javascript.jsonnet

```

Criteria

```json
[
  {
    "name": "fileExtension",
    "options": {
      "matchCaseSensitive": false,
      "matchOperator": "IS_ONE_OF",
      "values": [
        "css",
        "js",
        "jsx"
      ]
    }
  }
]
```

Behaviors

```json
[
  {
    "name": "caching",
    "options": {
      "behavior": "MAX_AGE",
      "mustRevalidate": false,
      "ttl": "30d"
    }
  },
  {
    "name": "prefreshCache",
    "options": {
      "enabled": true,
      "prefreshval": 80
    }
  },
  {
    "name": "prefetchable",
    "options": {
      "enabled": true
    }
  }
]
```



#### Static objects

```
Overrides the default caching behavior for images, music, and similar
objects  that are cached on the edge server. Because these object types are
static, the TTL is long.  src: templates/www/rules/Offload/Static-
objects.jsonnet

```

Criteria

```json
[
  {
    "name": "fileExtension",
    "options": {
      "matchCaseSensitive": false,
      "matchOperator": "IS_ONE_OF",
      "values": [
        "au",
        "bin",
        "bmp",
        "cab",
        "carb",
        "cct",
        "cdf",
        "class",
        "doc",
        "dcr",
        "dtd",
        "exe",
        "flv",
        "gcf",
        "gff",
        "gif",
        "grv",
        "hdml",
        "hqx",
        "ico",
        "ini",
        "jpeg",
        "jpg",
        "mov",
        "mp3",
        "nc",
        "pct",
        "pdf",
        "png",
        "ppc",
        "pws",
        "swa",
        "swf",
        "txt",
        "vbs",
        "w32",
        "wav",
        "wbmp",
        "wml",
        "wmlc",
        "wmls",
        "wmlsc",
        "xsd",
        "zip",
        "pict",
        "tif",
        "tiff",
        "mid",
        "midi",
        "ttf",
        "eot",
        "woff",
        "woff2",
        "otf",
        "svg",
        "svgz",
        "webp",
        "jxr",
        "jar",
        "jp2"
      ]
    }
  }
]
```

Behaviors

```json
[
  {
    "name": "caching",
    "options": {
      "behavior": "MAX_AGE",
      "mustRevalidate": false,
      "ttl": "31d"
    }
  },
  {
    "name": "prefreshCache",
    "options": {
      "enabled": true,
      "prefreshval": 90
    }
  },
  {
    "name": "prefetchable",
    "options": {
      "enabled": true
    }
  }
]
```



#### Uncacheable Responses

```
Overrides the default downstream caching behavior for uncacheable object
types.  Instructs the edge server to pass Cache-Control and/or Expire
headers from the origin to the client.  src:
templates/www/rules/Offload/Uncacheable-Responses.jsonnet

```

Criteria

```json
[
  {
    "name": "cacheability",
    "options": {
      "matchOperator": "IS_NOT",
      "value": "CACHEABLE"
    }
  }
]
```

Behaviors

```json
[
  {
    "name": "downstreamCache",
    "options": {
      "allowBehavior": "LESSER",
      "behavior": "TUNNEL_ORIGIN",
      "sendHeaders": "CACHE_CONTROL_AND_EXPIRES",
      "sendPrivate": false
    }
  }
]
```



#### Assets Flexible Cache Id

```
Include query string parameters abc in cache id.  src:
templates/www/rules/Offload/Assets-Flex-CacheId.jsonnet

```

Criteria

```json
[
  {
    "name": "path",
    "options": {
      "matchCaseSensitive": false,
      "matchOperator": "MATCHES_ONE_OF",
      "values": [
        "/assets/*"
      ]
    }
  }
]
```

Behaviors

```json
[
  {
    "name": "cacheId",
    "options": {
      "elements": [
        "abc"
      ],
      "includeValue": true,
      "optional": true,
      "rule": "INCLUDE_QUERY_PARAMS"
    }
  }
]
```





