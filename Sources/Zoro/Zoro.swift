
@attached(member, names: arbitrary)
/// Macro to generate boilerplate code for all html elements,
macro builtinTag(
    attributes: [String]?=nil,
    htmlBuildRules: String?=nil) = #externalMacro(
    module: "ZoroMacros",
    type: "TagMacro"
)


/// Result Builders are used to create the swift dsl that generates Html
/// Any html builtin element or composite component that has a body
/// needs to define its result builder.
@resultBuilder
public enum HtmlBuilder {
    public static func buildBlock(_ content: any Tag...) -> [any Tag] {
        return content
    }
    public static func buildBlock<Content>(_ content: Content) -> Content where Content : Tag {
        return content
    }
    public static func buildArray(_ components: [any Tag]) -> [any Tag] {
        return components
    }
}

@resultBuilder
public enum TextBuilder {
    public static func buildBlock(_ content: String) -> String {
        return content
    }
    
    /// This method forces the ``TextBuilder`` to contain exactly the proper content
    /// and shows a meaningful error message
    @available(*, unavailable, message: "The content of the tag should be a String")
    public static func buildBlock<each Content>(_ content: repeat each Content) -> Never {
        fatalError()
    }

}


/// A type that represents an Html element or a view component.
///
/// All primitive Html tags implements this protocol, and you can
/// create your own custom components by conforming to the `Tag` protocol.
///
/// Implement the required ``Tag/body`` computed property
/// to provide the content of your custom html component.
///
///     struct Component: Tag {
///         var body: some Tag {
///             P { "Hello, World!" }
///         }
///     }
///
/// Assemble the component's body by combining one or more
/// of the built-in html tags. Similarly to SwiftUI's views.
///
/// The render function can be implemented instead of the body,
/// to generate the representing Html string of the component.
/// In case the render function is implemented, the body type
/// should be ``Never`` and it should return a ``fatalError()``
public protocol Tag {
    associatedtype ContentModel : Tag
    
    @HtmlBuilder var body: ContentModel { get }
    var attributes: [String: String]? { get }
    func render() -> String
}

extension Tag {
    public func render() -> String { body.render() }
    public var attributes: [String: String]? { nil }
}

///
public protocol BuiltinTag: Tag {
    var tag: String { get }
}

extension BuiltinTag {
    public func render() -> String {
        let attributeString = self.attributes.map { attrs in
            attrs.map { attrsKey, attrValue in
                " \(attrsKey)=\"\(attrValue)\""
            }.joined()
        } ?? ""
        return "<\(tag)\(attributeString)>\(body.render())</\(tag)>"
    }
}

/// Never implements Tag to represent html elements that have no body
extension Never: Tag {
    public var body: Never { fatalError() }
}

extension String: Tag {
    public var body: Never { fatalError() }
    public func render() -> String { self }
}

extension [Tag]: Tag {
    public var body: Never { fatalError() }
    public func render() -> String {
        self.map { $0.render() }.joined()
    }
}

@resultBuilder
public enum HtmlTagBuilder {
    
    /// The HtmlTagBuilder only accepts a ``Head`` and a ``Body``
    public static func buildBlock<T, U>(_ head: Head<T>, _ body: Body<U>) -> [any Tag] {
        return [head, body]
    }
    
    /// This method forces the ``HtmlTagBuilder`` to contain exactly the proper content 
    /// and shows a meaningful error message
    @available(*, unavailable, message: "The Html content should be a Head element followed by a Body element")
    public static func buildBlock<each Content>(_ content: repeat each Content) -> Never {
        fatalError()
    }
}


/// The top level Html tag
@builtinTag(htmlBuildRules: "HtmlTagBuilder")
public struct Html<Content: Tag>: BuiltinTag {
    public func render() -> String { "<!DOCTYPE html><\(tag)>\(body.render())</\(tag)>" }
}
