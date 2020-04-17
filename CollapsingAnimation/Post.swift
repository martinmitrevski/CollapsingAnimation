//
//  Post.swift
//  CollapsingAnimation
//
//  Created by Martin Mitrevski on 4/17/20.
//  Copyright © 2020 Mitrevski. All rights reserved.
//

import SwiftUI

struct Post: Identifiable {
    
    let id = UUID()
    let title: String
    let tags: [String]
    
}
