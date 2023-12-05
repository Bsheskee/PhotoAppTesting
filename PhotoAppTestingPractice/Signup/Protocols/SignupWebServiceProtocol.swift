//
//  File.swift
//  PhotoAppTestingPractice
//
//  Created by bartek on 04/12/2023.
//

import Foundation

protocol SignupWebServiceProtocol {
    func signup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping (SignupResponseModel?, SignupError?) -> Void)
}
