//
//  SignupPresenter.swift
//  PhotoAppTestingPractice
//
//  Created by bartek on 05/12/2023.
//

import Foundation

class SignupPresenter {
        
    private var formModelValidator: SignupModelValidatorProtocol
    
    init(formModelValidator: SignupModelValidatorProtocol) {
        self.formModelValidator = formModelValidator
    }
    
    func processUserSignup(formModel: SignupFormModel) {
        if !formModelValidator.isFirstNameValid(firstName: formModel.firstName) {
            return
        }
        if !formModelValidator.isLastNameValid(lastName: formModel.lastName) {
            return
        }
        if !formModelValidator.isValidEmailFormat(email: formModel.email) {
            return
        }
        if !formModelValidator.isPasswordValid(password: formModel.password) {
            return
        }
        if !formModelValidator.doPasswordsMatch(password: formModel.password, repeatPassword: formModel.repeatPassword) {
            return
        }
    }
    
}
