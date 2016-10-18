//
//  PokemonController.swift
//  PokeDex
//
//  Created by Martin Kirke on 10/18/16.
//  Copyright © 2016 Ghost. All rights reserved.
//

import Foundation

class PokemonController {
    
    // properties
    
    static let baseURL = "http://pokeapi.co/api/v2/pokemon/"
    
    
    
    // methods
    
    static func fetchPokemon(for searchTerm: String, completion: @escaping (Pokemon?) -> Void) {
    
        let searchURL = baseURL + searchTerm.lowercased()
        
        guard let url = URL(string: searchURL) else {
            
            completion(nil)
            return
        }
        
        NetworkController.preformRequest(for: url, httpMethod: .Get ) { (data, error) in
            guard let data = data,
                let jsonDictionary = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [String : Any] else {
                    completion(nil)
                    return
            }
            let pokemon = Pokemon(dictionary: jsonDictionary)
            completion(pokemon)
        }
    }
    
}
