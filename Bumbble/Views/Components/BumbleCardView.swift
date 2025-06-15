//
//  BumbleCardView.swift
//  Bumbble
//
//  Created by Ashish Prajapati on 15/06/25.
//

import SwiftUI
import SwiftfulUI

struct BumbleCardView: View {
    
    var user: User = .mock
    var onSupperLikedClicked: ( ()-> Void )? = nil
    var onXMarkClicked: ( ()-> Void )? = nil
    var onCheckMarkClicked: ( ()-> Void )? = nil
    var onSendComplimentClicked: ( ()-> Void )? = nil
    var onHideAndReportClicked: ( ()-> Void )? = nil
    @State private var cardFrame: CGRect = .zero
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 0){
                
                hearderCell
                    .frame(height: cardFrame.height)
                
                aboutMeSection
                    .padding(.horizontal, 24)
                    .padding(.vertical, 24)

                interestsSection
                    .padding(.horizontal, 24)
                    .padding(.vertical, 24)

                userImagesSection
                    .frame(height: cardFrame.height)
                
                locationSection
                    .padding(.horizontal, 24)
                    .padding(.vertical, 24)
                
                footerSection
                    .padding(.vertical, 60)
                    .padding(.horizontal, 32)
                
                
            }
        }
        .scrollIndicators(.hidden)
        .background(.bumbleBackgroundYellow)
        .overlay(alignment: .bottomTrailing, content: {
            supperLike
        })
        .clipShape(RoundedRectangle(cornerRadius: 32))
        .readingFrame { frame in
            cardFrame = frame
        }
    }
    
    
    
    
    private func setTitle(title: String) -> some View{
        return VStack{
            Text(title)
                .font(.body)
                .foregroundStyle(.bumbleGray)
        }
    }
    
    
    var supperLike: some View{
        Image(systemName: "hexagon.fill")
            .font(.system(size: 60))
            .foregroundStyle(.bumbleYellow)
            .overlay {
                Image(systemName: "star.fill")
                    .font(.system(size: 30, weight: .medium))
                    .foregroundStyle(.bumbleBlack)
                
            }
            .onTapGesture {
                onSupperLikedClicked?()
            }
            .padding(24)
    }
    
    var hearderCell: some View{
        ZStack(alignment: .bottomLeading){
            ImageLoaderView(urlString: user.image )
                
            
            VStack(alignment: .leading, spacing: 8){
                Text("\(user.firstName), \(user.age)")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                HStack(spacing: 4){
                    Image(systemName: "suitcase")
                    Text(user.work)
                }
                
                HStack(spacing: 4){
                    Image(systemName: "graduationcap")
                    Text(user.education)
                }
                
                BumbbleHeartView()
            }
            .padding(24)
            .font(.callout)
            .fontWeight(.medium)
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundStyle(.bumbleWhite)
            .background(
                LinearGradient(
                    colors: [
                        .bumbleBlack.opacity(0),
                        .bumbleBlack.opacity(0.6),
                        .bumbleBlack.opacity(0.6),
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            
        }
    }
    
    var aboutMeSection: some View{
        VStack(alignment: .leading, spacing: 12){
            setTitle(title: "About Me")
            
            Text(user.aboutMe)
                .font(.body)
                .fontWeight(.semibold)
                .foregroundStyle(.bumbleBlack)
            
            HStack(spacing: 0){
                BumbbleHeartView()
                
                Text("Send a compliment")
                    .font(.caption)
                    .fontWeight(.semibold)
            }
            .padding([.horizontal, .trailing], 9)
            .background(.bumbleYellow)
            .clipShape(RoundedRectangle(cornerRadius: 32))
            .onTapGesture {
                onSendComplimentClicked?()
            }
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var interestsSection: some View{
        VStack(alignment: .leading, spacing: 22){
            VStack(alignment:.leading, spacing: 12){
                setTitle(title: "Basics")
                CapsuleGridView(interesets: user.basic)
            }
            
            VStack(alignment:.leading, spacing: 12){
                setTitle(title: "My Interests")
                CapsuleGridView(interesets: user.interests)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var userImagesSection: some View{
        ForEach(user.userImages, id: \.self) { item in
            ImageLoaderView(urlString: item)
                
        }
    }
    
    var locationSection: some View{
        VStack(alignment: .leading, spacing: 12){
            HStack(spacing: 8){
                Image(systemName: "mappin.and.ellipse.circle.fill")
                Text(user.firstName + "'s Location'")
            }
            .foregroundStyle(.bumbleGray)
            .font(.body)
            .fontWeight(.medium)
            
            Text("10 miles away")
                .font(.headline)
                .foregroundStyle(.bumbleBlack)
            
            CapsuleView(emoji:"🇮🇳", text: "Lives in Mumbai, Mum")
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var footerSection: some View{
        VStack{
            
            HStack{
                
                Circle()
                    .fill(.bumbleYellow)
                    .overlay {
                        Image(systemName: "xmark")
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                    .frame(width: 60, height: 60)
                    .onTapGesture {
                        onXMarkClicked?()
                    }
                
                Spacer()
                
                Circle()
                    .fill(.bumbleYellow)
                    .overlay {
                        Image(systemName: "checkmark")
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                    .frame(width: 60, height: 60)
                    .onTapGesture {
                        onCheckMarkClicked?()
                    }
            }
            
            Text("Hide and Report")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundStyle(.bumbleGray)
                .padding(8)
                .background(.black.opacity(0.001))
                .onTapGesture {
                    onHideAndReportClicked?()
                }
        }
    }
}

#Preview {
    BumbleCardView()
        .padding(.vertical, 20)
        .padding(.horizontal, 16)
}
