//
//  InventoryItem.swift
//  ServiceField
//
//  Created by Natividad Michael Salinas II on 1/28/23.
//

import Foundation

class InventoryItem : Codable{
    let name: String
    var quantity: Int
    var type: String // "part" or "tool"
    let truckNumber: Int

    init(name: String, quantity: Int, type: String, truckNumber: Int) {
        self.name = name
        self.quantity = quantity
        self.type = type
        self.truckNumber = truckNumber
    }
}
