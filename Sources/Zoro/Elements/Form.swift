

@builtinTag(attributes: [
    "acceptCharset",
    "action",
    "autocomplete",
    "enctype",
    "method",
    "name",
    "novalidate",
    "target",
    "rel",
    ], htmlBuildRules: "HtmlBuilder")
public struct Form<Content: Tag>: BuiltinTag {}


@builtinTag(attributes: ["for"], htmlBuildRules: "HtmlBuilder")
public struct Label<Content: Tag>: BuiltinTag {}


// TODO: nice to have special enum for type attribute
@builtinTag(attributes: [
    "accept",
    "alt",
    "autocomplete",
    "checked",
    "dirname",
    "disabled",
    "form",
    "formaction",
    "formenctype",
    "formmethod",
    "formnovalidate",
    "formtarget",
    "height",
    "list",
    "max",
    "maxlength",
    "min",
    "minlength",
    "multiple",
    "name",
    "pattern",
    "placeholder",
    "popovertarget",
    "popovertargetaction",
    "readonly",
    "required",
    "size",
    "src",
    "step",
    "type",
    "value",
    "width"])
public struct Input: BuiltinTag {}


@builtinTag(attributes: [
    "disabled",
    "form",
    "formaction",
    "formenctype",
    "formmethod",
    "formnovalidate",
    "formtarget",
    "name",
    "popovertarget",
    "popovertargetaction",
    "type",
    "value"], htmlBuildRules: "HtmlBuilder")
public struct Button<Content: Tag>: BuiltinTag {}

// TODO: htmlBuildRules should be options
@builtinTag(attributes: [
    "autocomplete",
    "disabled",
    "form",
    "multiple",
    "name",
    "required",
    "size"], htmlBuildRules: "HtmlBuilder")
public struct Select<Content: Tag>: BuiltinTag {}

@builtinTag(htmlBuildRules: "HtmlBuilder")
public struct Datalist<Content: Tag>: BuiltinTag {}

@builtinTag(attributes: ["disabled", "label"], htmlBuildRules: "HtmlBuilder")
public struct Optgroup<Content: Tag>: BuiltinTag {}

@builtinTag(attributes: ["disabled", "label", "selected", "value"], htmlBuildRules: "HtmlBuilder")
public struct Option<Content: Tag>: BuiltinTag {}

@builtinTag(attributes: [
    "autocomplete",
    "cols",
    "dirname",
    "disabled",
    "form",
    "maxlength",
    "minlength",
    "name",
    "placeholder",
    "readonly",
    "required",
    "rows",
    "wrap"],
htmlBuildRules: "TextBuilder")
public struct Textarea<Content: Tag>: BuiltinTag {}

@builtinTag(attributes: ["for", "form", "name"], htmlBuildRules: "HtmlBuilder")
public struct Output<Content: Tag>: BuiltinTag {}

@builtinTag(attributes: ["value", "max"], htmlBuildRules: "HtmlBuilder")
public struct Progress<Content: Tag>: BuiltinTag {}

@builtinTag(attributes: [
    "value",
    "min",
    "max",
    "low",
    "high",
    "optimum"], htmlBuildRules: "HtmlBuilder")
public struct Meter<Content: Tag>: BuiltinTag {}

@builtinTag(attributes: ["disabled", "form", "name"], htmlBuildRules: "HtmlBuilder")
public struct Fieldset<Content: Tag>: BuiltinTag {}


@builtinTag(htmlBuildRules: "HtmlBuilder")
public struct Legend<Content: Tag>: BuiltinTag {}
