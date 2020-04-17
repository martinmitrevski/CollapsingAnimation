//
//  TopView.swift
//  CollapsingAnimation
//
//  Created by Martin Mitrevski on 4/17/20.
//  Copyright © 2020 Mitrevski. All rights reserved.
//

import SwiftUI

struct TopView: View {
    
    @Binding var offset: CGFloat?
    @Binding var initialOffset: CGFloat?
    
    var body: some View {
        HStack(spacing: 12) {
            Text("Martin's blog")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
            Spacer()
            Button(action: {
                print("button pressed")
            }) {
                Image(systemName: "magnifyingglass")
                    .renderingMode(.original)
                    .foregroundColor(Color("navTitle1"))
                    .font(.system(size: 16, weight: .medium))
                    .frame(width: 36, height: 36)
                    .background(Color.white)
                    .clipShape(Circle())
                    .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
            }
            
            
        }
        .padding(.top, 35)
        .padding(.leading, 15)
        .padding(10)
        .background(viewForBackground())
        .animation(.linear)
    }
    
    private func viewForBackground() -> some View {
        let values = heightAndRadiusForBackground()
        return RoundedRectangle(cornerRadius: values.1)
            .fill(LinearGradient(gradient: Gradient(colors: [Color("navTitle1"), Color.purple]), startPoint: .top, endPoint: .bottom))
            .frame(height: values.0)
            .animation(.linear)
    }
    
    private func heightAndRadiusForBackground() -> (CGFloat, CGFloat) {
        let maxHeight: CGFloat = 350
        let minHeight: CGFloat = 127
        let factor: CGFloat = 5
        let radius: CGFloat = 60
        
        guard let initialOffset = initialOffset,
            let offset = offset else {
            return (maxHeight, radius)
        }
        
        if initialOffset > offset {
            let diff = initialOffset - offset
            if diff > 40 {
                return (minHeight, 0)
            } else {
                let computed = maxHeight - (factor * diff)
                let height = (computed > minHeight && computed < maxHeight) ? computed : minHeight
                let returnRadius = height == minHeight ? 0 : radius
                return (height, returnRadius)
            }
        }
        
        return (maxHeight, radius)
    }
    
}
struct TopView_Previews: PreviewProvider {
        
    static var previews: some View {
        TopView(offset: .constant(110), initialOffset: .constant(110))
    }
}
