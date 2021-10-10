//
//  RemoveReviewRequestFactoryTests.swift
//  GBShopTests
//
//  Created by Сергей Горячев on 25.09.2021.
//

import XCTest
@testable import GBShop

class RemoveReviewRequestFactoryTests: XCTestCase {
    
    var requestFactory: RequestFactory?
    var removeReview: RemoveReviewRequestFactory?

    override func setUpWithError() throws {
        requestFactory = RequestFactory()
        removeReview = requestFactory?.makeRemoveReviewRequestFactory()
    }
    
    func testRemoveReview() throws {
        // Given
        let idComment = 123
        
        // When
        let reviewDeleted = expectation(description: "review deleted")
        let removeReview = try XCTUnwrap(removeReview)
        
        removeReview.removeReview(idComment: idComment) { response in
            // Then
            switch response.result {
            case .success(let removeReview):
                print(removeReview)
                XCTAssertEqual(removeReview.result, 1)
                reviewDeleted.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 3)
    }

    override func tearDownWithError() throws {
        requestFactory = nil
        removeReview = nil
    }
}
