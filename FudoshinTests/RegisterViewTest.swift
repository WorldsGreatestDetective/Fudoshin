//
//  RegisterViewTest.swift
//  FudoshinTests
//
//  Created by Nathan Reilly on 6/29/22.
//

import XCTest
@testable import Fudoshin

class RegisterViewTest: XCTestCase {
    
    var registerView: RegisterView?

    override func setUpWithError() throws {}
    override func tearDownWithError() throws {}

    func testViewGetters() throws {
        registerView = RegisterView(frame: CGRect(x: 0, y: 0, width: 300, height: 650))
        
        
    }
}
