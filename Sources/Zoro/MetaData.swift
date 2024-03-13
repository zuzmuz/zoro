/* contents
 Metadata content
 Flow content
 Sectioning content
 Heading content
 Phrasing content
 Embedded content
 Interactive content
 */

@resultBuilder
public enum MetaDataBuilder {
    public static func buildBlock(_ content: any MetaDataContent...) -> [any MetaDataContent] {
        return content
    }
    public static func buildBlock<Content>(_ content: Content) -> Content where Content: MetaDataContent {
        return content
    }
    public static func buildArray(_ components: [any MetaDataContent]) -> [any MetaDataContent] {
        return components
    }
}


public protocol MetaDataContent: BuiltinTag {}

#warning("implement head rules for content builder")
@builtinTag(htmlBuildRules: "HtmlBuilder")
public struct Head<Content: Tag>: BuiltinTag {}

@builtinTag(htmlBuildRules: "TextBuilder")
public struct Title<Content: Tag>: MetaDataContent {}

@builtinTag(attributes: ["href", "target"])
public struct Base: MetaDataContent {}

#warning("check sematincs for title attribute")
@builtinTag(attributes: ["href", 
                         "crossorigin",
                         "rel",
                         "media",
                         "integrety",
                         "hreflang",
                         "type",
                         "referrerpolicy",
                         "sizes",
                         "imagesrcset",
                         "imagesizes",
                         "as",
                         "blocking",
                         "color",
                         "disabled",
                         "fetchpriority"])
public struct Link: MetaDataContent {}

#warning("should handle - separated attributes")
@builtinTag(attributes: ["name", "content", "httpEquiv", "charset", "media"])
public struct Meta: MetaDataContent {}


@builtinTag(attributes: ["media", "blocking"], htmlBuildRules: "TextBuilder")
public struct Style<Content: Tag>: MetaDataContent {}




#warning("implement flow content builder for body")
@builtinTag(attributes: ["onafterprint",
                         "onbeforeprint",
                         "onbeforeunload",
                         "onhashchange",
                         "onlanguagechange",
                         "onmessage",
                         "onmessageerror",
                         "onoffline",
                         "ononline",
                         "onpageswap",
                         "onpagehide",
                         "onpagereveal",
                         "onpageshow",
                         "onpopstate",
                         "onrejectionhandled",
                         "onstorage",
                         "onunhandledrejection",
                         "onunload"],
            htmlBuildRules: "HtmlBuilder")
public struct Body<Content: Tag>: BuiltinTag {}

