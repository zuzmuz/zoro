// TODO: replace HtmlBuilder with flow content when possible

@builtinTag(htmlBuildRules: "HtmlBuilder")
public struct P<Content: Tag>: BuiltinTag {}

@builtinTag()
public struct Hr: BuiltinTag {}

@builtinTag(htmlBuildRules: "HtmlBuilder")
public struct Pre<Content: Tag>: BuiltinTag {}

@builtinTag(htmlBuildRules: "HtmlBuilder")
public struct Blockquote<Content: Tag>: BuiltinTag {}

public protocol ListItem: BuiltinTag {}

@builtinTag(attributes: ["value"], htmlBuildRules: "HtmlBuilder")
public struct Li<Content: Tag>: ListItem {}


@resultBuilder
public enum ListBuilder {
    public static func buildBlock(_ content: any ListItem...) -> [any ListItem] {
        return content
    }
    public static func buildBlock<Content>(_ content: Content) -> Content where Content : ListItem {
        return content
    }
    public static func buildArray(_ components: [any ListItem]) -> [any ListItem] {
        return components
    }
}

// TODO: ListBuilder isn't used need to figure out best way to handle expressions

@builtinTag(attributes: ["reversed", "start", "type"], htmlBuildRules: "HtmlBuilder")
public struct Ol<Content: Tag>: BuiltinTag {}

@builtinTag(htmlBuildRules: "HtmlBuilder")
public struct Ul<Content: Tag>: BuiltinTag {}

@builtinTag(htmlBuildRules: "HtmlBuilder")
public struct Menu<Content: Tag>: BuiltinTag {}

// TODO: DL elements have their own content builder

@builtinTag(htmlBuildRules: "HtmlBuilder")
public struct Dl<Content: Tag>: BuiltinTag {}

@builtinTag(htmlBuildRules: "HtmlBuilder")
public struct Dt<Content: Tag>: BuiltinTag {}

@builtinTag(htmlBuildRules: "HtmlBuilder")
public struct Dd<Content: Tag>: BuiltinTag {}

@builtinTag(htmlBuildRules: "HtmlBuilder")
public struct Figure<Content: Tag>: BuiltinTag {}

@builtinTag(htmlBuildRules: "HtmlBuilder")
public struct Figcaption<Content: Tag>: BuiltinTag {}

@builtinTag(htmlBuildRules: "HtmlBuilder")
public struct Main<Content: Tag>: BuiltinTag {}

@builtinTag(htmlBuildRules: "HtmlBuilder")
public struct Search<Content: Tag>: BuiltinTag {}

@builtinTag(htmlBuildRules: "HtmlBuilder")
public struct Div<Content: Tag>: BuiltinTag {}
