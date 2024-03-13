import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct TagMacro {
    
    static let globalAttributes: [String] = [
            "id",
            "class",
            "slot",
            "accesskey",
            "autocapitalize",
            "autofocus",
            "contenteditable",
            "dir",
            "draggable",
            "enterkeyhint",
            "hidden",
            "inert",
            "inputmode",
            "is",
            "itemid",
            "itemprop",
            "itemref",
            "itemscope",
            "itemtype",
            "lang",
            "nonce",
            "popover",
            "spellcheck",
            "style",
            "tabindex",
            "title",
            "translate",
            "writingsuggestions",
            "onauxclick",
            "onbeforeinput",
            "onbeforematch",
            "onbeforetoggle",
            "onblur",
            "oncancel",
            "oncanplay",
            "oncanplaythrough",
            "onchange",
            "onclick",
            "onclose",
            "oncontextlost",
            "oncontextmenu",
            "oncontextrestored",
            "oncopy",
            "oncuechange",
            "oncut",
            "ondblclick",
            "ondrag",
            "ondragend",
            "ondragenter",
            "ondragleave",
            "ondragover",
            "ondragstart",
            "ondrop",
            "ondurationchange",
            "onemptied",
            "onended",
            "onerror",
            "onfocus",
            "onformdata",
            "oninput",
            "oninvalid",
            "onkeydown",
            "onkeypress",
            "onkeyup",
            "onload",
            "onloadeddata",
            "onloadedmetadata",
            "onloadstart",
            "onmousedown",
            "onmouseenter",
            "onmouseleave",
            "onmousemove",
            "onmouseout",
            "onmouseover",
            "onmouseup",
            "onpaste",
            "onpause",
            "onplay",
            "onplaying",
            "onprogress",
            "onratechange",
            "onreset",
            "onresize",
            "onscroll",
            "onscrollend",
            "onsecuritypolicyviolation",
            "onseeked",
            "onseeking",
            "onselect",
            "onslotchange",
            "onstalled",
            "onsubmit",
            "onsuspend",
            "ontimeupdate",
            "ontoggle",
            "onvolumechange",
            "onwaiting",
            "onwheel",
    ]
    
    static let htmlBuildRulesLabel = "htmlBuildRules"
    
    private static func getDeclarationName(from declaration: some DeclGroupSyntax) -> (tagName: String, structName: String) {
        guard let structName = declaration.as(StructDeclSyntax.self)?.name.text else {
            fatalError("the macro should be defined on a struct")
        }
        let tagName = structName.lowercased()
        
        return (tagName, structName)
    }
    
    ///Get attributes from argument.
    ///If the macro defines an `attributes` argument, the attribute list is deconstructed
    ///in order to retrieve the generated members and member initialization.
    ///The argument expression should be an array expression of string literals
    private static func getAttributes(from argument: LabeledExprListSyntax.Element) -> (initMembers: String, memberInitialization: String) {
        
        guard let attributes = argument.expression.as(
            ArrayExprSyntax.self)?.elements else {
            fatalError("attributes should be an array of strings")
        }
        
        var members = attributes.compactMap {
            $0.expression.as(StringLiteralExprSyntax.self)?.representedLiteralValue
        }
        
        return Self.getAttributes(from: members)
    }
    
    private static func getAttributes(from members: [String]) -> (initMembers: String, memberInitialization: String) {
        
        let initMembers = members.map {
            "\($0): String?=nil"
        }.joined(separator: ", ")
        
        let memberInitialization = members.map {
            """
            if let `\($0)` = `\($0)` {
                self.attributes!["\($0)"] = `\($0)`
            }
            
            """
        }.joined()
        
        let memberInitilazation = members.count > 0 ? "\(memberInitialization)" : ""
        
        return (initMembers, memberInitilazation)
   
    }
    
    
    private static func getContentBuilder(from argument: LabeledExprListSyntax.Element) -> (initMembers: String, memberInitialization: String) {
        
        guard let contentBuilder = argument.expression.as(
            StringLiteralExprSyntax.self)?.representedLiteralValue else {
            fatalError("html builder should be a string literal")
        }
        
        return ("@\(contentBuilder) contentBuilder: () -> Content",
                """
                self.body = contentBuilder()
                """)
    }
}

extension TagMacro: MemberMacro {
    
    public static func expansion(
      of node: AttributeSyntax,
      providingMembersOf declaration: some DeclGroupSyntax,
      conformingTo protocols: [TypeSyntax],
      in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
       
        let (tagName, structName) = Self.getDeclarationName(from: declaration)
   
        guard let arguments = node.arguments,
              case let .argumentList(argumentList) = arguments else {
            fatalError()
        }
        
        var initData: [(initMembers: String, memberInitialization: String)] = []
        var genericContent: Bool = false
        
        initData.append(Self.getAttributes(from: Self.globalAttributes))
        
        argumentList.forEach { argument in
            switch argument.label?.text {
            case "attributes":
                initData.append(Self.getAttributes(from: argument))
            case Self.htmlBuildRulesLabel:
                genericContent = true
                initData.append(Self.getContentBuilder(from: argument))
            default:
                fatalError()
            }
        }
        
        let initMembers = initData.map { $0.initMembers }.joined(separator: ", ")
        let memberInitialization = initData.map { $0.memberInitialization }.joined()

        var declSyntax: [DeclSyntax] = [
            "public let tag = \"\(raw: tagName)\"",
            "public var attributes: [String: String]? = nil",
            "public var body: \(raw: genericContent ? "Content" : "Never { fatalError() }")",
            """
            public init(\(raw: initMembers)) {
                self.attributes = [:]
                \(raw: memberInitialization)
            }
            """
        ]
        if !genericContent {
            declSyntax.append(
            """
            public func render() -> String {
                let attributeString = self.attributes.map { attrs in
                    attrs.map { attrsKey, attrValue in
                        " \\(attrsKey)=\\"\\(attrValue)\\""
                    }.joined()
                } ?? ""
                return "<\\(tag)\\(attributeString)>"
            }
            """)
        }
        return declSyntax
    }
}

@main
struct ZoroPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        TagMacro.self,
    ]
}
