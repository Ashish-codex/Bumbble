//
//  ModelUsers.swift
//  Bumbble
//
//  Created by Ashish Prajapati on 17/10/24.
//

import Foundation

struct ModelUser: Codable {
    let users: [User]
    let total, skip, limit: Int
}

// MARK: - User
struct User: Codable, Identifiable {
    let id: Int
    let firstName, lastName, maidenName: String
    let age: Int
    let gender: Gender
    let email, phone, username, password: String
    let birthDate: String
    let image: String
    let bloodGroup: String
    let height, weight: Double
    let eyeColor: String
    let ip: String
    let macAddress, university: String
    let ein, ssn, userAgent: String
    
}

enum Gender: String, Codable {
    case female = "female"
    case male = "male"
}
