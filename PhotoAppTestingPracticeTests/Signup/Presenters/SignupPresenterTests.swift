//
//  SignupPresenterTests.swift
//  PhotoAppTestingPracticeTests
//
//  Created by bartek on 05/12/2023.
//

import XCTest
@testable import PhotoAppTestingPractice

final class SignupPresenterTests: XCTestCase {

    override class func setUp() {
        
    }
    override class func tearDown() {
        
    }
    
    func testSignupPresenter_WhenInformationProvided_WillValidateEachProperty() {
        //Given
        let signupFormModel = SignupFormModel(firstName: "Bartek", lastName: "Białobrzewski", email: "test@test.com", password: "12345678", repeatPassword: "12345678")
        
        let mockSignupModelValidator = MockSignupModelValidator()
        let sut = SignupPresenter(formModelValidator: mockSignupModelValidator)
        //When
        
        sut.processUserSignup(formModel: signupFormModel)
        
        //Then
        XCTAssertTrue(mockSignupModelValidator.isFirstNameValidated, "First name was not validated")
        XCTAssertTrue(mockSignupModelValidator.isLastNameValidated, "Last name was not validated")
        XCTAssertTrue(mockSignupModelValidator.isEmailValidated, "Email was not validated")
        XCTAssertTrue(mockSignupModelValidator.isPasswordValidated, "Password was not validated")
        XCTAssertTrue(mockSignupModelValidator.isPasswordEqualityValidated, "Did not validate if passwords match")

    }

}
