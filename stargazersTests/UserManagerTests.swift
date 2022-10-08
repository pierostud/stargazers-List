//
//  UserManagerTests.swift
//  stargazersTests
//
//  Created by PieroAdmin on 07/10/22.
//

import XCTest
@testable import stargazers

final class UserManagerTests: XCTestCase {
    private var userDefaults: UserDefaults!
    private var manager: UserManager!

    override func setUpWithError() throws {
        userDefaults = UserDefaults(suiteName: #file)
        userDefaults.removePersistentDomain(forName: #file)
        
        manager = UserManager(userDefault: userDefaults)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUserIsNotLoggedAtStart() throws {
        let sut = manager
        
        XCTAssert(sut?.isLoggedIn == false)
    }

    func testSaveUserModel() throws {
        let sut = manager
        
        XCTAssert(sut?.isLoggedIn == false)
        let user = User(username: "username", password: "password")
        sut?.save(user)
        XCTAssert(sut?.isLoggedIn == true)
    }

}
