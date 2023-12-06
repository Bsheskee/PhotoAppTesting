//
//  SignupPresenterProtocol.swift
//  PhotoAppTestingPractice
//
//  Created by bartek on 06/12/2023.
//

import Foundation

protocol SignupPresenterProtocol: AnyObject {
    init(formModelValidator: SignupModelValidatorProtocol, webService: SignupWebServiceProtocol, delegate: SignupViewDelegateProtocol)
    func processUserSignup(formModel: SignupFormModel)
}
