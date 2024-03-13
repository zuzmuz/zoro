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

let html = Html(lang: "en") {
    Head {
        Title {"Hello, world!"}
    }
    Body {
        H1(style: "color:blue;") { "this is a heading" }
        P(style: "color:red;") { "this is a paragraph" }
        Input()
        Ul {
            for i in 0..<10 {
                Li { "list item \(i)" }
            }
        }
    }
}

print(html.render())

```

Html attributes are passed as arguments to the component. The content of the component is passed as a closure.

You can create and extract your own components.

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
