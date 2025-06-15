//
//  BumbleHomeView.swift
//  Bumbble
//
//  Created by Ashish Prajapati on 17/10/24.
//

import SwiftUI

struct BumbleHomeView: View {
    
    var options:[String] = ["Everybody", "Personal"]
    @AppStorage("bumble_home_filter") var selectedTab:String = "Everybody"
    
    var body: some View {
        ZStack{
            Color.bumbleWhite.ignoresSafeArea()
            
            VStack(spacing: 12){
                
                headerView
                
                BumbleFilterView(options: options, selectedTab: $selectedTab)
                    .background(Divider(), alignment: .bottom)
                
                BumbleCardView()

                
                Spacer()
                
            }
            .padding(8)
        }
    }
    
    
    
    var headerView: some View{
        HStack(spacing:0){
            
            HStack(spacing: 0){
                Image(systemName: "line.horizontal.3")
                    .padding(8)
                    .onTapGesture {}
                
                Image(systemName: "arrow.uturn.left")
                    .padding(8)
                    .onTapGesture {}
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            
            Text("bumble")
                .font(.title)
                .foregroundStyle(.bumbleYellow)
                .frame(maxWidth: .infinity, alignment: .center)
            
            
            Image(systemName: "slider.horizontal.3")
                .padding(8)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .onTapGesture {}

            
        }
        .font(.title2)
        .fontWeight(.medium)
        .foregroundStyle(.bumbleBlack)
    }
    
    
    
    
}

#Preview {
    BumbleHomeView()
}
