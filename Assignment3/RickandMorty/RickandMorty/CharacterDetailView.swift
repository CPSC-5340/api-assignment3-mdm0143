//
//  CharacterDetailView.swift
//  RickandMorty
//
//  Created by Micah Moore on 3/31/24.
//

import SwiftUI

struct CharacterDetailView: View {
    let character: Character
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: character.image)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .aspectRatio(contentMode: .fit)
            
            Text(character.name).font(.largeTitle)
            Text("Status: \(character.status)").font(.title2)
            Text("Species: \(character.species)").font(.title2)
        }
    }
}
