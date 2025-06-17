//
//  ModelUsers.swift
//  Bumbble
//
//  Created by Ashish Prajapati on 17/10/24.
//

import Foundation


struct ModelUser: Codable {
    let users: [UserData]
    let total, skip, limit: Int
}

struct UserInterest: Codable{
    var id = UUID().uuidString
    var icon: String = ""
    var emoji: String = ""
    let text: String
}



struct UserData: Codable, Identifiable {
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
    let hair: Hair
    let ip: String
    let address: Address
    let macAddress, university: String
    let bank: Bank
    let company: Company
    let ein, ssn, userAgent: String
    let crypto: Crypto
    let role: Role
    
    
    // MARK: - Address
    struct Address: Codable {
        let address, city, state, stateCode: String
        let postalCode: String
        let coordinates: Coordinates
        let country: Country
    }

    // MARK: - Coordinates
    struct Coordinates: Codable {
        let lat, lng: Double
    }

    enum Country: String, Codable {
        case unitedStates = "United States"
    }

    // MARK: - Bank
    struct Bank: Codable {
        let cardExpire, cardNumber, cardType, currency: String
        let iban: String
    }

    // MARK: - Company
    struct Company: Codable {
        let department, name, title: String
        let address: Address
    }

    // MARK: - Crypto
    struct Crypto: Codable {
        let coin: Coin
        let wallet: Wallet
        let network: Network
    }

    enum Coin: String, Codable {
        case bitcoin = "Bitcoin"
    }

    enum Network: String, Codable {
        case ethereumERC20 = "Ethereum (ERC20)"
    }

    enum Wallet: String, Codable {
        case the0Xb9Fc2Fe63B2A6C003F1C324C3Bfa53259162181A = "0xb9fc2fe63b2a6c003f1c324c3bfa53259162181a"
    }

    enum Gender: String, Codable {
        case female = "female"
        case male = "male"
    }

    // MARK: - Hair
    struct Hair: Codable {
        let color: String
        let type: TypeEnum
    }

    enum TypeEnum: String, Codable {
        case curly = "Curly"
        case kinky = "Kinky"
        case straight = "Straight"
        case wavy = "Wavy"
    }

    enum Role: String, Codable {
        case admin = "admin"
        case moderator = "moderator"
        case user = "user"
    }

    
}




// MARK: - User
struct User: Codable, Identifiable {
    let id: Int
    let firstName, lastName: String
    let age: Int
//    let gender: Gender
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
//            gender: .male,
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

//enum Gender: String, Codable {
//    case female = "female"
//    case male = "male"
//}
