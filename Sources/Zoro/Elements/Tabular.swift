


@builtinTag(htmlBuildRules: "HtmlBuilder")
public struct Table<Content: Tag>: BuiltinTag {}

@builtinTag(htmlBuildRules: "HtmlBuilder")
public struct Caption<Content: Tag>: BuiltinTag {}

@builtinTag(attributes: ["span"], htmlBuildRules: "HtmlBuilder")
public struct Colgroup<Content: Tag>: BuiltinTag {}

@builtinTag(attributes: ["span"])
public struct Col: BuiltinTag {}

// TODO: table body special rules

@builtinTag(htmlBuildRules: "HtmlBuilder")
public struct Tbody<Content: Tag>: BuiltinTag {}

@builtinTag(htmlBuildRules: "HtmlBuilder")
public struct Thead<Content: Tag>: BuiltinTag {}

@builtinTag(htmlBuildRules: "HtmlBuilder")
public struct Tfoot<Content: Tag>: BuiltinTag {}

@builtinTag(htmlBuildRules: "HtmlBuilder")
public struct Tr<Content: Tag>: BuiltinTag {}

@builtinTag(attributes: [
    "colspan",
    "rowspan",
    "headers",
    "scope",
    "abbr",
], htmlBuildRules: "HtmlBuilder")
public struct Th<Content: Tag>: BuiltinTag {}

@builtinTag(attributes: [
    "colspan",
    "rowspan",
    "headers",
], htmlBuildRules: "HtmlBuilder")
public struct Td<Content: Tag>: BuiltinTag {}
