//
//  PostRepository.swift
//  CollapsingAnimation
//
//  Created by Martin Mitrevski on 4/17/20.
//  Copyright © 2020 Mitrevski. All rights reserved.
//

import Foundation

class PostRepository {
        
    static func posts() -> [Post] {
        
        let post1 = Post(title: "Collapsing animations with SwiftUI",
                         tags: ["swiftui", "design", "animation"])
        
        let post2 = Post(title: "Developing the Drawland app",
                         tags: ["swift", "drawing", "design"])
        
        let post3 = Post(title: "Q&A Model in Swift",
                         tags: ["swift", "coreml", "vision"])
        
        return [post1, post2, post3]
    }
    
}
