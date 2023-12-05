//
//  SignupModelValidatorProtocol.swift
//  PhotoAppTestingPractice
//
//  Created by bartek on 05/12/2023.
//

import Foundation

protocol SignupModelValidatorProtocol {
    func isFirstNameValid(firstName: String) -> Bool
    func isLastNameValid(lastName: String) -> Bool
    func isValidEmailFormat(email: String) -> Bool
    func isPasswordValid(password: String) -> Bool
    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool
}
