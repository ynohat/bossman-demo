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
      redirectURL: '/static/images3/*',
      useIncomingQueryString: true,
      useRelativeUrl: 'relative_url',
    },
  ],
}
