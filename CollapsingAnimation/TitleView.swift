//
//  TitleView.swift
//  CollapsingAnimation
//
//  Created by Martin Mitrevski on 4/17/20.
//  Copyright © 2020 Mitrevski. All rights reserved.
//

import SwiftUI

struct TitleView: View {
    
    let title: String
    let imageName: String
    var foregroundColor: Color = Color("navTitle1")
    
    var body: some View {
        HStack(spacing: 12) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(foregroundColor)
                .frame(width: 16, height: 16)
                .padding(.leading, 24)
            Text(title)
                .font(.system(size: 20))
                .fontWeight(.semibold)
                .foregroundColor(foregroundColor)
            Spacer()
        }
    }
    
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(title: "My posts", imageName: "favouritesWhite")
    }
}
