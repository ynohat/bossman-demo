{
  productId:: 'SPM',
  ruleFormat:: 'v2020-03-04',
  rule: {
    name: error '<name> is required',
    comments: '',
    //comments: error "<comments> is required",

    behaviors: [],
    children: [],
    criteria: [],
    criteriaMustSatisfy: 'all',
    options: {},
  },
  root: {
    local _ = self,
    is_secure:: error 'is_secure is required',
    // The name of the default rule MUST BE "default", otherwise
    // PAPI throws occassional random errors.
    name: 'default',
    assert self.name == 'default',
    comments: |||
      The behaviors in the Default Rule apply to all requests for the property hostname(s) unless
      another rule overrides the Default Rule settings.
    |||,
    behaviors: [],
    children: [],
    options: {
      is_secure: _.is_secure,
    },
    variables: [
    ],
  },
  behavior: {
    adaptiveAcceleration: {
      local _ = self,
      name: 'adaptiveAcceleration',

      source:: 'mPulse',
      enablePush:: true,
      enablePreconnect:: true,
      preloadEnable:: true,
      enableRo:: true,

      options: {
        [name]: _[name]
        for name in ['source', 'enablePush', 'enablePreconnect', 'preloadEnable', 'enableRo']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    adaptiveImageCompression: {
      local _ = self,
      name: 'adaptiveImageCompression',

      compressMobile:: true,
      tier1MobileCompressionMethod:: 'BYPASS',
      tier1MobileCompressionValue:: 80,
      tier2MobileCompressionMethod:: 'COMPRESS',
      tier2MobileCompressionValue:: 60,
      tier3MobileCompressionMethod:: 'COMPRESS',
      tier3MobileCompressionValue:: 40,
      compressStandard:: true,
      tier1StandardCompressionMethod:: 'BYPASS',
      tier1StandardCompressionValue:: 80,
      tier2StandardCompressionMethod:: 'BYPASS',
      tier2StandardCompressionValue:: 60,
      tier3StandardCompressionMethod:: 'COMPRESS',
      tier3StandardCompressionValue:: 40,

      options: {
        [name]: _[name]
        for name in ['compressMobile', 'tier1MobileCompressionMethod', 'tier1MobileCompressionValue', 'tier2MobileCompressionMethod', 'tier2MobileCompressionValue', 'tier3MobileCompressionMethod', 'tier3MobileCompressionValue', 'compressStandard', 'tier1StandardCompressionMethod', 'tier1StandardCompressionValue', 'tier2StandardCompressionMethod', 'tier2StandardCompressionValue', 'tier3StandardCompressionMethod', 'tier3StandardCompressionValue']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    advanced: {
      local _ = self,
      name: 'advanced',

      description:: null,
      xml:: null,

      options: {
        [name]: _[name]
        for name in ['description', 'xml']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    akamaizer: {
      local _ = self,
      name: 'akamaizer',

      enabled:: true,

      options: {
        [name]: _[name]
        for name in ['enabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    akamaizerTag: {
      local _ = self,
      name: 'akamaizerTag',

      matchHostname:: null,
      replacementHostname:: null,
      scope:: 'URL_ATTRIBUTE',
      tagsAttribute:: 'IMG_SRC',
      replaceAll:: false,
      includeTagsAttribute:: true,

      options: {
        [name]: _[name]
        for name in ['matchHostname', 'replacementHostname', 'scope', 'tagsAttribute', 'replaceAll', 'includeTagsAttribute']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    allHttpInCacheHierarchy: {
      local _ = self,
      name: 'allHttpInCacheHierarchy',

      enabled:: true,

      options: {
        [name]: _[name]
        for name in ['enabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    allowCloudletsOrigins: {
      local _ = self,
      name: 'allowCloudletsOrigins',

      enabled:: true,
      honorBaseDirectory:: false,
      purgeOriginQueryParameter:: 'originId',

      options: {
        [name]: _[name]
        for name in ['enabled', 'honorBaseDirectory', 'purgeOriginQueryParameter']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    allowDelete: {
      local _ = self,
      name: 'allowDelete',

      enabled:: true,
      allowBody:: false,

      options: {
        [name]: _[name]
        for name in ['enabled', 'allowBody']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    allowOptions: {
      local _ = self,
      name: 'allowOptions',

      enabled:: true,

      options: {
        [name]: _[name]
        for name in ['enabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    allowPatch: {
      local _ = self,
      name: 'allowPatch',

      enabled:: true,

      options: {
        [name]: _[name]
        for name in ['enabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    allowPost: {
      local _ = self,
      name: 'allowPost',

      enabled:: true,
      allowWithoutContentLength:: false,

      options: {
        [name]: _[name]
        for name in ['enabled', 'allowWithoutContentLength']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    allowPut: {
      local _ = self,
      name: 'allowPut',

      enabled:: true,

      options: {
        [name]: _[name]
        for name in ['enabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    allowTransferEncoding: {
      local _ = self,
      name: 'allowTransferEncoding',

      enabled:: true,

      options: {
        [name]: _[name]
        for name in ['enabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    apiPrioritization: {
      local _ = self,
      name: 'apiPrioritization',

      enabled:: true,
      cloudletPolicy:: null,
      label:: null,
      useThrottledCpCode:: false,
      throttledCpCode:: null,
      useThrottledStatusCode:: false,
      throttledStatusCode:: 200,
      netStorage:: null,
      netStoragePath:: null,
      alternateResponseCacheTtl:: 5,

      options: {
        [name]: _[name]
        for name in ['enabled', 'cloudletPolicy', 'label', 'useThrottledCpCode', 'throttledCpCode', 'useThrottledStatusCode', 'throttledStatusCode', 'netStorage', 'netStoragePath', 'alternateResponseCacheTtl']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    applicationLoadBalancer: {
      local _ = self,
      name: 'applicationLoadBalancer',

      enabled:: true,
      cloudletPolicy:: null,
      label:: null,
      stickinessCookieType:: 'ON_BROWSER_CLOSE',
      stickinessExpirationDate:: null,
      stickinessDuration:: '300s',
      stickinessRefresh:: false,
      originCookieName:: null,
      specifyStickinessCookieDomain:: false,
      stickinessCookieDomain:: null,
      stickinessCookieAutomaticSalt:: true,
      stickinessCookieSalt:: null,
      stickinessCookieSetHttpOnlyFlag:: false,
      stickinessCookieSetSecureFlag:: false,
      allDownNetStorage:: null,
      allDownNetStorageFile:: null,
      allDownStatusCode:: null,
      failoverStatusCodes:: ['500', '501', '502', '503', '504', '505', '506', '507', '508', '509'],
      failoverMode:: 'AUTOMATIC',
      failoverOriginMap:: null,
      failoverAttemptsThreshold:: 5,
      allowCachePrefresh:: true,

      options: {
        [name]: _[name]
        for name in ['enabled', 'cloudletPolicy', 'label', 'stickinessCookieType', 'stickinessExpirationDate', 'stickinessDuration', 'stickinessRefresh', 'originCookieName', 'specifyStickinessCookieDomain', 'stickinessCookieDomain', 'stickinessCookieAutomaticSalt', 'stickinessCookieSalt', 'stickinessCookieSetHttpOnlyFlag', 'stickinessCookieSetSecureFlag', 'allDownNetStorage', 'allDownNetStorageFile', 'allDownStatusCode', 'failoverStatusCodes', 'failoverMode', 'failoverOriginMap', 'failoverAttemptsThreshold', 'allowCachePrefresh']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    audienceSegmentation: {
      local _ = self,
      name: 'audienceSegmentation',

      enabled:: true,
      cloudletPolicy:: null,
      label:: null,
      segmentTrackingMethod:: 'NONE',
      segmentTrackingQueryParam:: null,
      segmentTrackingCookieName:: null,
      segmentTrackingCustomHeader:: null,
      populationCookieType:: 'ON_BROWSER_CLOSE',
      populationDuration:: '5m',
      populationRefresh:: true,
      specifyPopulationCookieDomain:: false,
      populationCookieDomain:: null,
      populationCookieAutomaticSalt:: true,
      populationCookieSalt:: null,
      populationCookieIncludeRuleName:: false,

      options: {
        [name]: _[name]
        for name in ['enabled', 'cloudletPolicy', 'label', 'segmentTrackingMethod', 'segmentTrackingQueryParam', 'segmentTrackingCookieName', 'segmentTrackingCustomHeader', 'populationCookieType', 'populationDuration', 'populationRefresh', 'specifyPopulationCookieDomain', 'populationCookieDomain', 'populationCookieAutomaticSalt', 'populationCookieSalt', 'populationCookieIncludeRuleName']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    autoDomainValidation: {
      local _ = self,
      name: 'autoDomainValidation',


      options: {
        [name]: _[name]
        for name in []
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    baseDirectory: {
      local _ = self,
      name: 'baseDirectory',

      value:: null,

      options: {
        [name]: _[name]
        for name in ['value']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    breakConnection: {
      local _ = self,
      name: 'breakConnection',

      enabled:: true,

      options: {
        [name]: _[name]
        for name in ['enabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    brotli: {
      local _ = self,
      name: 'brotli',

      enabled:: true,

      options: {
        [name]: _[name]
        for name in ['enabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    cacheError: {
      local _ = self,
      name: 'cacheError',

      enabled:: true,
      ttl:: '10s',
      preserveStale:: true,

      options: {
        [name]: _[name]
        for name in ['enabled', 'ttl', 'preserveStale']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    cacheId: {
      local _ = self,
      name: 'cacheId',

      rule:: 'INCLUDE_QUERY_PARAMS',
      includeValue:: true,
      optional:: true,
      elements:: null,
      variableName:: null,

      options: {
        [name]: _[name]
        for name in ['rule', 'includeValue', 'optional', 'elements', 'variableName']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    cacheKeyIgnoreCase: {
      local _ = self,
      name: 'cacheKeyIgnoreCase',

      enabled:: true,

      options: {
        [name]: _[name]
        for name in ['enabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    cacheKeyQueryParams: {
      local _ = self,
      name: 'cacheKeyQueryParams',

      behavior:: 'INCLUDE_ALL_PRESERVE_ORDER',
      parameters:: null,
      exactMatch:: false,

      options: {
        [name]: _[name]
        for name in ['behavior', 'parameters', 'exactMatch']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    cachePost: {
      local _ = self,
      name: 'cachePost',

      enabled:: true,
      useBody:: 'IGNORE',

      options: {
        [name]: _[name]
        for name in ['enabled', 'useBody']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    cacheRedirect: {
      local _ = self,
      name: 'cacheRedirect',

      enabled:: 'true',

      options: {
        [name]: _[name]
        for name in ['enabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    cacheTagVisible: {
      local _ = self,
      name: 'cacheTagVisible',

      behavior:: 'NEVER',

      options: {
        [name]: _[name]
        for name in ['behavior']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    caching: {
      local _ = self,
      name: 'caching',

      behavior:: 'MAX_AGE',
      mustRevalidate:: false,
      ttl:: null,
      defaultTtl:: null,
      honorPrivateEnabled:: false,
      honorMustrevalidateEnabled:: false,

      options: {
        [name]: _[name]
        for name in ['behavior', 'mustRevalidate', 'ttl', 'defaultTtl', 'honorPrivateEnabled', 'honorMustrevalidateEnabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    centralAuthorization: {
      local _ = self,
      name: 'centralAuthorization',

      enabled:: true,

      options: {
        [name]: _[name]
        for name in ['enabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    chaseRedirects: {
      local _ = self,
      name: 'chaseRedirects',

      enabled:: true,
      limit:: '4',
      serve404:: true,

      options: {
        [name]: _[name]
        for name in ['enabled', 'limit', 'serve404']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    constructResponse: {
      local _ = self,
      name: 'constructResponse',

      enabled:: true,
      body:: null,
      responseCode:: 200,
      forceEviction:: false,

      options: {
        [name]: _[name]
        for name in ['enabled', 'body', 'responseCode', 'forceEviction']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    cpCode: {
      local _ = self,
      name: 'cpCode',

      value:: null,

      options: {
        [name]: _[name]
        for name in ['value']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    customBehavior: {
      local _ = self,
      name: 'customBehavior',

      behaviorId:: null,

      options: {
        [name]: _[name]
        for name in ['behaviorId']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    datastream: {
      local _ = self,
      name: 'datastream',

      streamType:: 'BEACON',
      enabled:: true,
      datastreamIds:: null,
      logEnabled:: false,
      logStreamName:: null,
      samplingPercentage:: 100,

      options: {
        [name]: _[name]
        for name in ['streamType', 'enabled', 'datastreamIds', 'logEnabled', 'logStreamName', 'samplingPercentage']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    denyAccess: {
      local _ = self,
      name: 'denyAccess',

      reason:: 'default-deny-reason',
      enabled:: false,

      options: {
        [name]: _[name]
        for name in ['reason', 'enabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    deviceCharacteristicCacheId: {
      local _ = self,
      name: 'deviceCharacteristicCacheId',

      elements:: null,

      options: {
        [name]: _[name]
        for name in ['elements']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    deviceCharacteristicHeader: {
      local _ = self,
      name: 'deviceCharacteristicHeader',

      elements:: null,

      options: {
        [name]: _[name]
        for name in ['elements']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    dnsAsyncRefresh: {
      local _ = self,
      name: 'dnsAsyncRefresh',

      enabled:: true,
      timeout:: '2h',

      options: {
        [name]: _[name]
        for name in ['enabled', 'timeout']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    dnsPrefresh: {
      local _ = self,
      name: 'dnsPrefresh',

      enabled:: true,
      delay:: '5m',
      timeout:: '2h',

      options: {
        [name]: _[name]
        for name in ['enabled', 'delay', 'timeout']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    downstreamCache: {
      local _ = self,
      name: 'downstreamCache',

      behavior:: 'ALLOW',
      allowBehavior:: 'LESSER',
      ttl:: null,
      sendHeaders:: 'CACHE_CONTROL_AND_EXPIRES',
      sendPrivate:: false,

      options: {
        [name]: _[name]
        for name in ['behavior', 'allowBehavior', 'ttl', 'sendHeaders', 'sendPrivate']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    edgeConnect: {
      local _ = self,
      name: 'edgeConnect',

      enabled:: true,
      apiConnector:: 'DEFAULT',
      apiDataElements:: 'HTTP',
      destinationHostname:: null,
      destinationPath:: null,
      overrideAggregateSettings:: false,
      aggregateTime:: '15s',
      aggregateLines:: '2000',
      aggregateSize:: '1000KB',

      options: {
        [name]: _[name]
        for name in ['enabled', 'apiConnector', 'apiDataElements', 'destinationHostname', 'destinationPath', 'overrideAggregateSettings', 'aggregateTime', 'aggregateLines', 'aggregateSize']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    edgeImageConversion: {
      local _ = self,
      name: 'edgeImageConversion',

      enabled:: true,
      failover:: true,
      usePolicy:: false,
      policies:: null,
      policyResponses:: 400,

      options: {
        [name]: _[name]
        for name in ['enabled', 'failover', 'usePolicy', 'policies', 'policyResponses']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    edgeLoadBalancingAdvanced: {
      local _ = self,
      name: 'edgeLoadBalancingAdvanced',

      description:: null,
      xml:: null,

      options: {
        [name]: _[name]
        for name in ['description', 'xml']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    edgeLoadBalancingDataCenter: {
      local _ = self,
      name: 'edgeLoadBalancingDataCenter',

      originId:: null,
      description:: null,
      hostname:: null,
      cookieName:: null,
      enableFailover:: false,
      ip:: null,
      failoverRules:: null,

      options: {
        [name]: _[name]
        for name in ['originId', 'description', 'hostname', 'cookieName', 'enableFailover', 'ip', 'failoverRules']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    edgeLoadBalancingOrigin: {
      local _ = self,
      name: 'edgeLoadBalancingOrigin',

      id:: null,
      description:: null,
      hostname:: null,
      enableSessionPersistence:: false,
      cookieName:: null,

      options: {
        [name]: _[name]
        for name in ['id', 'description', 'hostname', 'enableSessionPersistence', 'cookieName']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    edgeOriginAuthorization: {
      local _ = self,
      name: 'edgeOriginAuthorization',

      enabled:: true,
      cookieName:: 'AKA_ID',
      value:: '',
      domain:: '',

      options: {
        [name]: _[name]
        for name in ['enabled', 'cookieName', 'value', 'domain']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    edgeRedirector: {
      local _ = self,
      name: 'edgeRedirector',

      enabled:: true,
      cloudletPolicy:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'cloudletPolicy']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    edgeScape: {
      local _ = self,
      name: 'edgeScape',

      enabled:: true,

      options: {
        [name]: _[name]
        for name in ['enabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    edgeSideIncludes: {
      local _ = self,
      name: 'edgeSideIncludes',

      enabled:: true,
      enableViaHttp:: false,
      passSetCookie:: false,
      passClientIp:: false,
      i18nStatus:: false,
      i18nCharset:: null,
      detectInjection:: false,

      options: {
        [name]: _[name]
        for name in ['enabled', 'enableViaHttp', 'passSetCookie', 'passClientIp', 'i18nStatus', 'i18nCharset', 'detectInjection']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    edgeWorker: {
      local _ = self,
      name: 'edgeWorker',

      enabled:: true,
      edgeWorkerId:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'edgeWorkerId']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    enhancedAkamaiProtocol: {
      local _ = self,
      name: 'enhancedAkamaiProtocol',


      options: {
        [name]: _[name]
        for name in []
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    failAction: {
      local _ = self,
      name: 'failAction',

      enabled:: true,
      actionType:: 'REDIRECT',
      saasType:: 'HOSTNAME',
      saasCnameEnabled:: false,
      saasCnameLevel:: 1,
      saasCookie:: null,
      saasQueryString:: null,
      saasRegex:: null,
      saasReplace:: null,
      saasSuffix:: null,
      dynamicMethod:: 'SERVE_301',
      dynamicCustomPath:: true,
      dynamicPath:: null,
      redirectHostnameType:: 'ALTERNATE',
      redirectHostname:: null,
      redirectCustomPath:: true,
      redirectPath:: null,
      redirectMethod:: 302,
      contentHostname:: null,
      contentCustomPath:: true,
      contentPath:: null,
      netStorageHostname:: null,
      netStoragePath:: null,
      cexHostname:: null,
      cexCustomPath:: true,
      cexPath:: null,
      cpCode:: null,
      statusCode:: 200,
      preserveQueryString:: true,
      modifyProtocol:: false,
      protocol:: 'HTTP',

      options: {
        [name]: _[name]
        for name in ['enabled', 'actionType', 'saasType', 'saasCnameEnabled', 'saasCnameLevel', 'saasCookie', 'saasQueryString', 'saasRegex', 'saasReplace', 'saasSuffix', 'dynamicMethod', 'dynamicCustomPath', 'dynamicPath', 'redirectHostnameType', 'redirectHostname', 'redirectCustomPath', 'redirectPath', 'redirectMethod', 'contentHostname', 'contentCustomPath', 'contentPath', 'netStorageHostname', 'netStoragePath', 'cexHostname', 'cexCustomPath', 'cexPath', 'cpCode', 'statusCode', 'preserveQueryString', 'modifyProtocol', 'protocol']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    failoverBotManagerFeatureCompatibility: {
      local _ = self,
      name: 'failoverBotManagerFeatureCompatibility',

      compatibility:: false,

      options: {
        [name]: _[name]
        for name in ['compatibility']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    fastInvalidate: {
      local _ = self,
      name: 'fastInvalidate',

      enabled:: true,

      options: {
        [name]: _[name]
        for name in ['enabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    firstPartyMarketing: {
      local _ = self,
      name: 'firstPartyMarketing',

      enabled:: true,
      javaScriptInsertionRule:: 'ALWAYS',
      cloudletPolicy:: null,
      mediaMathPrefix:: '/dcpp',

      options: {
        [name]: _[name]
        for name in ['enabled', 'javaScriptInsertionRule', 'cloudletPolicy', 'mediaMathPrefix']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    firstPartyMarketingPlus: {
      local _ = self,
      name: 'firstPartyMarketingPlus',

      enabled:: true,
      javaScriptInsertionRule:: 'ALWAYS',
      cloudletPolicy:: null,
      mediaMathPrefix:: '/dcpp',

      options: {
        [name]: _[name]
        for name in ['enabled', 'javaScriptInsertionRule', 'cloudletPolicy', 'mediaMathPrefix']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    forwardRewrite: {
      local _ = self,
      name: 'forwardRewrite',

      enabled:: true,
      cloudletPolicy:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'cloudletPolicy']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    frontEndOptimization: {
      local _ = self,
      name: 'frontEndOptimization',

      enabled:: true,

      options: {
        [name]: _[name]
        for name in ['enabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    globalRequestNumber: {
      local _ = self,
      name: 'globalRequestNumber',

      outputOption:: 'RESPONSE_HEADER',
      headerName:: 'Akamai-GRN',
      variableName:: null,

      options: {
        [name]: _[name]
        for name in ['outputOption', 'headerName', 'variableName']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    graphqlCaching: {
      local _ = self,
      name: 'graphqlCaching',

      enabled:: true,
      cacheResponsesWithErrors:: false,
      postRequestProcessingErrorHandling:: 'NO_STORE',
      operationsUrlQueryParameterName:: 'query',
      operationsJsonBodyParameterName:: 'query',

      options: {
        [name]: _[name]
        for name in ['enabled', 'cacheResponsesWithErrors', 'postRequestProcessingErrorHandling', 'operationsUrlQueryParameterName', 'operationsJsonBodyParameterName']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    gzipResponse: {
      local _ = self,
      name: 'gzipResponse',

      behavior:: 'ORIGIN_RESPONSE',
      enableCompression:: false,
      threshold:: 25,

      options: {
        [name]: _[name]
        for name in ['behavior', 'enableCompression', 'threshold']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    healthDetection: {
      local _ = self,
      name: 'healthDetection',

      retryCount:: 3,
      retryInterval:: '60s',
      maximumReconnects:: 3,

      options: {
        [name]: _[name]
        for name in ['retryCount', 'retryInterval', 'maximumReconnects']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    http2: {
      local _ = self,
      name: 'http2',


      options: {
        [name]: _[name]
        for name in []
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    httpStrictTransportSecurity: {
      local _ = self,
      name: 'httpStrictTransportSecurity',

      enable:: true,
      maxAge:: 'ONE_DAY',
      includeSubDomains:: false,
      preload:: false,
      redirect:: false,
      redirectStatusCode:: 301,

      options: {
        [name]: _[name]
        for name in ['enable', 'maxAge', 'includeSubDomains', 'preload', 'redirect', 'redirectStatusCode']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    imOverride: {
      local _ = self,
      name: 'imOverride',

      override:: 'POLICY',
      typesel:: 'VALUE',
      formatvar:: null,
      format:: 'CHROME',
      dprvar:: null,
      dpr:: null,
      widthvar:: null,
      width:: null,
      policyvar:: null,
      policy:: null,
      policyvarName:: null,
      policyvarIMvar:: null,

      options: {
        [name]: _[name]
        for name in ['override', 'typesel', 'formatvar', 'format', 'dprvar', 'dpr', 'widthvar', 'width', 'policyvar', 'policy', 'policyvarName', 'policyvarIMvar']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    imageManager: {
      local _ = self,
      name: 'imageManager',

      enabled:: true,
      resize:: false,
      applyBestFileType:: true,
      superCacheRegion:: 'US',
      cpCodeOriginal:: null,
      cpCodeTransformed:: null,
      advanced:: false,
      policyToken:: 'fresh',
      policyTokenDefault:: 'default',

      options: {
        [name]: _[name]
        for name in ['enabled', 'resize', 'applyBestFileType', 'superCacheRegion', 'cpCodeOriginal', 'cpCodeTransformed', 'advanced', 'policyToken', 'policyTokenDefault']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    imageManagerVideo: {
      local _ = self,
      name: 'imageManagerVideo',

      enabled:: true,
      resize:: false,
      applyBestFileType:: true,
      superCacheRegion:: 'US',
      cpCodeOriginal:: null,
      cpCodeTransformed:: null,
      advanced:: false,
      policyToken:: 'freshVideo',
      policyTokenDefault:: 'freshVideo',

      options: {
        [name]: _[name]
        for name in ['enabled', 'resize', 'applyBestFileType', 'superCacheRegion', 'cpCodeOriginal', 'cpCodeTransformed', 'advanced', 'policyToken', 'policyTokenDefault']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    inputValidation: {
      local _ = self,
      name: 'inputValidation',

      enabled:: true,
      cloudletPolicy:: null,
      label:: null,
      userIdentificationByCookie:: false,
      userIdentificationKeyCookie:: null,
      userIdentificationByIp:: true,
      userIdentificationByHeaders:: false,
      userIdentificationKeyHeaders:: null,
      userIdentificationByParams:: true,
      userIdentificationKeyParams:: null,
      allowLargePostBody:: false,
      resetOnValid:: true,
      validateOnOriginWith:: 'DISABLED',
      validateOnOriginHeaderName:: 'X-Validation-Failure',
      validateOnOriginHeaderValue:: 'true',
      validateOnOriginResponseCode:: 200,
      failure302Uri:: null,
      penaltyThreshold:: 3,
      penaltyAction:: 'BLANK_403',
      penalty302Uri:: null,
      penaltyNetStorage:: null,
      penalty403NetStoragePath:: null,
      penaltyBrandedDenyCacheTtl:: 5,

      options: {
        [name]: _[name]
        for name in ['enabled', 'cloudletPolicy', 'label', 'userIdentificationByCookie', 'userIdentificationKeyCookie', 'userIdentificationByIp', 'userIdentificationByHeaders', 'userIdentificationKeyHeaders', 'userIdentificationByParams', 'userIdentificationKeyParams', 'allowLargePostBody', 'resetOnValid', 'validateOnOriginWith', 'validateOnOriginHeaderName', 'validateOnOriginHeaderValue', 'validateOnOriginResponseCode', 'failure302Uri', 'penaltyThreshold', 'penaltyAction', 'penalty302Uri', 'penaltyNetStorage', 'penalty403NetStoragePath', 'penaltyBrandedDenyCacheTtl']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    instant: {
      local _ = self,
      name: 'instant',

      prefetchCacheable:: false,
      prefetchNoStore:: false,
      prefetchNoStoreExtensions:: null,
      prefetchHtml:: false,
      customLinkRelations:: 'Akamai-prefetch',

      options: {
        [name]: _[name]
        for name in ['prefetchCacheable', 'prefetchNoStore', 'prefetchNoStoreExtensions', 'prefetchHtml', 'customLinkRelations']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    instantConfig: {
      local _ = self,
      name: 'instantConfig',

      enabled:: true,

      options: {
        [name]: _[name]
        for name in ['enabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    largeFileOptimization: {
      local _ = self,
      name: 'largeFileOptimization',

      enabled:: true,
      enablePartialObjectCaching:: 'PARTIAL_OBJECT_CACHING',
      minimumSize:: '100MB',
      maximumSize:: '16GB',
      useVersioning:: true,

      options: {
        [name]: _[name]
        for name in ['enabled', 'enablePartialObjectCaching', 'minimumSize', 'maximumSize', 'useVersioning']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    mPulse: {
      local _ = self,
      name: 'mPulse',

      enabled:: true,
      requirePci:: false,
      apiKey:: null,
      bufferSize:: null,
      configOverride:: '',

      options: {
        [name]: _[name]
        for name in ['enabled', 'requirePci', 'apiKey', 'bufferSize', 'configOverride']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    manualServerPush: {
      local _ = self,
      name: 'manualServerPush',

      serverpushlist:: null,

      options: {
        [name]: _[name]
        for name in ['serverpushlist']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    mobileSdkPerformance: {
      local _ = self,
      name: 'mobileSdkPerformance',

      enabled:: true,
      secondaryMultipathToOrigin:: false,

      options: {
        [name]: _[name]
        for name in ['enabled', 'secondaryMultipathToOrigin']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    modifyIncomingRequestHeader: {
      local _ = self,
      name: 'modifyIncomingRequestHeader',

      action:: 'ADD',
      standardAddHeaderName:: 'ACCEPT_ENCODING',
      standardDeleteHeaderName:: 'IF_MODIFIED_SINCE',
      standardModifyHeaderName:: 'ACCEPT_ENCODING',
      standardPassHeaderName:: 'ACCEPT_ENCODING',
      customHeaderName:: null,
      headerValue:: null,
      newHeaderValue:: null,
      avoidDuplicateHeaders:: false,

      options: {
        [name]: _[name]
        for name in ['action', 'standardAddHeaderName', 'standardDeleteHeaderName', 'standardModifyHeaderName', 'standardPassHeaderName', 'customHeaderName', 'headerValue', 'newHeaderValue', 'avoidDuplicateHeaders']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    modifyIncomingResponseHeader: {
      local _ = self,
      name: 'modifyIncomingResponseHeader',

      action:: 'ADD',
      standardAddHeaderName:: 'CACHE_CONTROL',
      standardDeleteHeaderName:: 'CACHE_CONTROL',
      standardModifyHeaderName:: 'CACHE_CONTROL',
      standardPassHeaderName:: 'CACHE_CONTROL',
      customHeaderName:: null,
      headerValue:: null,
      newHeaderValue:: null,
      avoidDuplicateHeaders:: false,

      options: {
        [name]: _[name]
        for name in ['action', 'standardAddHeaderName', 'standardDeleteHeaderName', 'standardModifyHeaderName', 'standardPassHeaderName', 'customHeaderName', 'headerValue', 'newHeaderValue', 'avoidDuplicateHeaders']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    modifyOutgoingRequestHeader: {
      local _ = self,
      name: 'modifyOutgoingRequestHeader',

      action:: 'ADD',
      standardAddHeaderName:: 'USER_AGENT',
      standardDeleteHeaderName:: 'PRAGMA',
      standardModifyHeaderName:: 'USER_AGENT',
      customHeaderName:: null,
      headerValue:: null,
      newHeaderValue:: null,
      regexHeaderMatch:: null,
      regexHeaderReplace:: null,
      matchMultiple:: false,
      avoidDuplicateHeaders:: false,

      options: {
        [name]: _[name]
        for name in ['action', 'standardAddHeaderName', 'standardDeleteHeaderName', 'standardModifyHeaderName', 'customHeaderName', 'headerValue', 'newHeaderValue', 'regexHeaderMatch', 'regexHeaderReplace', 'matchMultiple', 'avoidDuplicateHeaders']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    modifyOutgoingResponseHeader: {
      local _ = self,
      name: 'modifyOutgoingResponseHeader',

      action:: 'ADD',
      standardAddHeaderName:: 'CACHE_CONTROL',
      standardDeleteHeaderName:: 'CACHE_CONTROL',
      standardModifyHeaderName:: 'CACHE_CONTROL',
      customHeaderName:: null,
      headerValue:: null,
      newHeaderValue:: null,
      regexHeaderMatch:: null,
      regexHeaderReplace:: null,
      matchMultiple:: false,
      avoidDuplicateHeaders:: false,

      options: {
        [name]: _[name]
        for name in ['action', 'standardAddHeaderName', 'standardDeleteHeaderName', 'standardModifyHeaderName', 'customHeaderName', 'headerValue', 'newHeaderValue', 'regexHeaderMatch', 'regexHeaderReplace', 'matchMultiple', 'avoidDuplicateHeaders']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    origin: {
      local _ = self,
      name: 'origin',

      originType:: 'CUSTOMER',
      netStorage:: null,
      originId:: null,
      hostname:: null,
      mslorigin:: null,
      saasType:: 'HOSTNAME',
      saasCnameEnabled:: false,
      saasCnameLevel:: 1,
      saasCookie:: null,
      saasQueryString:: null,
      saasRegex:: null,
      saasReplace:: null,
      saasSuffix:: null,
      forwardHostHeader:: 'REQUEST_HOST_HEADER',
      customForwardHostHeader:: null,
      cacheKeyHostname:: 'ORIGIN_HOSTNAME',
      useUniqueCacheKey:: false,
      compress:: true,
      enableTrueClientIp:: false,
      trueClientIpHeader:: 'True-Client-IP',
      trueClientIpClientSetting:: false,
      verificationMode:: 'PLATFORM_SETTINGS',
      originSni:: true,
      customValidCnValues:: ['{{Origin Hostname}}', '{{Forward Host Header}}'],
      originCertsToHonor:: 'STANDARD_CERTIFICATE_AUTHORITIES',
      standardCertificateAuthorities:: ['akamai-permissive'],
      customCertificateAuthorities:: [],
      customCertificates:: [],
      httpPort:: 80,
      httpsPort:: 443,

      options: {
        [name]: _[name]
        for name in ['originType', 'netStorage', 'originId', 'hostname', 'mslorigin', 'saasType', 'saasCnameEnabled', 'saasCnameLevel', 'saasCookie', 'saasQueryString', 'saasRegex', 'saasReplace', 'saasSuffix', 'forwardHostHeader', 'customForwardHostHeader', 'cacheKeyHostname', 'useUniqueCacheKey', 'compress', 'enableTrueClientIp', 'trueClientIpHeader', 'trueClientIpClientSetting', 'verificationMode', 'originSni', 'customValidCnValues', 'originCertsToHonor', 'standardCertificateAuthorities', 'customCertificateAuthorities', 'customCertificates', 'httpPort', 'httpsPort']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    originCharacteristics: {
      local _ = self,
      name: 'originCharacteristics',

      country:: 'UNKNOWN',
      directConnectGeo:: null,
      authenticationMethod:: 'AUTOMATIC',
      encodingVersion:: 5,
      useCustomSignString:: false,
      customSignString:: null,
      secretKey:: null,
      nonce:: null,
      mslkey:: null,
      mslname:: null,
      gcsAccessKeyId:: null,
      gcsSecretKey:: null,
      gcsBucket:: null,
      awsv4AccessKeyId:: null,
      awsv4SecretKey:: null,
      awsv4Region:: null,
      awsv4Host:: null,
      awsv4Service:: null,

      options: {
        [name]: _[name]
        for name in ['country', 'directConnectGeo', 'authenticationMethod', 'encodingVersion', 'useCustomSignString', 'customSignString', 'secretKey', 'nonce', 'mslkey', 'mslname', 'gcsAccessKeyId', 'gcsSecretKey', 'gcsBucket', 'awsv4AccessKeyId', 'awsv4SecretKey', 'awsv4Region', 'awsv4Host', 'awsv4Service']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    persistentClientConnection: {
      local _ = self,
      name: 'persistentClientConnection',

      enabled:: true,
      timeout:: '500s',

      options: {
        [name]: _[name]
        for name in ['enabled', 'timeout']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    persistentConnection: {
      local _ = self,
      name: 'persistentConnection',

      enabled:: true,
      timeout:: '5m',

      options: {
        [name]: _[name]
        for name in ['enabled', 'timeout']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    personallyIdentifiableInformation: {
      local _ = self,
      name: 'personallyIdentifiableInformation',

      enabled:: true,

      options: {
        [name]: _[name]
        for name in ['enabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    phasedRelease: {
      local _ = self,
      name: 'phasedRelease',

      enabled:: true,
      cloudletPolicy:: null,
      label:: null,
      populationCookieType:: 'NONE',
      populationExpirationDate:: null,
      populationDuration:: '300s',
      populationRefresh:: false,
      failoverEnabled:: false,
      failoverResponseCode:: null,
      failoverDuration:: 30,

      options: {
        [name]: _[name]
        for name in ['enabled', 'cloudletPolicy', 'label', 'populationCookieType', 'populationExpirationDate', 'populationDuration', 'populationRefresh', 'failoverEnabled', 'failoverResponseCode', 'failoverDuration']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    preconnect: {
      local _ = self,
      name: 'preconnect',

      preconnectlist:: null,

      options: {
        [name]: _[name]
        for name in ['preconnectlist']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    predictivePrefetching: {
      local _ = self,
      name: 'predictivePrefetching',

      enabled:: true,
      accuracyTarget:: 'MEDIUM',

      options: {
        [name]: _[name]
        for name in ['enabled', 'accuracyTarget']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    prefetch: {
      local _ = self,
      name: 'prefetch',

      enabled:: true,

      options: {
        [name]: _[name]
        for name in ['enabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    prefetchable: {
      local _ = self,
      name: 'prefetchable',

      enabled:: true,

      options: {
        [name]: _[name]
        for name in ['enabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    prefreshCache: {
      local _ = self,
      name: 'prefreshCache',

      enabled:: true,
      prefreshval:: 90,

      options: {
        [name]: _[name]
        for name in ['enabled', 'prefreshval']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    quicBeta: {
      local _ = self,
      name: 'quicBeta',

      enabled:: true,
      quicOfferPercentage:: 50,

      options: {
        [name]: _[name]
        for name in ['enabled', 'quicOfferPercentage']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    rapid: {
      local _ = self,
      name: 'rapid',

      enabled:: true,

      options: {
        [name]: _[name]
        for name in ['enabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    readTimeout: {
      local _ = self,
      name: 'readTimeout',

      value:: '120s',

      options: {
        [name]: _[name]
        for name in ['value']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    realUserMonitoring: {
      local _ = self,
      name: 'realUserMonitoring',

      enabled:: true,

      options: {
        [name]: _[name]
        for name in ['enabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    redirect: {
      local _ = self,
      name: 'redirect',

      mobileDefaultChoice:: 'DEFAULT',
      destinationProtocol:: 'SAME_AS_REQUEST',
      destinationHostname:: 'SAME_AS_REQUEST',
      destinationHostSubdomain:: null,
      destinationHostSibling:: null,
      destinationHostnameOther:: null,
      destinationPath:: 'OTHER',
      destinationPathPrefix:: null,
      destinationPathSuffixStatus:: 'NO_SUFFIX',
      destinationPathSuffix:: null,
      destinationPathOther:: null,
      queryString:: 'APPEND',
      responseCode:: 302,

      options: {
        [name]: _[name]
        for name in ['mobileDefaultChoice', 'destinationProtocol', 'destinationHostname', 'destinationHostSubdomain', 'destinationHostSibling', 'destinationHostnameOther', 'destinationPath', 'destinationPathPrefix', 'destinationPathSuffixStatus', 'destinationPathSuffix', 'destinationPathOther', 'queryString', 'responseCode']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    redirectplus: {
      local _ = self,
      name: 'redirectplus',

      enabled:: true,
      destination:: '{{builtin.AK_SCHEME}}://{{builtin.AK_HOST}}{{builtin.AK_PATH}}',
      responseCode:: 302,

      options: {
        [name]: _[name]
        for name in ['enabled', 'destination', 'responseCode']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    refererChecking: {
      local _ = self,
      name: 'refererChecking',

      enabled:: true,
      strict:: false,
      domains:: null,
      allowChildren:: true,

      options: {
        [name]: _[name]
        for name in ['enabled', 'strict', 'domains', 'allowChildren']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    removeQueryParameter: {
      local _ = self,
      name: 'removeQueryParameter',

      parameters:: null,

      options: {
        [name]: _[name]
        for name in ['parameters']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    removeVary: {
      local _ = self,
      name: 'removeVary',

      enabled:: true,

      options: {
        [name]: _[name]
        for name in ['enabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    report: {
      local _ = self,
      name: 'report',

      logHost:: true,
      logReferer:: false,
      logUserAgent:: false,
      logAcceptLanguage:: false,
      logCookies:: 'OFF',
      cookies:: null,
      logCustomLogField:: false,
      customLogField:: '',

      options: {
        [name]: _[name]
        for name in ['logHost', 'logReferer', 'logUserAgent', 'logAcceptLanguage', 'logCookies', 'cookies', 'logCustomLogField', 'customLogField']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    requestControl: {
      local _ = self,
      name: 'requestControl',

      enabled:: true,
      cloudletPolicy:: null,
      enableBranded403:: false,
      branded403StatusCode:: 403,
      netStorage:: null,
      branded403File:: null,
      branded403Url:: null,
      brandedDenyCacheTtl:: 5,

      options: {
        [name]: _[name]
        for name in ['enabled', 'cloudletPolicy', 'enableBranded403', 'branded403StatusCode', 'netStorage', 'branded403File', 'branded403Url', 'brandedDenyCacheTtl']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    resourceOptimizer: {
      local _ = self,
      name: 'resourceOptimizer',

      enabled:: true,

      options: {
        [name]: _[name]
        for name in ['enabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    resourceOptimizerExtendedCompatibility: {
      local _ = self,
      name: 'resourceOptimizerExtendedCompatibility',

      enabled:: true,
      enableAllFeatures:: true,

      options: {
        [name]: _[name]
        for name in ['enabled', 'enableAllFeatures']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    responseCode: {
      local _ = self,
      name: 'responseCode',

      statusCode:: '200',
      override206:: false,

      options: {
        [name]: _[name]
        for name in ['statusCode', 'override206']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    responseCookie: {
      local _ = self,
      name: 'responseCookie',

      cookieName:: null,
      enabled:: true,
      type:: 'FIXED',
      value:: null,
      format:: 'AKAMAI',
      defaultDomain:: true,
      defaultPath:: true,
      domain:: null,
      path:: '/',
      expires:: 'ON_BROWSER_CLOSE',
      expirationDate:: null,
      duration:: null,
      secure:: false,

      options: {
        [name]: _[name]
        for name in ['cookieName', 'enabled', 'type', 'value', 'format', 'defaultDomain', 'defaultPath', 'domain', 'path', 'expires', 'expirationDate', 'duration', 'secure']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    returnCacheStatus: {
      local _ = self,
      name: 'returnCacheStatus',

      responseHeaderName:: 'Akamai-Cache-Status',

      options: {
        [name]: _[name]
        for name in ['responseHeaderName']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    rewriteUrl: {
      local _ = self,
      name: 'rewriteUrl',

      behavior:: 'REPLACE',
      match:: null,
      matchRegex:: null,
      targetRegex:: null,
      targetPath:: null,
      targetPathPrepend:: null,
      targetUrl:: null,
      matchMultiple:: false,
      keepQueryString:: true,

      options: {
        [name]: _[name]
        for name in ['behavior', 'match', 'matchRegex', 'targetRegex', 'targetPath', 'targetPathPrepend', 'targetUrl', 'matchMultiple', 'keepQueryString']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    rumCustom: {
      local _ = self,
      name: 'rumCustom',

      rumSampleRate:: 5,
      rumGroupName:: null,

      options: {
        [name]: _[name]
        for name in ['rumSampleRate', 'rumGroupName']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    saasDefinitions: {
      local _ = self,
      name: 'saasDefinitions',

      customerAction:: 'PATH',
      customerCnameEnabled:: false,
      customerCnameLevel:: 1,
      customerCookie:: null,
      customerQueryString:: null,
      customerRegex:: null,
      customerReplace:: null,
      applicationAction:: 'PATH',
      applicationCnameEnabled:: false,
      applicationCnameLevel:: 1,
      applicationCookie:: null,
      applicationQueryString:: null,
      applicationRegex:: null,
      applicationReplace:: null,
      usersAction:: 'COOKIE',
      usersCnameEnabled:: false,
      usersCnameLevel:: 1,
      usersCookie:: null,
      usersQueryString:: null,
      usersRegex:: null,
      usersReplace:: null,

      options: {
        [name]: _[name]
        for name in ['customerAction', 'customerCnameEnabled', 'customerCnameLevel', 'customerCookie', 'customerQueryString', 'customerRegex', 'customerReplace', 'applicationAction', 'applicationCnameEnabled', 'applicationCnameLevel', 'applicationCookie', 'applicationQueryString', 'applicationRegex', 'applicationReplace', 'usersAction', 'usersCnameEnabled', 'usersCnameLevel', 'usersCookie', 'usersQueryString', 'usersRegex', 'usersReplace']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    salesForceCommerceCloudClient: {
      local _ = self,
      name: 'salesForceCommerceCloudClient',

      enabled:: true,
      connectorId:: null,
      originType:: 'DEFAULT',
      sf3cOriginHost:: null,
      originHostHeader:: 'DEFAULT',
      sf3cOriginHostHeader:: null,
      allowOverrideOriginCacheKey:: false,

      options: {
        [name]: _[name]
        for name in ['enabled', 'connectorId', 'originType', 'sf3cOriginHost', 'originHostHeader', 'sf3cOriginHostHeader', 'allowOverrideOriginCacheKey']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    salesForceCommerceCloudProvider: {
      local _ = self,
      name: 'salesForceCommerceCloudProvider',

      enabled:: true,

      options: {
        [name]: _[name]
        for name in ['enabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    salesForceCommerceCloudProviderHostHeader: {
      local _ = self,
      name: 'salesForceCommerceCloudProviderHostHeader',

      hostHeaderSource:: 'PROPERTY',

      options: {
        [name]: _[name]
        for name in ['hostHeaderSource']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    scheduleInvalidation: {
      local _ = self,
      name: 'scheduleInvalidation',

      start:: null,
      repeat:: false,
      repeatInterval:: '1d',
      refreshMethod:: 'INVALIDATE',

      options: {
        [name]: _[name]
        for name in ['start', 'repeat', 'repeatInterval', 'refreshMethod']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    scriptManagement: {
      local _ = self,
      name: 'scriptManagement',

      enabled:: true,
      serviceworker:: 'YES_SERVICE_WORKER',
      timestamp:: 0,

      options: {
        [name]: _[name]
        for name in ['enabled', 'serviceworker', 'timestamp']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    setVariable: {
      local _ = self,
      name: 'setVariable',

      variableName:: null,
      valueSource:: 'EXPRESSION',
      variableValue:: null,
      extractLocation:: 'CLIENT_REQUEST_HEADER',
      certificateFieldName:: 'KEY_LENGTH',
      headerName:: null,
      responseHeaderName:: null,
      setCookieName:: null,
      cookieName:: null,
      locationId:: 'COUNTRY_CODE',
      pathComponentOffset:: null,
      queryParameterName:: null,
      generator:: 'RAND',
      numberOfBytes:: 16,
      minRandomNumber:: '0',
      maxRandomNumber:: '4294967295',
      transform:: 'NONE',
      operandOne:: null,
      algorithm:: 'ALG_3DES',
      encryptionKey:: null,
      initializationVector:: null,
      encryptionMode:: 'CBC',
      nonce:: null,
      prependBytes:: true,
      formatString:: null,
      paramName:: null,
      separator:: null,
      min:: 0,
      max:: 4294967294,
      hmacKey:: null,
      hmacAlgorithm:: 'SHA1',
      ipVersion:: 'IPV4',
      ipv6Prefix:: 128,
      ipv4Prefix:: 32,
      subString:: null,
      regex:: null,
      replacement:: null,
      caseSensitive:: true,
      globalSubstitution:: false,
      startIndex:: null,
      endIndex:: null,
      exceptChars:: null,
      forceChars:: null,
      deviceProfile:: 'IS_MOBILE',

      options: {
        [name]: _[name]
        for name in ['variableName', 'valueSource', 'variableValue', 'extractLocation', 'certificateFieldName', 'headerName', 'responseHeaderName', 'setCookieName', 'cookieName', 'locationId', 'pathComponentOffset', 'queryParameterName', 'generator', 'numberOfBytes', 'minRandomNumber', 'maxRandomNumber', 'transform', 'operandOne', 'algorithm', 'encryptionKey', 'initializationVector', 'encryptionMode', 'nonce', 'prependBytes', 'formatString', 'paramName', 'separator', 'min', 'max', 'hmacKey', 'hmacAlgorithm', 'ipVersion', 'ipv6Prefix', 'ipv4Prefix', 'subString', 'regex', 'replacement', 'caseSensitive', 'globalSubstitution', 'startIndex', 'endIndex', 'exceptChars', 'forceChars', 'deviceProfile']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    shutr: {
      local _ = self,
      name: 'shutr',


      options: {
        [name]: _[name]
        for name in []
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    simulateErrorCode: {
      local _ = self,
      name: 'simulateErrorCode',

      errorType:: 'ERR_DNS_TIMEOUT',
      timeout:: '5s',

      options: {
        [name]: _[name]
        for name in ['errorType', 'timeout']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    siteShield: {
      local _ = self,
      name: 'siteShield',

      ssmap:: null,

      options: {
        [name]: _[name]
        for name in ['ssmap']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    sureRoute: {
      local _ = self,
      name: 'sureRoute',

      enabled:: true,
      type:: 'PERFORMANCE',
      customMap:: null,
      testObjectUrl:: null,
      toHostStatus:: 'INCOMING_HH',
      toHost:: null,
      raceStatTtl:: '30m',
      forceSslForward:: false,
      enableCustomKey:: false,
      customStatKey:: '',

      options: {
        [name]: _[name]
        for name in ['enabled', 'type', 'customMap', 'testObjectUrl', 'toHostStatus', 'toHost', 'raceStatTtl', 'forceSslForward', 'enableCustomKey', 'customStatKey']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    teaLeaf: {
      local _ = self,
      name: 'teaLeaf',

      enabled:: true,
      limitToDynamic:: true,
      ibmCustomerId:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'limitToDynamic', 'ibmCustomerId']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    tieredDistribution: {
      local _ = self,
      name: 'tieredDistribution',

      enabled:: true,
      tieredDistributionMap:: 'CH2',

      options: {
        [name]: _[name]
        for name in ['enabled', 'tieredDistributionMap']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    timeout: {
      local _ = self,
      name: 'timeout',

      value:: '5s',

      options: {
        [name]: _[name]
        for name in ['value']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    validateEntityTag: {
      local _ = self,
      name: 'validateEntityTag',

      enabled:: true,

      options: {
        [name]: _[name]
        for name in ['enabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    verifyTokenAuthorization: {
      local _ = self,
      name: 'verifyTokenAuthorization',

      useAdvanced:: false,
      location:: 'COOKIE',
      locationId:: '__token__',
      algorithm:: 'SHA256',
      escapeHmacInputs:: true,
      ignoreQueryString:: false,
      key:: null,
      transitionKey:: null,
      salt:: null,
      failureResponse:: true,

      options: {
        [name]: _[name]
        for name in ['useAdvanced', 'location', 'locationId', 'algorithm', 'escapeHmacInputs', 'ignoreQueryString', 'key', 'transitionKey', 'salt', 'failureResponse']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    visitorPrioritization: {
      local _ = self,
      name: 'visitorPrioritization',

      enabled:: true,
      cloudletPolicy:: null,
      userIdentificationByCookie:: false,
      userIdentificationKeyCookie:: null,
      userIdentificationByHeaders:: false,
      userIdentificationKeyHeaders:: null,
      userIdentificationByIp:: false,
      userIdentificationByParams:: false,
      userIdentificationKeyParams:: null,
      allowedUserCookieEnabled:: true,
      allowedUserCookieLabel:: null,
      allowedUserCookieDuration:: 300,
      allowedUserCookieRefresh:: true,
      allowedUserCookieAdvanced:: false,
      allowedUserCookieAutomaticSalt:: true,
      allowedUserCookieSalt:: null,
      allowedUserCookieDomainType:: 'CUSTOMER',
      allowedUserCookieDomain:: null,
      allowedUserCookieHttpOnly:: false,
      allowedUserCookieSecure:: false,
      waitingRoomCookieEnabled:: true,
      waitingRoomCookieShareLabel:: true,
      waitingRoomCookieLabel:: null,
      waitingRoomCookieDuration:: 30,
      waitingRoomCookieAdvanced:: false,
      waitingRoomCookieAutomaticSalt:: true,
      waitingRoomCookieSalt:: null,
      waitingRoomCookieDomainType:: 'CUSTOMER',
      waitingRoomCookieDomain:: null,
      waitingRoomCookieHttpOnly:: false,
      waitingRoomCookieSecure:: false,
      waitingRoomStatusCode:: 200,
      waitingRoomUseCpCode:: false,
      waitingRoomCpCode:: null,
      waitingRoomNetStorage:: null,
      waitingRoomDirectory:: null,
      waitingRoomCacheTtl:: 5,

      options: {
        [name]: _[name]
        for name in ['enabled', 'cloudletPolicy', 'userIdentificationByCookie', 'userIdentificationKeyCookie', 'userIdentificationByHeaders', 'userIdentificationKeyHeaders', 'userIdentificationByIp', 'userIdentificationByParams', 'userIdentificationKeyParams', 'allowedUserCookieEnabled', 'allowedUserCookieLabel', 'allowedUserCookieDuration', 'allowedUserCookieRefresh', 'allowedUserCookieAdvanced', 'allowedUserCookieAutomaticSalt', 'allowedUserCookieSalt', 'allowedUserCookieDomainType', 'allowedUserCookieDomain', 'allowedUserCookieHttpOnly', 'allowedUserCookieSecure', 'waitingRoomCookieEnabled', 'waitingRoomCookieShareLabel', 'waitingRoomCookieLabel', 'waitingRoomCookieDuration', 'waitingRoomCookieAdvanced', 'waitingRoomCookieAutomaticSalt', 'waitingRoomCookieSalt', 'waitingRoomCookieDomainType', 'waitingRoomCookieDomain', 'waitingRoomCookieHttpOnly', 'waitingRoomCookieSecure', 'waitingRoomStatusCode', 'waitingRoomUseCpCode', 'waitingRoomCpCode', 'waitingRoomNetStorage', 'waitingRoomDirectory', 'waitingRoomCacheTtl']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    watermarkUrl: {
      local _ = self,
      name: 'watermarkUrl',

      token:: null,
      imageUrl:: null,

      options: {
        [name]: _[name]
        for name in ['token', 'imageUrl']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    webApplicationFirewall: {
      local _ = self,
      name: 'webApplicationFirewall',

      firewallConfiguration:: null,

      options: {
        [name]: _[name]
        for name in ['firewallConfiguration']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    webSockets: {
      local _ = self,
      name: 'webSockets',

      enabled:: true,

      options: {
        [name]: _[name]
        for name in ['enabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    webdav: {
      local _ = self,
      name: 'webdav',

      enabled:: false,

      options: {
        [name]: _[name]
        for name in ['enabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
  },
  criteria: {
    advancedImMatch: {
      local _ = self,
      name: 'advancedImMatch',

      imRequest:: 'FROM_IM',

      options: {
        [name]: _[name]
        for name in ['imRequest']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    bucket: {
      local _ = self,
      name: 'bucket',

      percentage:: 100,

      options: {
        [name]: _[name]
        for name in ['percentage']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    cacheability: {
      local _ = self,
      name: 'cacheability',

      matchOperator:: 'IS',
      value:: 'CACHEABLE',

      options: {
        [name]: _[name]
        for name in ['matchOperator', 'value']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    chinaCdnRegion: {
      local _ = self,
      name: 'chinaCdnRegion',

      matchOperator:: 'IS',

      options: {
        [name]: _[name]
        for name in ['matchOperator']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    clientCertificate: {
      local _ = self,
      name: 'clientCertificate',

      isCertificatePresent:: true,

      options: {
        [name]: _[name]
        for name in ['isCertificatePresent']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    clientIp: {
      local _ = self,
      name: 'clientIp',

      matchOperator:: 'IS_ONE_OF',
      values:: null,
      useHeaders:: false,

      options: {
        [name]: _[name]
        for name in ['matchOperator', 'values', 'useHeaders']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    clientIpVersion: {
      local _ = self,
      name: 'clientIpVersion',

      value:: 'IPV4',
      useXForwardedFor:: false,

      options: {
        [name]: _[name]
        for name in ['value', 'useXForwardedFor']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    cloudletsOrigin: {
      local _ = self,
      name: 'cloudletsOrigin',

      originId:: null,

      options: {
        [name]: _[name]
        for name in ['originId']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    contentDeliveryNetwork: {
      local _ = self,
      name: 'contentDeliveryNetwork',

      matchOperator:: 'IS',
      network:: 'STAGING',

      options: {
        [name]: _[name]
        for name in ['matchOperator', 'network']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    contentType: {
      local _ = self,
      name: 'contentType',

      matchOperator:: 'IS_ONE_OF',
      values:: ['text/html*'],
      matchWildcard:: true,
      matchCaseSensitive:: false,

      options: {
        [name]: _[name]
        for name in ['matchOperator', 'values', 'matchWildcard', 'matchCaseSensitive']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    deviceCharacteristic: {
      local _ = self,
      name: 'deviceCharacteristic',

      characteristic:: 'IS_WIRELESS_DEVICE',
      stringMatchOperator:: 'MATCHES_ONE_OF',
      numericMatchOperator:: 'IS',
      versionMatchOperator:: 'IS',
      booleanValue:: true,
      stringValue:: null,
      numericValue:: null,
      versionValue:: null,
      matchCaseSensitive:: false,
      matchWildcard:: true,

      options: {
        [name]: _[name]
        for name in ['characteristic', 'stringMatchOperator', 'numericMatchOperator', 'versionMatchOperator', 'booleanValue', 'stringValue', 'numericValue', 'versionValue', 'matchCaseSensitive', 'matchWildcard']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    fileExtension: {
      local _ = self,
      name: 'fileExtension',

      matchOperator:: 'IS_ONE_OF',
      values:: null,
      matchCaseSensitive:: false,

      options: {
        [name]: _[name]
        for name in ['matchOperator', 'values', 'matchCaseSensitive']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    filename: {
      local _ = self,
      name: 'filename',

      matchOperator:: 'IS_ONE_OF',
      values:: null,
      matchCaseSensitive:: true,

      options: {
        [name]: _[name]
        for name in ['matchOperator', 'values', 'matchCaseSensitive']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    hostname: {
      local _ = self,
      name: 'hostname',

      matchOperator:: 'IS_ONE_OF',
      values:: null,

      options: {
        [name]: _[name]
        for name in ['matchOperator', 'values']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    matchAdvanced: {
      local _ = self,
      name: 'matchAdvanced',

      description:: null,
      openXml:: null,
      closeXml:: null,

      options: {
        [name]: _[name]
        for name in ['description', 'openXml', 'closeXml']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    matchCpCode: {
      local _ = self,
      name: 'matchCpCode',

      value:: null,

      options: {
        [name]: _[name]
        for name in ['value']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    matchResponseCode: {
      local _ = self,
      name: 'matchResponseCode',

      matchOperator:: 'IS_ONE_OF',
      values:: null,
      lowerBound:: null,
      upperBound:: null,

      options: {
        [name]: _[name]
        for name in ['matchOperator', 'values', 'lowerBound', 'upperBound']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    matchVariable: {
      local _ = self,
      name: 'matchVariable',

      variableName:: null,
      matchOperator:: 'IS_ONE_OF',
      variableValues:: null,
      variableExpression:: null,
      lowerBound:: null,
      upperBound:: null,
      matchWildcard:: false,
      matchCaseSensitive:: true,

      options: {
        [name]: _[name]
        for name in ['variableName', 'matchOperator', 'variableValues', 'variableExpression', 'lowerBound', 'upperBound', 'matchWildcard', 'matchCaseSensitive']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    metadataStage: {
      local _ = self,
      name: 'metadataStage',

      matchOperator:: 'IS',
      value:: 'client-request',

      options: {
        [name]: _[name]
        for name in ['matchOperator', 'value']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    originTimeout: {
      local _ = self,
      name: 'originTimeout',

      matchOperator:: 'ORIGIN_TIMED_OUT',

      options: {
        [name]: _[name]
        for name in ['matchOperator']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    path: {
      local _ = self,
      name: 'path',

      matchOperator:: 'MATCHES_ONE_OF',
      values:: null,
      matchCaseSensitive:: false,

      options: {
        [name]: _[name]
        for name in ['matchOperator', 'values', 'matchCaseSensitive']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    queryStringParameter: {
      local _ = self,
      name: 'queryStringParameter',

      parameterName:: null,
      matchOperator:: 'IS_ONE_OF',
      values:: null,
      lowerBound:: null,
      upperBound:: null,
      matchWildcardName:: false,
      matchCaseSensitiveName:: true,
      matchWildcardValue:: false,
      matchCaseSensitiveValue:: true,
      escapeValue:: false,

      options: {
        [name]: _[name]
        for name in ['parameterName', 'matchOperator', 'values', 'lowerBound', 'upperBound', 'matchWildcardName', 'matchCaseSensitiveName', 'matchWildcardValue', 'matchCaseSensitiveValue', 'escapeValue']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    random: {
      local _ = self,
      name: 'random',

      bucket:: 100,

      options: {
        [name]: _[name]
        for name in ['bucket']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    regularExpression: {
      local _ = self,
      name: 'regularExpression',

      matchString:: '',
      regex:: '',
      caseSensitive:: true,

      options: {
        [name]: _[name]
        for name in ['matchString', 'regex', 'caseSensitive']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    requestCookie: {
      local _ = self,
      name: 'requestCookie',

      cookieName:: null,
      matchOperator:: 'IS',
      value:: null,
      lowerBound:: null,
      upperBound:: null,
      matchWildcardName:: false,
      matchCaseSensitiveName:: true,
      matchWildcardValue:: false,
      matchCaseSensitiveValue:: true,

      options: {
        [name]: _[name]
        for name in ['cookieName', 'matchOperator', 'value', 'lowerBound', 'upperBound', 'matchWildcardName', 'matchCaseSensitiveName', 'matchWildcardValue', 'matchCaseSensitiveValue']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    requestHeader: {
      local _ = self,
      name: 'requestHeader',

      headerName:: null,
      matchOperator:: 'IS_ONE_OF',
      values:: null,
      matchWildcardName:: false,
      matchWildcardValue:: false,
      matchCaseSensitiveValue:: true,

      options: {
        [name]: _[name]
        for name in ['headerName', 'matchOperator', 'values', 'matchWildcardName', 'matchWildcardValue', 'matchCaseSensitiveValue']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    requestMethod: {
      local _ = self,
      name: 'requestMethod',

      matchOperator:: 'IS',
      value:: 'GET',

      options: {
        [name]: _[name]
        for name in ['matchOperator', 'value']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    requestProtocol: {
      local _ = self,
      name: 'requestProtocol',

      value:: 'HTTP',

      options: {
        [name]: _[name]
        for name in ['value']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    requestType: {
      local _ = self,
      name: 'requestType',

      matchOperator:: 'IS',
      value:: 'CLIENT_REQ',

      options: {
        [name]: _[name]
        for name in ['matchOperator', 'value']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    responseHeader: {
      local _ = self,
      name: 'responseHeader',

      headerName:: null,
      matchOperator:: 'IS_ONE_OF',
      values:: null,
      lowerBound:: null,
      upperBound:: null,
      matchWildcardName:: false,
      matchWildcardValue:: false,
      matchCaseSensitiveValue:: true,

      options: {
        [name]: _[name]
        for name in ['headerName', 'matchOperator', 'values', 'lowerBound', 'upperBound', 'matchWildcardName', 'matchWildcardValue', 'matchCaseSensitiveValue']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    time: {
      local _ = self,
      name: 'time',

      matchOperator:: 'BEGINNING',
      repeatInterval:: '1d',
      repeatDuration:: '1d',
      lastingDuration:: '1d',
      lastingDate:: null,
      repeatBeginDate:: null,
      applyDaylightSavingsTime:: true,
      beginDate:: null,
      endDate:: null,

      options: {
        [name]: _[name]
        for name in ['matchOperator', 'repeatInterval', 'repeatDuration', 'lastingDuration', 'lastingDate', 'repeatBeginDate', 'applyDaylightSavingsTime', 'beginDate', 'endDate']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    tokenAuthorization: {
      local _ = self,
      name: 'tokenAuthorization',

      matchOperator:: 'IS_ANY_FAILURE',
      statusList:: ['INVALID_HMAC_KEY', 'INVALID_DELIMITER', 'INVALID_ACL_DELIMITER', 'INVALID_IP', 'INVALID_URL', 'MISSING_EXPIRATION_TIME', 'NEED_URL_XOR_ACL', 'UNSUPPORTED_VERSION', 'MISSING_TOKEN', 'MISSING_URL', 'INVALID_TOKEN', 'INVALID_HMAC', 'TOKEN_NOT_VALID_YET', 'EXPIRED_TOKEN', 'UNAUTHORIZED_IP', 'UNAUTHORIZED_URL', 'INVALID_EXPIRATION_TIME'],

      options: {
        [name]: _[name]
        for name in ['matchOperator', 'statusList']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    userAgent: {
      local _ = self,
      name: 'userAgent',

      matchOperator:: 'IS_ONE_OF',
      values:: null,
      matchWildcard:: true,
      matchCaseSensitive:: false,

      options: {
        [name]: _[name]
        for name in ['matchOperator', 'values', 'matchWildcard', 'matchCaseSensitive']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    userLocation: {
      local _ = self,
      name: 'userLocation',

      field:: 'COUNTRY',
      matchOperator:: 'IS_ONE_OF',
      countryValues:: null,
      continentValues:: null,
      regionValues:: null,
      checkIps:: 'BOTH',
      useOnlyFirstXForwardedForIp:: false,

      options: {
        [name]: _[name]
        for name in ['field', 'matchOperator', 'countryValues', 'continentValues', 'regionValues', 'checkIps', 'useOnlyFirstXForwardedForIp']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    userNetwork: {
      local _ = self,
      name: 'userNetwork',

      field:: 'NETWORK',
      matchOperator:: 'IS_ONE_OF',
      networkTypeValues:: null,
      networkValues:: null,
      bandwidthValues:: null,
      checkIps:: 'BOTH',
      useOnlyFirstXForwardedForIp:: false,

      options: {
        [name]: _[name]
        for name in ['field', 'matchOperator', 'networkTypeValues', 'networkValues', 'bandwidthValues', 'checkIps', 'useOnlyFirstXForwardedForIp']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    variableError: {
      local _ = self,
      name: 'variableError',

      result:: true,
      variableNames:: null,

      options: {
        [name]: _[name]
        for name in ['result', 'variableNames']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
  },
}

