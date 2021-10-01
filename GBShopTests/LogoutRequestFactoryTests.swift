//
//  LogoutRequestFactoryTests.swift
//  GBShopTests
//
//  Created by Сергей Горячев on 22.08.2021.
//

import XCTest
@testable import GBShop

class LogoutRequestFactoryTests: XCTestCase {
    
    var requestFactory: RequestFactory?
    var logout: LogoutRequestFactory?

    override func setUpWithError() throws {
        requestFactory = RequestFactory()
        logout = requestFactory?.makeLogoutRequestFactory()
    }
    
    func testLogout() throws {
        // Given
        let idUser = 123
        
        // When
        let userLogout = expectation(description: "user logout")
        let logout = try XCTUnwrap(logout)
        logout.logout(idUser: idUser) { response in
            // Then
            switch response.result {
            case .success(let logout):
                print(logout)
                XCTAssertEqual(logout.result, 1)
                userLogout.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 3)
    }

    override func tearDownWithError() throws {
        requestFactory = nil
        logout = nil
    }
}
