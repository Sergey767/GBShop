//
//  RegisterRequestFactoryTests.swift
//  GBShopTests
//
//  Created by Сергей Горячев on 21.08.2021.
//

import XCTest
@testable import GBShop

class RegisterRequestFactoryTests: XCTestCase {
    
    var requestFactory: RequestFactory?
    var register: RegisterRequestFactory?

    override func setUpWithError() throws {
        requestFactory = RequestFactory()
        register = requestFactory?.makeRegisterRequestFactory()
    }

    func testRegister() throws {
        // Given
        let idUser = 123
        let userName = "Somebody"
        let password = "mypassword"
        let email = "some@some.ru"
        let gender = "m"
        let creditCard = "9872389-2424-234224-234"
        let bio = "This is good! I think I will switch to another language"
        
        // When
        let userRegistered = expectation(description: "user registered")
        let register = try XCTUnwrap(register)
        
        register.register(idUser: idUser, userName: userName, password: password, email: email, gender: gender, creditCard: creditCard, bio: bio) { response in
            // Then
            switch response.result {
            case .success(let register):
                print(register)
                XCTAssertEqual(register.userMessage, "Регистрация прошла успешно!")
                userRegistered.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 3)
    }
    
    override func tearDownWithError() throws {
        requestFactory = nil
        register = nil
    }
}
