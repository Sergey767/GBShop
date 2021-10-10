//
//  ChangeDataRequestFactoryTests.swift
//  GBShopTests
//
//  Created by Сергей Горячев on 22.08.2021.
//

import XCTest
@testable import GBShop

class ChangeDataRequestFactoryTests: XCTestCase {
    
    var requestFactory: RequestFactory?
    var changeData: ChangeDataRequestFactory?

    override func setUpWithError() throws {
        requestFactory = RequestFactory()
        changeData = requestFactory?.makeChangeDataRequestFactory()
    }
    
    func testChangeData() throws {
        // Given
        let idUser = 123
        let userName = "Somebody"
        let password = "mypassword"
        let email = "some@some.ru"
        let gender = "m"
        let creditCard = "9872389-2424-234224-234"
        let bio = "This is good! I think I will switch to another language"
        
        // When
        let userChangeData = expectation(description: "user changed data")
        let changeData = try XCTUnwrap(changeData)
        changeData.changeUserData(idUser: idUser, userName: userName, password: password, email: email, gender: gender, creditCard: creditCard, bio: bio) { response in
            // Then
            switch response.result {
            case .success(let changeData):
                print(changeData)
                XCTAssertEqual(changeData.result, 1)
                userChangeData.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 3)
    }

    override func tearDownWithError() throws {
        requestFactory = nil
        changeData = nil
    }
}
