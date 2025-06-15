//
//  BumbbleHeartView.swift
//  Bumbble
//
//  Created by Ashish Prajapati on 15/06/25.
//

import SwiftUI

struct BumbbleHeartView: View {
    var body: some View {
        ZStack{
            Circle()
                .fill(.bumbleYellow)
                .frame(width: 40, height: 40)
                
            Image(systemName: "bubble.fill")
                .foregroundStyle(.bumbleBlack)
                .font(.system(size: 22))
                .offset(y: 2)
            
            Image(systemName: "heart.fill")
                .foregroundStyle(.bumbleYellow)
                .font(.system(size: 10))
        }
    }
}

#Preview {
    BumbbleHeartView()
}
