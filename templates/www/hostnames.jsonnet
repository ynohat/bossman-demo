local env = std.extVar('env');

[
  {
    cnameFrom: env.hostname,
    cnameTo: env.edgeHostname,
    cnameType: 'EDGE_HOSTNAME',
  },
]
