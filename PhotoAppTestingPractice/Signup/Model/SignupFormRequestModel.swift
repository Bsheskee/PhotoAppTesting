//
//  SignupFormRequestModel.swift
//  PhotoAppTestingPractice
//
//  Created by bartek on 01/12/2023.
//

import Foundation

struct SignupFormRequestModel: Encodable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
}
