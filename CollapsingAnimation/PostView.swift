//
//  PostView.swift
//  CollapsingAnimation
//
//  Created by Martin Mitrevski on 4/17/20.
//  Copyright © 2020 Mitrevski. All rights reserved.
//

import SwiftUI

struct PostView: View {
    
    @State var post: Post
    
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            Text(post.title)
                .font(.system(size: 16))
                .fontWeight(.bold)
                .foregroundColor(Color("navTitle1"))

            .padding(.top, 8)
            VStack(spacing: 8) {
                Text(post.tags[0])
                Text(post.tags[1])
                Text(post.tags[2])
            }
        }
        .padding(.leading, 8)
        .padding(.trailing, 8)
        .frame(width: 150, height: 200, alignment: .center)
        .modifier(ShadowViewModifier())
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: PostRepository.posts()[0])
    }
}

struct ShadowViewModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content.background(Color(UIColor.systemBackground))
        .cornerRadius(20)
        .modifier(ShadowModifier())
        .overlay(RoundedRectangle(cornerRadius: 16)
        .stroke(Color.gray,
                lineWidth: 0.05))
    }
    
}

struct ShadowModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
    }
    
}
