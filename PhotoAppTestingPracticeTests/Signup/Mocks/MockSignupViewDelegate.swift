//
//  MockSignupViewDelegate.swift
//  PhotoAppTestingPracticeTests
//
//  Created by bartek on 05/12/2023.
//

import Foundation
import XCTest
@testable import PhotoAppTestingPractice

class MockSignupViewDelegate: SignupViewDelegateProtocol {
    var expectation: XCTestExpectation?
    var successfulSignupCounter = 0
    var errorHandlerCounter = 0
    var signupError: SignupError?
    
    func successfulSignup() {
        successfulSignupCounter += 1
        expectation?.fulfill()
    }
    
    func errorHandler(error: SignupError) {
        signupError = error
        errorHandlerCounter += 1
        expectation?.fulfill()
    }
    
}
