
@builtinTag(attributes: [
    "src",
    "type",
    "nomodule",
    "async",
    "defer",
    "crossorigin",
    "integrity",
    "referrerpolicy",
    "blocking",
    "fetchpriority",
], htmlBuildRules: "TextBuilder")
public struct Script<Content: Tag>: BuiltinTag {}

@builtinTag(htmlBuildRules: "HtmlBuilder")
public struct Noscript<Content: Tag>: BuiltinTag {}


@builtinTag(attributes: [
    "shadowrootmode",
    "shadowrootdelegatefocus",
    "shadowrootclonable"], htmlBuildRules: "HtmlBuilder")
public struct Template<Content: Tag>: BuiltinTag {}


@builtinTag(attributes: ["name"], htmlBuildRules: "HtmlBuilder")
public struct Slot<Content: Tag>: BuiltinTag {}

@builtinTag(attributes: ["width", "height"], htmlBuildRules: "HtmlBuilder")
public struct Canvas<Content: Tag>: BuiltinTag {}
