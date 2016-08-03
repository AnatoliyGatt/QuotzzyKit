//
//  QuoteTests.swift
//  QuotzzyKitTests
//
//  The MIT License (MIT)
//
//  Copyright (c) 2016 Anatoliy Gatt <anatoliy.gatt@aol.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

@testable import QuotzzyKit
import Foundation
import XCTest

public class QuoteTests: XCTestCase {
    public func testQuoteInstantiationWithAuthor() {
        let quote = Quote(quote: [
            "text": "Ignorance never settle a question.",
            "author": [
                "name": "Benjamin Disraeli",
                "wiki": "http://en.wikipedia.com/wiki/Benjamin%20Disraeli"
            ]
        ])
        XCTAssertNotNil(quote, "quote should not be nil")
        XCTAssertEqual(quote.text, "Ignorance never settle a question.", "quote.text should be equal to \"Ignorance never settle a question.\"")
        XCTAssertNotNil(quote.author, "quote.author should not be nil")
        XCTAssertEqual(quote.author?.name, "Benjamin Disraeli", "quote.author.name should be equal to \"Benjamin Disraeli\"")
        XCTAssertEqual(quote.author?.wiki, "http://en.wikipedia.com/wiki/Benjamin%20Disraeli", "quote.author.wiki should be equal to \"http://en.wikipedia.com/wiki/Benjamin%20Disraeli\"")
    }
    
    public func testQuoteInstantiationWithoutAuthor() {
        let quote = Quote(quote: [
            "text": "Ignorance never settle a question."
        ])
        XCTAssertNotNil(quote, "quote should not be nil")
        XCTAssertEqual(quote.text, "Ignorance never settle a question.", "quote.text should be equal to \"Ignorance never settle a question.\"")
        XCTAssertNil(quote.author, "quote.author should be nil")
    }
}
