//
//  SignupWebServiceTests.swift
//  PhotoAppTestingPracticeTests
//
//  Created by bartek on 01/12/2023.
//

import XCTest
@testable import PhotoAppTestingPractice

final class SignupWebServiceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSignupWebService_WhenGivenSuccessfullResponse_ReturnsSuccess() {
        //Arrange
        let sut = SignupWebService()
        
        let signupFormRequestModel = SignupFormRequestModel(firstName: "Bartek", lastName: "Białobrzewski", email: "test@test.com", password: "12345678")
        
        sut.signup(withForm: signupFormRequestModel) { (signupResponseModel, error) in
            
        }
    }

}
