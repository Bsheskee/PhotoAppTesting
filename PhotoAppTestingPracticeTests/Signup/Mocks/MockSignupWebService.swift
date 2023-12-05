//
//  MockSignupWebService.swift
//  PhotoAppTestingPracticeTests
//
//  Created by bartek on 05/12/2023.
//

import Foundation
@testable import PhotoAppTestingPractice

class MockSignupWebService: SignupWebServiceProtocol {
    
    var isSignupMethodCalled: Bool = false
    var shouldReturnError: Bool = false
    
    func signup(withForm formModel: PhotoAppTestingPractice.SignupFormRequestModel, completionHandler: @escaping (PhotoAppTestingPractice.SignupResponseModel?, PhotoAppTestingPractice.SignupError?) -> Void) {
        isSignupMethodCalled = true
        if shouldReturnError {
            completionHandler(nil, SignupError.failedRequest(description: "Signup request was not successful"))
        } else {
            let responseModel = SignupResponseModel(status: "ok")
            completionHandler(responseModel, nil)
        }
    }
}
