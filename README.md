# ZORO

A swift library for building html

## Motivation

I don't like to write html, and by html I mean, xml.
I find it cumbersome to write and difficult to read.
I also don't find templating engines to be a good solution.
The code is split between two languages, and the templating engine is a language of its own.
Swift has very neat features, I got inspired by the SwiftUI framework, to create a swift DSL
that transpiles swift code right into html.

## Usage

Just like SwiftUI, html components are expressed declaratively.

``` swift

import Zoro

let html = Html {
    Head {
        Meta(charset: "utf-8")
        Meta(name: "viewport", content: "width=device-width, initial-scale=1")
        Link(href: "https://www.w3schools.com/favicon.ico", rel: "icon")
        Title { "Zoro" }
    }
    Body {
        H1(style: "color:blue;") { "this is a heading" }
        P(style: "color:red;") { "this is a paragraph" }
        Input()
        Ul {
            for i in 0..<10 {
                Li { "list item \(i)"}
            }
        }
    }
}

print(html.render())

```

## Benefits

- Because we are writing swift, the Html components we create can be type safe, by settings specific rules over html contents, and checking those rules at compile time
- The rendering logic is now in the same place as the ui logic, no need for a separate templating engine where we need to send data to
- This is also influenced by JSX, but in JSX we are still writing xml tags, writing pure swift makes the code easier to write and read
- Use swift syntax for loops, conditional statements, switch cases and other swift features to generate html

Html attributes are passed as arguments to the component. The content of the component is passed as a closure.

You can create and extract your own components.

## Goals

The current state of the library supports all know html elements with their respective attributes.
Additional features in the pipeline includes:

- Better content restrictions on certain elements for better type safety (ex: ul elements can only contain li elements...)
- Better handling of attributes
- Integration with Htmx
- Utility components for common html components (ex: a wrapper over Html, Head and Body, saving you the hassle of html boiler plate)
- Better error handling messages (the library uses macros to generate html components, so the error messages are not very helpful)
- Better documentation
- Css support (maybe a transpiler for css also)

## Installation

You can install the library using Swift Package Manager. Add the following dependency to your Package.swift file:

``` swift
dependencies: [
    .package(url: "https://github.com/zuzmuz/zoro", branch: "main")
]
```

The library defines its own external macros, so you might need to enable those

## Contributing

This project is still in its infancy, it is usable but a lot of type safety features can be introduced.
I am open to any kind of contribution, from bug reports to pull requests.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
