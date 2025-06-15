//
//  CapsuleView.swift
//  Bumbble
//
//  Created by Ashish Prajapati on 15/06/25.
//

import SwiftUI

struct CapsuleView: View {
    
    var icon: String = ""
    var emoji: String = ""
    let text: String
    
    var body: some View {
        HStack{
            if !icon.isEmpty{
                Image(systemName: icon)
            }else if !emoji.isEmpty{
                Text(emoji)
            }
            
            Text(text)
        }
        .font(.callout)
        .fontWeight(.medium)
        .padding(.vertical, 6)
        .padding(.horizontal, 12)
        .background(.bumbleLightYellow)
        .clipShape(RoundedRectangle(cornerRadius: 32))
    }
}

#Preview {
    CapsuleView(text: "Graduate Dgree")
}
