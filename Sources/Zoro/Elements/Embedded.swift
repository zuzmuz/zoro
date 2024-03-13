

@builtinTag(htmlBuildRules: "HtmlBuilder")
public struct Picture<Content: Tag>: Tag {}

@builtinTag(attributes: [
    "type",
    "media",
    "src",
    "srcset",
    "sizes",
    "width",
    "height"
])
public struct Source: BuiltinTag {}

@builtinTag(attributes: [
    "alt",
    "src",
    "srcset",
    "sizes",
    "crossorigin",
    "usemap",
    "ismap",
    "width",
    "height",
    "referrerpolicy",
    "decoding",
    "loading",
    "fetchpriority"
])
public struct Img: BuiltinTag {}


@builtinTag(attributes: [
    "src",
    "srcdoc",
    "name",
    "sandbox",
    "allow",
    "allowfullscreen",
    "width",
    "height",
    "referrerpolicy",
    "loading",
])
public struct Iframe: BuiltinTag {}

@builtinTag(attributes: [
    "src",
    "type",
    "width",
    "height",
])
public struct Embed: BuiltinTag {}

@builtinTag(attributes: [
    "data",
    "type",
    "name",
    "form",
    "width",
    "height",
], htmlBuildRules: "HtmlBuilder")
public struct Object<Content: Tag>: BuiltinTag {}

@builtinTag(attributes: [
    "src",
    "crossorigin",
    "poster",
    "preload",
    "autoplay",
    "playsinline",
    "loop",
    "muted",
    "controls",
    "width",
    "height",
], htmlBuildRules: "HtmlBuilder")
public struct Video<Content: Tag>: BuiltinTag {}

@builtinTag(attributes: [
    "src",
    "crossorigin",
    "preload",
    "autoplay",
    "loop",
    "muted",
    "controls",
], htmlBuildRules: "HtmlBuilder")
public struct Audio<Content: Tag>: BuiltinTag {}


@builtinTag(attributes: [
    "kind",
    "src",
    "srclang",
    "label",
    "default",
])
public struct Track: BuiltinTag {}

@builtinTag(attributes: ["name"], htmlBuildRules: "HtmlBuilder")
public struct Map<Content: Tag>: BuiltinTag {}


@builtinTag(attributes: [
    "alt",
    "coords",
    "shape",
    "href",
    "target",
    "download",
    "ping",
    "rel",
    "referrerpolicy",
])
public struct Area: BuiltinTag {}
