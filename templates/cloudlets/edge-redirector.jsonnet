local globals = std.extVar('globals');

{
  cloudletType: 'ER',
  groupId: std.parseInt(globals.groupId),
  description: 'Main redirect rules',
  matchRules: [
    {
      type: 'erMatchRule',
      name: 'Redirect images',
      matchURL: '/images/*',
      statusCode: 302,
      redirectURL: '/static/images5/*',
      useIncomingQueryString: true,
      useRelativeUrl: 'relative_url',
    },
    {
      type: 'erMatchRule',
      name: 'Redirect images',
      matchURL: '/css/*',
      statusCode: 302,
      redirectURL: '/static/css/*',
      useIncomingQueryString: true,
      useRelativeUrl: 'relative_url',
    },
  ],
}
