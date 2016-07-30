![QuotzzyKit Logo][logo]

[![CocoaPods Pod Version][cocoapods-pod-version-badge]][cocoapods-pod-url]
[![CocoaPods Pod License][cocoapods-pod-license-badge]][cocoapods-pod-license-url]
[![CocoaPods Pod Downloads][cocoapods-pod-downloads-badge]][cocoapods-pod-url]
[![CocoaPods Pod Platform][cocoapods-pod-platform-badge]][cocoapods-pod-url]
[![CocoaPods Pod Language][cocoapods-pod-language-badge]][cocoapods-pod-url]
[![Carthage Compatible][carthage-compatible-badge]][carthage-github-repository-url]
[![Travis CI Build Status][travis-ci-build-status-badge]][travis-ci-build-status-page-url]

An elegant client for Quotzzy API written in Swift.

## Requirements

- iOS 8.0+
- Swift 2.1+
- Xcode 7.1+

## Installation

> **Embedded frameworks require a minimum deployment target of iOS 8.**

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

> CocoaPods 0.36+ is required to build QuotzzyKit.

To integrate QuotzzyKit into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'QuotzzyKit', '~> 1.0.0'
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
github "AnatoliyGatt/QuotzzyKit" ~> 1.0.0
```

Run `carthage update` to build the framework and drag the built `QuotzzyKit.framework` into your Xcode project.

## Quick Start

The quickest way to get started is by executing following code:

```swift
import QuotzzyKit

Quotzzy.sharedClient().getQuote("en", key: nil, completionHandler: {(quote: Quote?, error: NSError?) -> Void in
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

### getQuote(lang: String?, key: Int?, completionHandler: (quote: Quote?, error: NSError?) -> Void)

Requests random quote.

#### Parameters

- `lang` - Response language (`en` or `ru`).
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
Quotzzy.sharedClient().getQuote(nil, key: nil, completionHandler: {(quote: Quote?, error: NSError?) -> Void in
    if error == nil {
        print("\(quote?.text) - \(quote?.author?.name)(\(quote?.author?.wiki))")
    }
})
```

Requests quote in Russian with manually set key.

```swift
Quotzzy.sharedClient().getQuote("ru", key: 123456, completionHandler: {(quote: Quote?, error: NSError?) -> Void in
    if error == nil {
        print("\(quote?.text) - \(quote?.author?.name)(\(quote?.author?.wiki))")
    }
})
```

## License

Distributed under the [MIT License](LICENSE).

[logo]: https://cldup.com/hDi4eNZ5hZ.png

[cocoapods-pod-url]: https://cocoapods.org/pods/QuotzzyKit

[cocoapods-pod-version-badge]: https://img.shields.io/cocoapods/v/QuotzzyKit.svg?style=flat-square

[cocoapods-pod-license-badge]: https://img.shields.io/cocoapods/l/QuotzzyKit.svg?style=flat-square
[cocoapods-pod-license-url]: http://opensource.org/licenses/MIT

[cocoapods-pod-downloads-badge]: https://img.shields.io/cocoapods/dm/QuotzzyKit.svg?style=flat-square

[cocoapods-pod-platform-badge]: https://img.shields.io/cocoapods/p/QuotzzyKit.svg?style=flat-square

[cocoapods-pod-language-badge]: https://img.shields.io/badge/language-swift-orange.svg?style=flat-square

[carthage-compatible-badge]: https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat-square
[carthage-github-repository-url]: https://github.com/Carthage/Carthage

[travis-ci-build-status-badge]: https://img.shields.io/travis/AnatoliyGatt/QuotzzyKit.svg?style=flat-square
[travis-ci-build-status-page-url]: https://travis-ci.org/AnatoliyGatt/QuotzzyKit
