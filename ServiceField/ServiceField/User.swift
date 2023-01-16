//
//  User.swift
//  ServiceField
//
//  Created by Natividad Michael Salinas II on 1/15/23.
//

import Foundation
import UIKit

class User {
    var firstName: String
    var lastName: String
    var address: String
    var city: String
    var state: String
    var zipCode: String

    init(firstName: String, lastName: String, address: String, city: String, state: String, zipCode: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.address = address
        self.city = city
        self.state = state
        self.zipCode = zipCode
    }
}

class Employee: User {
    var truckNumber: String

    init(firstName: String, lastName: String, address: String, city: String, state: String, zipCode: String, truckNumber: String) {
        self.truckNumber = truckNumber
        super.init(firstName: firstName, lastName: lastName, address: address, city: city, state: state, zipCode: zipCode)
    }
}

class Manager: User {
    var department: String

    init(firstName: String, lastName: String, address: String, city: String, state: String, zipCode: String, department: String) {
        self.department = department
        super.init(firstName: firstName, lastName: lastName, address: address, city: city, state: state, zipCode: zipCode)
    }
}

