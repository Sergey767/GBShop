//
//  AuthRequestFactoryTests.swift
//  GBShopTests
//
//  Created by Сергей Горячев on 19.08.2021.
//

import XCTest
@testable import GBShop

class AuthRequestFactoryTests: XCTestCase {
    
    var requestFactory: RequestFactory?
    var auth: AuthRequestFactory?

    override func setUpWithError() throws {
        requestFactory = RequestFactory()
        auth = requestFactory?.makeAuthRequestFactory()
    }
    
    func testLogin() throws {
        // Given
        let userName = "Somebody"
        let password = "mypassword"
        
        // When
        let loggedIn = expectation(description: "logged in")
        let auth = try XCTUnwrap(auth)
        
        auth.login(userName: userName, password: password) { response in
            // Then
            switch response.result {
            case .success(let login):
                print(login)
                XCTAssertEqual(login.login, "geekbrains")
                loggedIn.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 3)
    }

    override func tearDownWithError() throws {
        requestFactory = nil
        auth = nil
    }

}
