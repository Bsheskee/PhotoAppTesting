//
//  SignupPresenterTests.swift
//  PhotoAppTestingPracticeTests
//
//  Created by bartek on 05/12/2023.
//

import XCTest
@testable import PhotoAppTestingPractice

final class SignupPresenterTests: XCTestCase {
    
    var signupFormModel: SignupFormModel!
    var mockSignupModelValidator: MockSignupModelValidator!
    var mockSignupWebService: MockSignupWebService!
    var sut: SignupPresenter!
    var mockSignupViewDelegate: MockSignupViewDelegate!

    
    override func setUp() {
        //arrange
        signupFormModel = SignupFormModel(firstName: "Bartek", lastName: "Białobrzewski", email: "test@test.com", password: "12345678", repeatPassword: "12345678")
        mockSignupModelValidator = MockSignupModelValidator()
        mockSignupWebService = MockSignupWebService()
        mockSignupViewDelegate = MockSignupViewDelegate()
        
        sut = SignupPresenter(formModelValidator: mockSignupModelValidator, webService: mockSignupWebService, delegate: mockSignupViewDelegate)
    }
    override func tearDown() {
        signupFormModel = nil
        mockSignupModelValidator = nil
        mockSignupWebService = nil
        sut = nil
        mockSignupViewDelegate = nil
    }
    
    func testSignupPresenter_WhenInformationProvided_WillValidateEachProperty() {
        //When
        
        sut.processUserSignup(formModel: signupFormModel)
        
        //Then
        XCTAssertTrue(mockSignupModelValidator.isFirstNameValidated, "First name was not validated")
        XCTAssertTrue(mockSignupModelValidator.isLastNameValidated, "Last name was not validated")
        XCTAssertTrue(mockSignupModelValidator.isEmailValidated, "Email was not validated")
        XCTAssertTrue(mockSignupModelValidator.isPasswordValidated, "Password was not validated")
        XCTAssertTrue(mockSignupModelValidator.isPasswordEqualityValidated, "Did not validate if passwords match")

    }
    
    func testSignupPresenter_WhenGivenValidFormModel_ShouldCallSignupMethod() {
        
        //act
        sut.processUserSignup(formModel: signupFormModel)
        
        //assert
        XCTAssertTrue(mockSignupWebService.isSignupMethodCalled, "The signup() method was not called in the SignupWebService class")
    }
    func testSignupPresenter_WhenSignupOperationSuccessful_CallsSuccessOnViewDelegate() {
        //arrange
        let myExpectation = expectation(description: "Expected the successfulSignup() method to be called")
        mockSignupViewDelegate.expectation = myExpectation
        //act
        sut.processUserSignup(formModel: signupFormModel)
        self.wait(for: [myExpectation], timeout: 5)
        
        //assert
        XCTAssertEqual(mockSignupViewDelegate.successfulSignupCounter, 1, "The successfulSignup() method was called more than once")
    }
    
    func testSignupPresenter_WhenSignupOperationFails_CallsErrorOnViewDelegate() {
        //arrange
        let myExpectation = expectation(description: "Expected the errorHandler() method to be called")
        mockSignupViewDelegate.expectation = myExpectation
        mockSignupWebService.shouldReturnError = true
        
        //act
        sut.processUserSignup(formModel: signupFormModel)
        self.wait(for: [myExpectation], timeout: 5)
        
        //assert
        XCTAssertEqual(mockSignupViewDelegate.successfulSignupCounter, 0)
        XCTAssertEqual(mockSignupViewDelegate.errorHandlerCounter, 1)
        XCTAssertNotNil(mockSignupViewDelegate.signupError)
    }

}
