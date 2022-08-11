//
//  TestingRequestBuilderTest.swift
//  CatsTests
//
//  Created by 김태호 on 2022/08/09.
//

import XCTest

struct UrlRequestBuilder {
    var url: URL?
    var path: String?
    var httpMethod: HttpMethod
    var urlQueryItems: [URLQueryItem]
    
    init(_ url: URL? = nil,
         _ path: String? = nil,
         _ httpMethod: HttpMethod = .get,
         _ urlQueryItems: [URLQueryItem] = []) {
        self.url = url
        self.path = path
        self.httpMethod = httpMethod
        self.urlQueryItems = urlQueryItems
    }
    
    func setUrl(url: URL?) -> Self {
        UrlRequestBuilder(url, self.path, self.httpMethod)
    }
    
    func setPath(path: String?) -> Self {
        UrlRequestBuilder(self.url, path, self.httpMethod)
    }
    
    func setHttpMethod(method: HttpMethod = .get) -> Self {
        UrlRequestBuilder(self.url,
                          self.path,
                          method)
    }
    
    func setUrlQueryItems(urlQueryItems: [URLQueryItem]) -> Self {
        UrlRequestBuilder(self.url,
                          self.path,
                          self.httpMethod,
                          urlQueryItems)
    }
    
    enum HttpMethod {
        case get
        case post
        case delete
        case put
    }
}

class TestingRequestBuilderTest: XCTestCase {
    private let testOnlyUrl = URL(string: "https://example.com")
    private let testPath = "/testPath"
    private let testUrlQueryItems = [URLQueryItem(name: "name", value: "value1")]
    
    func test_urlRequestBuilderMemberUrlIsNil() {
        let requestBuilder = UrlRequestBuilder()
        XCTAssertNil(requestBuilder.url)
    }
    
    func test_urlRequestBuilderMemberUrlIsNotNil() {
        let requestBuilder = UrlRequestBuilder(testOnlyUrl)
        XCTAssertNotNil(requestBuilder.url)
    }
    
    func test_urlRequestBuilderSetUrlIsNil() {
        let requestBuilder = UrlRequestBuilder()
            .setUrl(url: nil)
        
        XCTAssertNil(requestBuilder.url)
    }
    
    func test_urlRequestBuilderSetUrlIsNotNil() {
        let requestBuilder = UrlRequestBuilder()
            .setUrl(url: testOnlyUrl)
        
        XCTAssertNotNil(requestBuilder.url)
    }
    
    func test_urlRequestBuilderMemberPathIsNil() {
        let requestBuilder = UrlRequestBuilder()
        
        XCTAssertNil(requestBuilder.path)
    }
    
    func test_urlRequestBuilderMemberPathIsNotNil() {
        let requestBuilder = UrlRequestBuilder(nil, testPath)
        
        XCTAssertNotNil(requestBuilder.path)
    }
    
    func test_urlRequestBuilderSetPathIsNil() {
        let requestBuilder = UrlRequestBuilder()
            .setPath(path: testPath)
        
        XCTAssertNotNil(requestBuilder.path)
    }
    
    func test_urlRequestBuilderSetUrlSetPathNotNil() {
        let requestBuilder = UrlRequestBuilder()
            .setUrl(url: testOnlyUrl)
            .setPath(path: testPath)
        
        XCTAssertNotNil(requestBuilder.url)
        XCTAssertNotNil(requestBuilder.path)
    }
    
    func test_urlRequestBuilderHttpMethodIsGet() {
        let requestBuilder = UrlRequestBuilder()
        
        XCTAssertEqual(UrlRequestBuilder.HttpMethod.get, requestBuilder.httpMethod)
    }
    
    func test_urlRequestBuilderSetHttpMethodIsNotGet() {
        let requestBuilder = UrlRequestBuilder()
            .setHttpMethod(method: .post)
        
        XCTAssertNotEqual(
            UrlRequestBuilder.HttpMethod.get,
            requestBuilder.httpMethod)
    }
    
    func test_urlRequestBuilderSetHttpMethodIsPost() {
        let requestBuilder = UrlRequestBuilder()
            .setHttpMethod(method: .post)
        
        XCTAssertEqual(
            UrlRequestBuilder.HttpMethod.post,
            requestBuilder.httpMethod)
    }
    
    func test_urlRequestBuilderQueryItemsIsEmptyReturnsTrue() {
        let requestBuilder = UrlRequestBuilder()
        
        XCTAssertNotNil(requestBuilder.urlQueryItems)
        XCTAssertTrue(requestBuilder.urlQueryItems.isEmpty)
    }
    
    func test_urlRequestBuilderQueryItemsIsEmptyReturnsFalse() {
        let requestBuilder = UrlRequestBuilder()
            .setUrlQueryItems(urlQueryItems: testUrlQueryItems)
        
        XCTAssertNotNil(requestBuilder.urlQueryItems)
        XCTAssertFalse(requestBuilder.urlQueryItems.isEmpty)
    }
    
}