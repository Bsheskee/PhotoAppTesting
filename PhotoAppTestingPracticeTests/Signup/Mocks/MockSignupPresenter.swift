//
//  MockSignupPresenter.swift
//  PhotoAppTestingPracticeTests
//
//  Created by bartek on 06/12/2023.
//

import Foundation
@testable import PhotoAppTestingPractice

class MockSignupPresenter: SignupPresenterProtocol {
    
    var processUserSignupCalled: Bool = false
    
    required init(formModelValidator: PhotoAppTestingPractice.SignupModelValidatorProtocol, webService: PhotoAppTestingPractice.SignupWebServiceProtocol, delegate: PhotoAppTestingPractice.SignupViewDelegateProtocol) {
        //TODO:
    }
    
    func processUserSignup(formModel: PhotoAppTestingPractice.SignupFormModel) {
        processUserSignupCalled = true
    }
    
    
}
