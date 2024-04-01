//
//  CharacterViewModel.swift
//  RickandMorty
//
//  Created by Micah Moore on 3/31/24.
//

import Foundation

class CharacterViewModel: ObservableObject {
    @Published var characters = [Character]()
    
    func fetchCharacters() {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            let characterList = try? JSONDecoder().decode(CharacterList.self, from: data)
            
            DispatchQueue.main.async {
                self.characters = characterList?.results ?? []
            }
        }
        .resume()
    }
}
