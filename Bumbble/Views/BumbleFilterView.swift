//
//  TabViewPagger.swift
//  Bumbble
//
//  Created by Ashish Prajapati on 12/12/24.
//

import SwiftUI

struct BumbleFilterView: View {
    
    var options:[String] = ["Everybody", "Personal"]
    @Binding var selectedTab:String
    @Namespace private var nameSpace
    
    var body: some View {
        HStack(alignment: .top){
            ForEach(options, id: \.self) { curretnTab in
                VStack{
                    Text(curretnTab)
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity)
//                        .background(Color.red)
                    
                    if(selectedTab == curretnTab){
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 1.5)
                            .matchedGeometryEffect(id: "selected", in: nameSpace)
                            
                    }
                    
                }
                .padding()
                .background(Color.black.opacity(0.001))
                .foregroundStyle(selectedTab == curretnTab ? .bumbleBlack : .bumbleGray)
                .onTapGesture {
                     selectedTab = curretnTab
                }
                .animation(.smooth, value: selectedTab)
            }
        }
        
    }
}


fileprivate struct BumbleFilterViewPreivew: View{
    
    var options:[String] = ["Everybody", "Personal"]
    @State var selectedTab:String = "Everybody"
    
    var body: some View {
        BumbleFilterView(options: options, selectedTab: $selectedTab)
    }
    
}



#Preview {
    BumbleFilterViewPreivew()
}
