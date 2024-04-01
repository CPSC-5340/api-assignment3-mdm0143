//
//  CharacterListView.swift
//  RickandMorty
//
//  Created by Micah Moore on 3/31/24.
//

import SwiftUI

struct CharacterListView: View {
    @ObservedObject var viewModel = CharacterViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.characters) { character in
                NavigationLink(destination: CharacterDetailView(character: character)) {
                    HStack {
                        AsyncImage(url: URL(string: character.image)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            Text(character.name).font(.headline)
                            Text(character.species).font(.subheadline)
                        }
                    }
                }
            }
            .navigationTitle("Rick and Morty Characters")
        }
        .onAppear {
            viewModel.fetchCharacters()
        }
    }
}
