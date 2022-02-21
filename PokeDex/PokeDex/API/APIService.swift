//
//  APIService.swift
//  PokeDex
//
//  Created by user212276 on 1/13/22.
//

import Foundation
import Alamofire

//Requerimento da API utilizando alamofire 
extension PokeViewController {
    func fetchPoke() {
        AF .request("https://pokedex-squad3.herokuapp.com/api/v1/all")
            .responseJSON { (response) in
                let decoder = JSONDecoder()
                let pokemons: [Poke] = try! decoder.decode([Poke].self, from: response.data!)
                //print(pokemons)
                self.pokemons = pokemons
                self.collection.reloadData()
            }
    }
}
