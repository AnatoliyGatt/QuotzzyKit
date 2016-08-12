![QuotzzyKit Logo][logo]

[![CocoaPods Pod Version][cocoapods-pod-version-badge]][cocoapods-pod-url]
[![CocoaPods Pod License][cocoapods-pod-license-badge]][cocoapods-pod-license-url]
[![CocoaPods Pod Platform][cocoapods-pod-platform-badge]][cocoapods-pod-url]
[![CocoaPods Pod Language][cocoapods-pod-language-badge]][cocoapods-pod-url]
[![Carthage Compatible][carthage-compatible-badge]][carthage-github-repository-url]
[![Travis CI Build Status][travis-ci-build-status-badge]][travis-ci-build-status-page-url]
[![CODEBEAT Status][codebeat-status-badge]][codebeat-status-page-url]
[![Codecov Test Coverage Status][codecov-test-coverage-status-badge]][codecov-test-coverage-status-page-url]

An elegant client for Quotzzy API written in Swift.

## Requirements

- macOS 10.10+
- iOS 8.0+
- watchOS 2.0+
- tvOS 9.0+
- Swift 2.1+
- Xcode 7.1+

## Installation

> **Embedded frameworks require a minimum deployment target of iOS 8 or macOS 10.10.**

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

> CocoaPods 0.39+ is required to build QuotzzyKit.

To integrate QuotzzyKit into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source "https://github.com/CocoaPods/Specs.git"
platform :ios, "8.0"
use_frameworks!

target "<Your Target Name>" do
    pod "QuotzzyKit", "~> 2.0.2"
end
```

Then, run the following command:

```bash
$ pod install
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate QuotzzyKit into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "AnatoliyGatt/QuotzzyKit" ~> 2.0.2
```

Run `carthage update` to build the framework and drag the built `QuotzzyKit.framework` into your Xcode project.

## Quick Start

The quickest way to get started is by executing following code:

```swift
import QuotzzyKit

Quotzzy.sharedClient().getQuote(.English, key: nil, completionHandler: { (quote: Quote?, error: NSError?) -> Void in
    if error == nil {
        print("\(quote?.text) - \(quote?.author?.name)(\(quote?.author?.wiki))")
    }
})
```

If everything went well, you'll see something like this in your console:

```
Ignorance never settle a question. - Benjamin Disraeli(http://en.wikipedia.com/wiki/Benjamin%20Disraeli)
```

## Documentation

### sharedClient()

Get singleton instance of Quotzzy.

#### Example

```swift
Quotzzy.sharedClient()
```

### getQuote(lang: Language?, key: Int?, completionHandler: (quote: Quote?, error: NSError?) -> Void)

Requests random quote.

#### Parameters

- `lang` - Response language (`.English` or `.Russian`).
- `key` - Numeric key, which influences the choice of quotation, the maximum length is 6 digits.
- `completionHandler` - Callback when response comes in.

#### Completion Handler Properties

##### Quote

Used to represent quote object.

###### Properties

- `text` - Quote's text.
- `author` - Quote's author.
    - `name` - Author's name.
    - `wiki` - Author's wiki URL.

##### Error

When error occur, you receive an `NSError` object as a second argument of the completion handler.

#### Examples

Requests quote in default language (English) without manually set key.

```swift
Quotzzy.sharedClient().getQuote(nil, key: nil, completionHandler: { (quote: Quote?, error: NSError?) -> Void in
    if error == nil {
        print("\(quote?.text) - \(quote?.author?.name)(\(quote?.author?.wiki))")
    }
})
```

Requests quote in Russian with manually set key.

```swift
Quotzzy.sharedClient().getQuote(.Russian, key: 123456, completionHandler: { (quote: Quote?, error: NSError?) -> Void in
    if error == nil {
        print("\(quote?.text) - \(quote?.author?.name)(\(quote?.author?.wiki))")
    }
})
```

## License

Distributed under the [MIT License](LICENSE).

[logo]: https://cldup.com/hDi4eNZ5hZ.png

[cocoapods-pod-url]: https://cocoapods.org/pods/QuotzzyKit

[cocoapods-pod-version-badge]: https://img.shields.io/cocoapods/v/QuotzzyKit.svg?style=flat

[cocoapods-pod-license-badge]: https://img.shields.io/cocoapods/l/QuotzzyKit.svg?style=flat
[cocoapods-pod-license-url]: http://opensource.org/licenses/MIT

[cocoapods-pod-platform-badge]: https://img.shields.io/cocoapods/p/QuotzzyKit.svg?style=flat

[cocoapods-pod-language-badge]: https://img.shields.io/badge/language-swift-orange.svg?style=flat

[carthage-compatible-badge]: https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat
[carthage-github-repository-url]: https://github.com/Carthage/Carthage

[travis-ci-build-status-badge]: https://img.shields.io/travis/AnatoliyGatt/QuotzzyKit.svg?style=flat
[travis-ci-build-status-page-url]: https://travis-ci.org/AnatoliyGatt/QuotzzyKit

[codebeat-status-badge]: https://codebeat.co/badges/230252c9-34c8-48c6-9bec-40cde398507a
[codebeat-status-page-url]: https://codebeat.co/projects/github-com-anatoliygatt-quotzzykit

[codecov-test-coverage-status-badge]: https://img.shields.io/codecov/c/github/AnatoliyGatt/QuotzzyKit.svg?style=flat
[codecov-test-coverage-status-page-url]: https://codecov.io/gh/AnatoliyGatt/QuotzzyKit
