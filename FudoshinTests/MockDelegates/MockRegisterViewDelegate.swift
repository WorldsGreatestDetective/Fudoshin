//
//  MockRegisterViewDelegate.swift
//  FudoshinTests
//
//  Created by Nathan Reilly on 6/29/22.
//

import Foundation
@testable import Fudoshin

class MockRegisterViewDelegate: RegisterViewDelegateProtocol {
    func registerUser() {}
    
    func presentAlertEmptyField() {}
}
