//
//  Quotzzy.swift
//  QuotzzyKit
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

public enum Language : String {
    case English = "en"
    case Russian = "ru"
}

public class Quotzzy {
    
    // MARK: - Private Properties
    
    private static let quotzzy = Quotzzy()
    
    private let VERSION: String = NSBundle(forClass: Quotzzy.self).objectForInfoDictionaryKey("CFBundleShortVersionString")! as! String
    private let dateFormatter: NSDateFormatter = NSDateFormatter()
    private let URLSession: NSURLSession
    
    // MARK: - Lifecycle
    
    private init() {
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US")
        dateFormatter.timeZone = NSTimeZone(name: "GMT")
        dateFormatter.dateFormat = "EEE, dd MMM yyyy HH:mm:ss z"
        
        let sessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
        sessionConfiguration.HTTPAdditionalHeaders = [
            "Accept": "application/json",
            "Accept-Charset": "utf-8",
            "Accept-Encoding": "*",
            "Accept-Language": "en-US, ru-RU",
            "Accept-Datetime": "Thu, 31 May 2007 20:35:00 GMT",
            "Cache-Control": "no-cache",
            "Pragma": "no-cache",
            "TE": "trailers, deflate",
            "User-Agent": "QuotzzyKit/\(VERSION)"
        ]
        sessionConfiguration.HTTPCookieAcceptPolicy = .Never
        sessionConfiguration.HTTPCookieStorage = nil
        sessionConfiguration.HTTPShouldSetCookies = false
        sessionConfiguration.URLCredentialStorage = nil
        sessionConfiguration.URLCache = nil
        sessionConfiguration.sessionSendsLaunchEvents = false
        
        URLSession = NSURLSession(configuration: sessionConfiguration)
        URLSession.sessionDescription = "QuotzzyKit URL Session"
    }
    
    // MARK: - Singleton
    
    public class func sharedClient() -> Quotzzy {
        return quotzzy
    }
    
    // MARK: - Endpoints
    
    public func getQuote(lang: Language?, key: Int?, completionHandler: (quote: Quote?, error: NSError?) -> Void) {
        let quoteRequestURLComponents: NSURLComponents = NSURLComponents()
        quoteRequestURLComponents.scheme = "http"
        quoteRequestURLComponents.host = "www.quotzzy.co"
        quoteRequestURLComponents.path = "/api/quote"
        
        var queryItems: [NSURLQueryItem] = []
        if let language = lang where language.rawValue.characters.count > 0 {
            queryItems.append(NSURLQueryItem(name: "lang", value: language.rawValue))
        }
        if let numericKey = key where numericKey != -1 {
            queryItems.append(NSURLQueryItem(name: "key", value: String(numericKey)))
        }
        
        quoteRequestURLComponents.queryItems = queryItems
        
        let quoteRequest: NSMutableURLRequest = NSMutableURLRequest(URL: quoteRequestURLComponents.URL! , cachePolicy: .UseProtocolCachePolicy, timeoutInterval: 60)
        quoteRequest.addValue(dateFormatter.stringFromDate(NSDate()), forHTTPHeaderField: "Date")
        quoteRequest.HTTPMethod = "GET"
        
        URLSession.downloadTaskWithRequest(quoteRequest, completionHandler: { (url: NSURL?, response: NSURLResponse?, error: NSError?) -> Void in
            if error == nil {
                let responseData = NSData(contentsOfURL: url!)
                if responseData != nil {
                    let parsedResponse: Dictionary<String, AnyObject>?
                    do {
                        parsedResponse = try NSJSONSerialization.JSONObjectWithData(responseData!, options: .MutableContainers) as? Dictionary<String, AnyObject>
                    } catch let parsingError as NSError {
                        parsedResponse = nil
                        completionHandler(quote: nil, error: parsingError)
                    }
                    completionHandler(quote: Quote(quote: parsedResponse!), error: nil)
                }
            } else {
                completionHandler(quote: nil, error: error)
            }
        }).resume()
    }
}
