//
//  User.swift
//  LearnMVP
//
//  Created by Eslam on 6/4/20.
//  Copyright © 2020 Ioslam. All rights reserved.
//

import Foundation

struct User: Codable {
    var name, email: String?
    let address: Address?
}

// MARK: - Address
struct Address: Codable {
    let street, suite, city, zipcode: String?
}
