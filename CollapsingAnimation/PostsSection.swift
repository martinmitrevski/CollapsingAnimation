//
//  PostsSection.swift
//  CollapsingAnimation
//
//  Created by Martin Mitrevski on 4/17/20.
//  Copyright © 2020 Mitrevski. All rights reserved.
//

import SwiftUI

struct PostsSection: View {
    
    @Binding var initialOffset: CGFloat?
    @Binding var offset: CGFloat?
    @State var posts: [Post] = PostRepository.posts()
    var color: Color = Color("navTitle1")

    var body: some View {
        VStack {
            if showTitleView() {
                TitleView(title: "My posts",
                          imageName: color == Color.white ? "favouritesWhite" : "favourites",
                foregroundColor: color)
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(posts) { post in
                        PostView(post: post)
                    }
                }
                .padding(24)
            }
            
            Spacer()
        }
    }
    
    private func showTitleView() -> Bool {
        guard let initialOffset = initialOffset,
            let offset = offset else {
            return true
        }
        
        if initialOffset > offset {
            return false
        }
        
        return true
    }
    
}

struct PostsSection_Previews: PreviewProvider {
    static var previews: some View {
        PostsSection(initialOffset: .constant(110.0), offset: .constant(110.0))
    }
}
