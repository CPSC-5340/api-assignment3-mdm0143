//
//  Character.swift
//  RickandMorty
//
//  Created by Micah Moore on 3/31/24.
//

import Foundation

struct CharacterList: Decodable {
    let results: [Character]
}

struct Character: Identifiable, Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let image: String
}
