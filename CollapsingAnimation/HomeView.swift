//
//  HomeView.swift
//  CollapsingAnimation
//
//  Created by Martin Mitrevski on 4/17/20.
//  Copyright © 2020 Mitrevski. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @State var initialOffset: CGFloat?
    @State var offset: CGFloat?
    
    var body: some View {
        VStack {
            TopView(offset: self.$offset,
                    initialOffset: self.$initialOffset)
            
            ScrollView(.vertical, showsIndicators: false) {
                GeometryReader { geometry in
                    Color.clear.preference(key: OffsetKey.self, value: geometry.frame(in: .global).minY)
                    .frame(height: 0)
                }
                VStack(spacing: 12) {
                    PostsSection(initialOffset: $initialOffset,
                                 offset: $offset,
                                 color: Color.white)
                    PostsSection(initialOffset: $initialOffset, offset: $offset)
                    PostsSection(initialOffset: $initialOffset, offset: $offset)
                    PostsSection(initialOffset: $initialOffset, offset: $offset)
                    Spacer()
                }
            }

        }
        .onPreferenceChange(OffsetKey.self) {
            if self.initialOffset == nil || self.initialOffset == 0 {
                self.initialOffset = $0
            }
            self.offset = $0
        }
    }
    
    private func scrollOffset(_ geometry: GeometryProxy) -> CGFloat {
        let scrollOffset = geometry.frame(in: .global).minY
        return scrollOffset
    }
    
}

struct OffsetKey: PreferenceKey {
    static let defaultValue: CGFloat? = nil
    static func reduce(value: inout CGFloat?,
                       nextValue: () -> CGFloat?) {
        value = value ?? nextValue()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
