//
//  RegisterViewDelegateProtocol.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 6/14/22.
//

import Foundation

protocol RegisterViewDelegateProtocol {
    func registerUser()
    func presentAlertEmptyField()
    func presentAlertNameField()
    func presentAlertPasswordField()
}
