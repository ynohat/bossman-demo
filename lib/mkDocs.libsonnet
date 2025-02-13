{
  fromProperty(name, rules, hostnames)::
    |||
      # Property: %s

      Product : %s
      Rule Format : %s

      ## Hostnames

      %s

      ## Rules

      %s
    ||| % [name, rules.productId, rules.ruleFormat, self.fromPropertyHostnames(hostnames), self.fromPropertyRule(rules.rules)],

  fromPropertyHostnames(hostnames)::
    std.join(
      "\n",
      [
        |||
          %s CNAME %s ; %s
        ||| % [hostname.cnameFrom, hostname.cnameTo, hostname.cnameType]
        for hostname in hostnames
      ]
    ),

  fromPropertyRule(rule, depth=1)::
    local headerMarkdown = std.repeat('#', depth+1);
    local commentsMarkdown = if std.objectHas(rule, 'comments') then rule.comments else '_no comments_';

    |||
      %s %s

      ```
      %s
      ```

      Criteria

      ```json
      %s
      ```

      Behaviors

      ```json
      %s
      ```

      %s
    ||| % [
      headerMarkdown,
      rule.name,
      commentsMarkdown,
      std.manifestJsonEx(if std.objectHas(rule, 'criteria') then rule.criteria else [], '  '),
      std.manifestJsonEx(if std.objectHas(rule, 'behaviors') then rule.behaviors else [], '  '),
      std.join(
        "\n",
        [
          self.fromPropertyRule(rule, depth+1)
          for rule in (
            if std.objectHas(rule, 'children')
            then rule.children
            else []
          )
        ]
      )
    ]
}