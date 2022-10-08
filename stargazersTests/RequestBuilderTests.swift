//
//  RequestBuilderTests.swift
//  stargazersTests
//
//  Created by PieroAdmin on 05/10/22.
//

import XCTest
@testable import stargazers

final class RequestBuilderTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAddOneQueryParameter() throws {
        let sut = RequestBuilder(Costant.searchRepository)
        let name = "question"
        let value = "parameter"
        
        sut.addQuery(name: "question", value: "parameter")
        let str = sut.buildRequest()?.url?.absoluteString
        XCTAssertNotNil(str)
        let expectedStr = "https://\(Costant.serverAddress)\(Costant.searchRepository)?\(name)=\(value)"
        XCTAssert(str == expectedStr)
    }
    
    func testAddTwoQueryParameter() throws {
        let sut = RequestBuilder(Costant.searchRepository)
        let name = "question"
        let value = "parameter"
        
        sut.addQuery(name: "question", value: "parameter")
        sut.addQuery(name: "question", value: "parameter")
        let str = sut.buildRequest()?.url?.absoluteString
        XCTAssertNotNil(str)
        let expectedStr = "https://\(Costant.serverAddress)\(Costant.searchRepository)?\(name)=\(value)&\(name)=\(value)"
        XCTAssert(str == expectedStr)
    }

    func testAddOnePathParameter() throws {
        let sut = RequestBuilder("/repos/$$/stargazers")
        let param = "question"
        
        sut.addPathParameters(param)
        let str = sut.buildRequest()?.url?.absoluteString
        XCTAssertNotNil(str)
        
        let expectedStr = "https://\(Costant.serverAddress)/repos/\(param)/stargazers"
        XCTAssert(str == expectedStr, "Path \(str!) is not egual to \(expectedStr)")
    }

    func testAddTwoPathParameter() throws {
        let sut = RequestBuilder("/repos/$$/$$/stargazers")
        let first = "first"
        let second = "second"
        
        sut.addPathParameters(first, second)
        let str = sut.buildRequest()?.url?.absoluteString
        XCTAssertNotNil(str)
        
        let expectedStr = "https://\(Costant.serverAddress)/repos/\(first)/\(second)/stargazers"
        XCTAssert(str == expectedStr, "Path \(str!) is not egual to \(expectedStr)")
    }

    func testAddWrongPathParameter() throws {
        let path = "/repos/$$/$$/stargazers"
        let sut = RequestBuilder(path)
        let first = "first"
        let second = "second"
        
        sut.addPathParameters(first)
        let str = sut.buildRequest()?.url?.absoluteString
        XCTAssertNil(str)
    }

    func testOtherAddWrongPathParameter() throws {
        let path = "/repos/$$/stargazers"
        let sut = RequestBuilder(path)
        let first = "first"
        let second = "second"
        
        sut.addPathParameters(first, second)
        let str = sut.buildRequest()?.url?.absoluteString
        XCTAssertNil(str)
    }

}
