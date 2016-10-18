//
//  PokemonSearchViewController.swift
//  PokeDex
//
//  Created by Martin Kirke on 10/18/16.
//  Copyright © 2016 Ghost. All rights reserved.
//

import UIKit

class PokemonSearchViewController: UIViewController, UISearchBarDelegate {

    // properties
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var abilitiesLabel: UILabel!
    
    
    // General
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    // methods
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        // Get Search text from search bar
        
        guard let searchTerm = searchBar.text else { return }
        
        // Fetch pokemon details
        
        PokemonController.fetchPokemon(for: searchTerm) { (pokemon) in
            
            DispatchQueue.main.async {
                
                guard let pokemon = pokemon else { return }
                
                self.nameLabel.text = "Name: \(pokemon.name)"
                self.idLabel.text = "ID: \(pokemon.id)"
                self.abilitiesLabel.text = "Abilities: \(pokemon.abilities.joined(separator: ", "))"
            }
        }
    }
    
    
}
