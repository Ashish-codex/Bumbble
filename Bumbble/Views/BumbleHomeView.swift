//
//  BumbleHomeView.swift
//  Bumbble
//
//  Created by Ashish Prajapati on 17/10/24.
//

import SwiftUI
import SwiftfulUI

struct BumbleHomeView: View {
    
    var options:[String] = ["Everybody", "Personal"]
    @State var arrUserData: [UserData] = []
    @State var selectedIndex:Int = 0
    @State var draggOffset:CGFloat = 0
    @State var cardSwipeDirection:[Int:Bool] = [:] // UserID : (swipe right = true)
    @AppStorage("bumble_home_filter") var selectedTab:String = "Everybody"
    
    
    var body: some View {
        ZStack{
            Color.bumbleWhite.ignoresSafeArea()
            
            VStack(spacing: 12){
                
                headerView
                
                BumbleFilterView(options: options, selectedTab: $selectedTab)
                    .background(Divider(), alignment: .bottom)
                
//                BumbleCardView()

                ZStack(){
                    if !arrUserData.isEmpty{
                        ForEach(
                            Array(arrUserData.enumerated()),
                            id: \.offset
                        ) { (index, userData) in
                            
                            let isPrevios = (selectedIndex - 1) == index
                            let isCurrent = selectedIndex == index
                            let isNext = (selectedIndex + 1) == index
                            let currentCardSwipeDirection = cardSwipeDirection[userData.id]
                            
                            if isPrevios || isCurrent || isNext{
                                
                                RoundedRectangle(cornerRadius: 32)
                                    .fill(index == 0 ? .pink : .blue)
                                    .overlay {
                                        VStack{
                                            HStack{
                                                Text("index:")
                                                Text("\(index)")
                                            }
                                            HStack{
                                                Text("offset:")
                                                Text("\(draggOffset)")
                                            }
                                        }
                                        .font(.title3)
                                        .foregroundStyle(Color.white)
                                    }
                                    .zIndex(Double(arrUserData.count - index))
                                    .withDragGesture(
                                        .horizontal,
//                                        minimumDistance: <#T##CGFloat#>,
                                        resets: true,
//                                        animation: <#T##Animation#>,
                                        rotationMultiplier: 1.05,
//                                        scaleMultiplier: <#T##CGFloat#>,
                                        onChanged: { dragOffset in
                                            draggOffset = dragOffset.width
                                        },
                                        onEnded: { dragOffset in
//                                            selectedIndex += 1
                                            if dragOffset.width > 150{
                                                userDidSelectCard(
                                                    index: index,
                                                    isLike: true
                                                )
                                            }else if dragOffset.width < -150{
                                                userDidSelectCard(
                                                    index: index,
                                                    isLike: false
                                                )
                                            }
                                        }
                                    )
                                    .offset(x: currentCardSwipeDirection == nil ? 0 : currentCardSwipeDirection
                                        == true ? 900 : -900)
                                    
                            }
                            
                        }
                    }else{
                        ProgressView()
                    }
                    
                    
                }
                .animation(.smooth, value: selectedIndex)
                
                
            }
            .padding(8)
            .frame(maxHeight: .infinity, alignment: .top)
            
        }
        .onAppear {
            Task{
                await getUser()
            }
        }
        
        
    }
    
    
    private func userDidSelectCard(index: Int, isLike: Bool){
        let user = arrUserData[index]
        cardSwipeDirection[user.id] = isLike
        
        selectedIndex += 1
    }
    
    
    private func getUser() async{
        do {
            arrUserData =  try await Helper.getUser().users
        } catch let error {
            print("Error: \(error.localizedDescription)")
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
