//
//  SignupViewControllerTests.swift
//  PhotoAppTestingPracticeTests
//
//  Created by bartek on 05/12/2023.
//

import XCTest
@testable import PhotoAppTestingPractice

final class SignupViewControllerTests: XCTestCase {

    var storyboard: UIStoryboard!
    var sut: SignupViewController!
    
    override func setUp() {
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "SignupViewController")
        sut.loadViewIfNeeded()
    }

    override func tearDown() {
        storyboard = nil
        sut = nil
    }
    func testSignupViewController_WhenCreated_HasRequiredTextFieldsEmpty() throws {
       
        let firstNameTextField = try XCTUnwrap(sut.firstNameTextField, "The firstNameTextField is not connected to an IBOutlet")
        let lastNameTextField = try XCTUnwrap(sut.lastNameTextField, "The lastNameTextField is not connected to an IBOutlet")
        let emailTextField = try XCTUnwrap(sut.emailTextField, "The emailTextField is not connected to an IBOutlet")
        let passwordTextField = try XCTUnwrap(sut.passwordTextField, "The passwordTextField is not connected to an IBOutlet")
        let repeatPasswordTextField = try XCTUnwrap(sut.repeatPasswordTextField, "The repeatPasswordTextField is not connected to an IBOutlet")
        
        XCTAssertEqual(firstNameTextField.text, "", "First name textfield was not empty when the view controller loaded")
        XCTAssertEqual(lastNameTextField.text, "", "Last name textfield was not empty when the view controller loaded")
        XCTAssertEqual(emailTextField.text, "", "Email textfield was not empty when the view controller loaded")
        XCTAssertEqual(passwordTextField.text, "", "Password textfield was not empty when the view controller loaded")
        XCTAssertEqual(repeatPasswordTextField.text, "", "Repeat password textfield was not empty when the view controller loaded")
    }
    func testViewController_WhenCreated_HasSignupButtonAndAction() throws {
        //Arrange
        let signUpButton: UIButton = try XCTUnwrap(sut.signupButton, "Signup Button does not have a referencing outlet")
        //Act
        let signupButtonActions = try XCTUnwrap(signUpButton.actions(forTarget: sut, forControlEvent: .touchUpInside),  "Signup button does not have an action")
        //Assert
        XCTAssertEqual(signupButtonActions.count, 1)
        XCTAssertEqual(signupButtonActions.first, "signupButtonTapped:", "There is no action with a name signupButtonTapped assigned to signup button")
    }
    func testViewController_WhenSignupButtonTapped_InvokesSignupProcess() {
        //Arrange
        let mockSignupModelValidator = MockSignupModelValidator()
        let signupWebservice = MockSignupWebService()
        let mockSignupViewDelegate = MockSignupViewDelegate()
        let mockSignupPresenter = MockSignupPresenter(formModelValidator: mockSignupModelValidator, webService: signupWebservice, delegate: mockSignupViewDelegate)
        
        sut.signupPresenter = mockSignupPresenter
        //Act
        sut.signupButton.sendActions(for: .touchUpInside)
        
        //Assert
        XCTAssertTrue(mockSignupPresenter.processUserSignupCalled, "The processUserSignup() method was not called on a Presenter object when the signup button was tapped in a SignupViewController")
    }

}

