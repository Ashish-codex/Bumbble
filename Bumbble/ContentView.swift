//
//  ContentView.swift
//  Bumbble
//
//  Created by Ashish Prajapati on 17/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var usser:[UserData] = []
    
    var body: some View {
        
        ScrollView{
            VStack {
                
                ForEach(usser) { user in
                    Text("\(user.firstName) \(user.lastName)")
                        .frame(maxWidth:.infinity, alignment: .leading)
                        
                }
                
                
            }
            .padding()
        }
        .task {
            await apiGetUser()
        }
    }
    
    
    
    func apiGetUser() async {
        do {
            let userData = try await Helper.getUser()
            usser = userData.users
        } catch let err {
            print("Error: \(err.localizedDescription)")
        }
        
    }
    
}

#Preview {
    ContentView()
}
