// TODO: replace HtmlBuilder with phrasing content when possible

@builtinTag(attributes: ["href",
                         "target",
                         "download",
                         "ping",
                         "rel",
                         "hreflang",
                         "type",
                         "referrerpolicy"], htmlBuildRules: "HtmlBuilder")
public struct A<Content: Tag>: BuiltinTag {}

@builtinTag(htmlBuildRules: "HtmlBuilder")
public struct Em<Content: Tag>: BuiltinTag {}


@builtinTag(htmlBuildRules: "HtmlBuilder")
public struct Strong<Content: Tag>: BuiltinTag {}

@builtinTag(htmlBuildRules: "HtmlBuilder")
public struct Small<Content: Tag>: BuiltinTag {}

@builtinTag(htmlBuildRules: "HtmlBuilder")
public struct S<Content: Tag>: BuiltinTag {}

@builtinTag(htmlBuildRules: "HtmlBuilder")
public struct Cite<Content: Tag>: BuiltinTag {}

@builtinTag(attributes: ["cite"], htmlBuildRules: "HtmlBuilder")
public struct Q<Content: Tag>: BuiltinTag {}

@builtinTag(htmlBuildRules: "HtmlBuilder")
public struct Dfn<Content: Tag>: BuiltinTag {}

@builtinTag(htmlBuildRules: "HtmlBuilder")
public struct Abbr<Content: Tag>: BuiltinTag {}

@builtinTag(htmlBuildRules: "HtmlBuilder")
public struct Ruby<Content: Tag>: BuiltinTag {}

@builtinTag(htmlBuildRules: "HtmlBuilder")
public struct Rt<Content: Tag>: BuiltinTag {}

@builtinTag(htmlBuildRules: "TextBuilder")
public struct Rp<Content: Tag>: BuiltinTag {}

@builtinTag(attributes: ["value"], htmlBuildRules: "HtmlBuilder")
public struct Data<Content: Tag>: BuiltinTag {}

@builtinTag(attributes: ["datetime"], htmlBuildRules: "HtmlBuilder")
public struct Time<Content: Tag>: BuiltinTag {}

@builtinTag(htmlBuildRules: "HtmlBuilder")
public struct Code<Content: Tag>: BuiltinTag {}

@builtinTag(htmlBuildRules: "HtmlBuilder")
public struct Var<Content: Tag>: BuiltinTag {}

@builtinTag(htmlBuildRules: "HtmlBuilder")
public struct Samp<Content: Tag>: BuiltinTag {}

@builtinTag(htmlBuildRules: "HtmlBuilder")
public struct Kbd<Content: Tag>: BuiltinTag {}

@builtinTag(htmlBuildRules: "HtmlBuilder")
public struct Sub<Content: Tag>: BuiltinTag {}

@builtinTag(htmlBuildRules: "HtmlBuilder")
public struct Sup<Content: Tag>: BuiltinTag {}

@builtinTag(htmlBuildRules: "HtmlBuilder")
public struct I<Content: Tag>: BuiltinTag {}

@builtinTag(htmlBuildRules: "HtmlBuilder")
public struct B<Content: Tag>: BuiltinTag {}

@builtinTag(htmlBuildRules: "HtmlBuilder")
public struct U<Content: Tag>: BuiltinTag {}

@builtinTag(htmlBuildRules: "HtmlBuilder")
public struct Mark<Content: Tag>: BuiltinTag {}

@builtinTag(htmlBuildRules: "HtmlBuilder")
public struct Bdi<Content: Tag>: BuiltinTag {}

@builtinTag(htmlBuildRules: "HtmlBuilder")
public struct Bdo<Content: Tag>: BuiltinTag {}

@builtinTag(htmlBuildRules: "HtmlBuilder")
public struct Span<Content: Tag>: BuiltinTag {}

@builtinTag()
public struct Br: BuiltinTag {}

@builtinTag()
public struct Wbr: BuiltinTag {}
