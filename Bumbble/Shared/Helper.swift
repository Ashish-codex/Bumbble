//
//  Helper.swift
//  Bumbble
//
//  Created by Ashish Prajapati on 17/10/24.
//

import Foundation

class Helper{
    
    
    class func getProducts() async throws -> ModelProduct {
        
        guard let url = URL(string: Constant.getProducts) else{
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(for: URLRequest(url: url))
        
        let productData = try JSONDecoder().decode(ModelProduct.self, from: data)
        
        return productData
    }
    
    
    class func getUser() async throws -> ModelUser {
        
        guard let url = URL(string: Constant.getUsers) else{
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(for: URLRequest(url: url))
        
        let userData = try JSONDecoder().decode(ModelUser.self, from: data)
        
        return userData
    }
    
}
