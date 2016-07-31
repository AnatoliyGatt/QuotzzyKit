//
//  QuotzzyKitTests.swift
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

import XCTest
@testable import QuotzzyKit

class QuotzzyKitTests: XCTestCase {
    func validateQuote(quote: Quote?) {
        XCTAssertTrue(quote != nil, "quote should not be nil")
        XCTAssertNotNil(quote?.text, "quote.text should not be nil")
    }
    
    func testQuotzzyRespondWithValidQuoteObjectWhenRequestedWithNoParameters() {
        let expectation = expectationWithDescription("Quote request should succeed")
        Quotzzy.sharedClient().getQuote(nil, key: nil, completionHandler: {(quote: Quote?, error: NSError?) -> Void in
            XCTAssertNil(error)
            self.validateQuote(quote)
            expectation.fulfill()
        })
        self.waitForExpectationsWithTimeout(60, handler: nil)
    }
    
    func testQuotzzyRespondWithValidQuoteObjectWhenRequestedWithManuallySetKey() {
        let expectation = expectationWithDescription("Quote request should succeed")
        Quotzzy.sharedClient().getQuote(nil, key: 123456, completionHandler: {(quote: Quote?, error: NSError?) -> Void in
            XCTAssertNil(error)
            self.validateQuote(quote)
            expectation.fulfill()
        })
        self.waitForExpectationsWithTimeout(60, handler: nil)
    }

    func testQuotzzyRespondWithValidQuoteObjectWhenRequestedWithLanguageSetToEnglish() {
        let expectation = expectationWithDescription("Quote request should succeed")
        Quotzzy.sharedClient().getQuote("en", key: nil, completionHandler: {(quote: Quote?, error: NSError?) -> Void in
            XCTAssertNil(error)
            self.validateQuote(quote)
            expectation.fulfill()
        })
        self.waitForExpectationsWithTimeout(60, handler: nil)
    }

    func testQuotzzyRespondWithValidQuoteObjectWhenRequestedWithLanguageSetToEnglishAndManuallySetKey() {
        let expectation = expectationWithDescription("Quote request should succeed")
        var quoteObject: Quote?
        Quotzzy.sharedClient().getQuote("en", key: 123456, completionHandler: {(quote: Quote?, error: NSError?) -> Void in
            if error == nil {
                quoteObject = quote
                expectation.fulfill()
            } else {
                XCTFail(error!.description)
            }
        })
        self.waitForExpectationsWithTimeout(60, handler: {(error) in
            XCTAssertNil(error, "error should be nil")
            self.validateQuote(quoteObject)
        })
    }
    
    func testQuotzzyRespondWithValidQuoteObjectWhenRequestedWithLanguageSetToRussian() {
        let expectation = expectationWithDescription("Quote request should succeed")
        var quoteObject: Quote?
        Quotzzy.sharedClient().getQuote("ru", key: nil, completionHandler: {(quote: Quote?, error: NSError?) -> Void in
            if error == nil {
                quoteObject = quote
                expectation.fulfill()
            } else {
                XCTFail(error!.description)
            }
        })
        self.waitForExpectationsWithTimeout(60, handler: {(error) in
            XCTAssertNil(error, "error should be nil")
            self.validateQuote(quoteObject)
        })
    }

    func testQuotzzyRespondWithValidQuoteObjectWhenRequestedWithLanguageSetToRussianAndManuallySetKey() {
        let expectation = expectationWithDescription("Quote request should succeed")
        var quoteObject: Quote?
        Quotzzy.sharedClient().getQuote("ru", key: 123456, completionHandler: {(quote: Quote?, error: NSError?) -> Void in
            if error == nil {
                quoteObject = quote
                expectation.fulfill()
            } else {
                XCTFail(error!.description)
            }
        })
        self.waitForExpectationsWithTimeout(60, handler: {(error) in
            XCTAssertNil(error, "error should be nil")
            self.validateQuote(quoteObject)
        })
    }
    
    func testQuotzzyRespondWithErrorObjectWhenRequestedWithInvalidLanguage() {
        let expectation = expectationWithDescription("Quote request should fail")
        var errorObject: NSError?
        Quotzzy.sharedClient().getQuote("jp", key: nil, completionHandler: {(quote: Quote?, error: NSError?) -> Void in
            if error != nil {
                errorObject = error
                expectation.fulfill()
            } else {
                XCTFail("quote request should fail when requested with invalid language")
            }
        })
        self.waitForExpectationsWithTimeout(60, handler: {(error) in
            XCTAssertNil(error, "error should be nil")
            XCTAssertEqual(errorObject?.domain, "com.anatoliygatt.QuotzzyKit", "errorObject.domain should be equal to com.anatoliygatt.QuotzzyKit")
            XCTAssertEqual(errorObject?.code, 401, "errorObject.code should be equal to 401")
            XCTAssertEqual(errorObject?.localizedDescription, "Invalid language.", "errorObject.description should be equal to \"Invalid language.\"")
        })
    }
}
