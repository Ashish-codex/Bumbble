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

struct UserInterest: Codable{
    var id = UUID().uuidString
    var icon: String = ""
    var emoji: String = ""
    let text: String
}

// MARK: - User
struct User: Codable, Identifiable {
    let id: Int
    let firstName, lastName: String
    let age: Int
    let gender: Gender
    let email, phone, username, password: String
    let image, education, work, aboutMe: String
    let height, weight: Double
    
    var basic: [UserInterest]{
        [
            UserInterest(icon: "ruler", text: "\(height)"),
            UserInterest(icon: "graduationcap", text: "\(education)"),
            UserInterest(icon: "wineglass", text: "Socially"),
            UserInterest(icon: "moon.stars.fill", text: "Virgo"),
        ]
    }
    var interests: [UserInterest]{
        [
            UserInterest(emoji: "👟", text: "Running"),
            UserInterest(emoji: "🏋", text: "Gym"),
            UserInterest(emoji: "🎧", text: "Music"),
            UserInterest(emoji: "🍳", text: "Cooking"),
        ]
    }
    
    var userImages:[String]{
        ["https://picsum.photos/300/300", "https://picsum.photos/400/400", "https://picsum.photos/500/500",]
    }
    
    static var mock: User{
        User(
            id: 1620,
            firstName: "Michel",
            lastName: "Lamba",
            age: 24,
            gender: .male,
            email: "michel@gmail.com",
            phone: "9837482984",
            username: "michel@12",
            password: "12345",
            image: Constant.randomImageUrl,
            education: "Engeineering Graduate",
            work: "iOS Developer @Swiggy",
            aboutMe: "Coffee lover ☕ | Dream chaser 🌏, currently building something beautiful in SwiftUI. based in 🇮🇳 | thinking in pixels & logic.",
            height: 180,
            weight: 200
        )
    }
    
}

enum Gender: String, Codable {
    case female = "female"
    case male = "male"
}
