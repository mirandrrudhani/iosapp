//
//  Recipe.swift
//  Project1
//
//  Created by Cacttus Education on 7.6.23.
//

import Foundation
import Foundation

struct RecipeResponse: Decodable {
    let results: [Recipe]
}

struct Recipe: Decodable {
    let title: String
    let image: String
}


