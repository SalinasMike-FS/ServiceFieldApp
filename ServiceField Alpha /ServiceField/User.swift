//
//  User.swift
//  ServiceField
//
//  Created by Natividad Michael Salinas II on 1/15/23.
//

import Foundation
import UIKit

class User : Codable{
    var firstName: String
    var lastName: String
    var address: String
    var city: String
    var state: String
    var zipCode: String
    var email: String
    var password:String
    var loggedIn: Bool = false
    var dateAdded: Date
    var codes = [String]()
    
    
    init(firstName: String, lastName: String, address: String, city: String, state: String, zipCode: String, email: String, password: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.address = address
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.email = email
        self.password = password
        self.dateAdded = Date()
    }
    
    func login(email: String, password: String) -> Bool {
        if email == self.email && password == self.password {
            loggedIn = true
            return true
        } else {
            return false
        }
    }
    
}

class Employee: User {
    var truckNumber: String

    init(firstName: String, lastName: String, address: String, city: String, state: String, zipCode: String, email: String, password: String, truckNumber: String) {
        self.truckNumber = truckNumber
        super.init(firstName: firstName, lastName: lastName, address: address, city: city, state: state, zipCode: zipCode, email: email, password: password )
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}

class Manager: User {
    var department: String

    init(firstName: String, lastName: String, address: String, city: String, state: String, zipCode: String, email: String, password: String, department: String) {
        self.department = department
        super.init(firstName: firstName, lastName: lastName, address: address, city: city, state: state, zipCode: zipCode, email: email, password:password)
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}

