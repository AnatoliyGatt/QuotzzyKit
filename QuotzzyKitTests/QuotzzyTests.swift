//
//  QuotzzyTests.swift
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

import Foundation
import XCTest
@testable import QuotzzyKit

public class QuotzzyTests: XCTestCase {

    // MARK: - Private Properties

    private static let TIMEOUT: NSTimeInterval = 60.0

    // MARK: - Validation Functions

    public func validateQuote(quote: Quote?) {
        XCTAssertTrue(quote != nil, "quote should not be nil")
        XCTAssertNotNil(quote?.text, "quote.text should not be nil")
    }

    // MARK: - Response Validation Tests

    public func testQuotzzyRespondWithValidQuoteObjectWhenRequestedWithNoParameters() {
        let expectation = expectationWithDescription("Quote request should succeed")
        Quotzzy.sharedClient().getQuote(nil, key: nil, completionHandler: { (quote: Quote?, error: NSError?) -> Void in
            XCTAssertNil(error)
            self.validateQuote(quote)
            expectation.fulfill()
        })
        self.waitForExpectationsWithTimeout(TIMEOUT, handler: nil)
    }

    public func testQuotzzyRespondWithValidQuoteObjectWhenRequestedWithManuallySetKey() {
        let expectation = expectationWithDescription("Quote request should succeed")
        Quotzzy.sharedClient().getQuote(nil, key: 123456, completionHandler: { (quote: Quote?, error: NSError?) -> Void in
            XCTAssertNil(error)
            self.validateQuote(quote)
            expectation.fulfill()
        })
        self.waitForExpectationsWithTimeout(TIMEOUT, handler: nil)
    }

    public func testQuotzzyRespondWithValidQuoteObjectWhenRequestedWithLanguageSetToEnglish() {
        let expectation = expectationWithDescription("Quote request should succeed")
        Quotzzy.sharedClient().getQuote(.English, key: nil, completionHandler: { (quote: Quote?, error: NSError?) -> Void in
            XCTAssertNil(error)
            self.validateQuote(quote)
            expectation.fulfill()
        })
        self.waitForExpectationsWithTimeout(TIMEOUT, handler: nil)
    }

    public func testQuotzzyRespondWithValidQuoteObjectWhenRequestedWithLanguageSetToEnglishAndManuallySetKey() {
        let expectation = expectationWithDescription("Quote request should succeed")
        Quotzzy.sharedClient().getQuote(.English, key: 123456, completionHandler: { (quote: Quote?, error: NSError?) -> Void in
            XCTAssertNil(error)
            self.validateQuote(quote)
            expectation.fulfill()
        })
        self.waitForExpectationsWithTimeout(TIMEOUT, handler: nil)
    }

    public func testQuotzzyRespondWithValidQuoteObjectWhenRequestedWithLanguageSetToRussian() {
        let expectation = expectationWithDescription("Quote request should succeed")
        Quotzzy.sharedClient().getQuote(.Russian, key: nil, completionHandler: { (quote: Quote?, error: NSError?) -> Void in
            XCTAssertNil(error)
            self.validateQuote(quote)
            expectation.fulfill()
        })
        self.waitForExpectationsWithTimeout(TIMEOUT, handler: nil)
    }

    public func testQuotzzyRespondWithValidQuoteObjectWhenRequestedWithLanguageSetToRussianAndManuallySetKey() {
        let expectation = expectationWithDescription("Quote request should succeed")
        Quotzzy.sharedClient().getQuote(.Russian, key: 123456, completionHandler: { (quote: Quote?, error: NSError?) -> Void in
            XCTAssertNil(error)
            self.validateQuote(quote)
            expectation.fulfill()
        })
        self.waitForExpectationsWithTimeout(TIMEOUT, handler: nil)
    }
}
