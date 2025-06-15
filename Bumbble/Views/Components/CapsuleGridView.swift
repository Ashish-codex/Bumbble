//
//  CapsuleGridView.swift
//  Bumbble
//
//  Created by Ashish Prajapati on 15/06/25.
//

import SwiftUI
import SwiftfulUI

struct CapsuleGridView: View {
    
    var interesets: [UserInterest] = User.mock.interests
    
    var body: some View {
        ZStack{
            NonLazyVGrid(
                columns: 2,
                alignment: .leading, items: interesets
            ) { item in
                if let item{
                    CapsuleView(
                        icon: item.icon,
                        emoji: item.emoji,
                        text: item.text
                    )
                }else{
                    EmptyView()
                }
                
            }
        }
    }
}

#Preview {
    CapsuleGridView()
}
