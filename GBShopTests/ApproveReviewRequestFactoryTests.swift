//
//  ApproveReviewRequestFactoryTests.swift
//  GBShopTests
//
//  Created by Сергей Горячев on 25.09.2021.
//

import XCTest
@testable import GBShop

class ApproveReviewRequestFactoryTests: XCTestCase {
    
    var requestFactory: RequestFactory?
    var approveReview: ApproveReviewRequestFactory?

    override func setUpWithError() throws {
        requestFactory = RequestFactory()
        approveReview = requestFactory?.makeApproveReviewRequestFactory()
    }
    
    func testApproveReview() throws {
        // Given
        let idComment = 123
        
        // When
        let reviewApproved = expectation(description: "review approved")
        let approveReview = try XCTUnwrap(approveReview)
        
        approveReview.approveReview(idComment: idComment) { response in
            // Then
            switch response.result {
            case .success(let approveReview):
                print(approveReview)
                XCTAssertEqual(approveReview.result, 1)
                reviewApproved.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 3)
    }

    override func tearDownWithError() throws {
        requestFactory = nil
        approveReview = nil
    }
}
