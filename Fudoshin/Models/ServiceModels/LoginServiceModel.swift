//
//  LoginServiceModel.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 7/8/22.
//

import Foundation

class LoginServiceModel: LoginServiceModelProtocol {
    internal var user: UserModelProtocol? {
        didSet {
            setid(id: user!.id)
            setFirstName(firstName: user!.firstName)
            setLastName(lastName: user!.lastName)
            setBeltlevel(beltLevel: user!.beltLevel)
            
            setEmail(email: user!.email)
            setPassword(password: user!.password)
        }
    }
    internal var appDatabase: AppDatabaseProtocol
    
    init(email: String, password: String, appDatabase: AppDatabaseProtocol) {
        self.email = email
        self.password = password
        
        self.appDatabase = appDatabase
    }
    
    var email: String
    var password: String
    
    var id: String?
    var firstName: String?
    var lastName: String?
    var beltLevel: BeltLevel?
    
    func fetchUserByLogin() -> ErrorType? {
        var loginError: ErrorType? = nil
        password = password.SHA384(string: password)
        
        do {
            try appDatabase.dbwriter.read({ db in
                let users = try User.fetchAll(db)
                if let usersByEmail = filterUsersByEmail(users: users) {
                    if let usersByPassword = filterUsersByPassword(users: usersByEmail) {
                        
                        if let user = usersByPassword.first {
                            if password == user.password {
                                self.user = user
                            } else {
                                loginError = .invalidPassword
                            }
                            
                        } else {
                            loginError = .userNotFound
                        }
                    } else {
                        loginError = .userNotFound
                    }
                } else {
                    loginError = .userNotFound
                }
            })
        } catch {
            print(error)
        }
        return loginError
    }
    
    func fetchUserByKeychain() -> ErrorType? {
        var loginError: ErrorType? = nil
        
        do {
            try appDatabase.dbwriter.read({ db in
                let users = try User.fetchAll(db)
                if let usersByEmail = filterUsersByEmail(users: users) {
                    if let usersByPassword = filterUsersByPassword(users: usersByEmail) {
                        
                        if let user = usersByPassword.first {
                            if password == user.password {
                                self.user = user
                            } else {
                                loginError = .invalidPassword
                            }
                            
                        } else {
                            loginError = .userNotFound
                        }
                    } else {
                        loginError = .userNotFound
                    }
                } else {
                    loginError = .userNotFound
                }
            })
        } catch {
            print(error)
        }
        
        return loginError
    }
    
    internal func filterUsersByEmail(users: [UserModelProtocol]) -> [UserModelProtocol]? {
        //guard let user = user else {return nil}
        
        let newUsers = users.filter {$0.email == email}
        return newUsers
    }
    
    internal func filterUsersByPassword(users: [UserModelProtocol]) -> [UserModelProtocol]? {
        //guard let user = user else {return nil}
        
        let newUsers = users.filter {$0.password == password}
        return newUsers
    }
    
    internal func setid(id: String) {
        self.id = id
    }
    
    internal func setFirstName(firstName: String) {
        self.firstName = firstName
    }
    
    internal func setLastName(lastName: String) {
        self.lastName = lastName
    }
    
    internal func setBeltlevel(beltLevel: BeltLevel) {
        self.beltLevel = beltLevel
    }
    
    internal func setEmail(email: String) {
        self.email = email
    }
    
    internal func setPassword(password: String) {
        self.password = password
    }
    
}
