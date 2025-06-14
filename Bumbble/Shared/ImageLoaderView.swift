//
//  ImageLoaderView.swift
//  SpotifyUI
//
//  Created by Ashish Prajapati on 15/10/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageLoaderView: View {
    
    var body: some View {
    
        WebImage(url: URL(string: Constant.randomImageUrl))
            .resizable()
            .indicator(.activity)
            .aspectRatio(contentMode: .fill)
    }
}

#Preview {
    ImageLoaderView()
}
