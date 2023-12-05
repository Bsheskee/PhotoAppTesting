//
//  SignupViewDelegateProtocol.swift
//  PhotoAppTestingPractice
//
//  Created by bartek on 05/12/2023.
//

import Foundation

protocol SignupViewDelegateProtocol: AnyObject {
    func successfulSignup()
    func errorHandler(error: SignupError)
}
