//
//  poke.swift
//  PokeDex
//
//  Created by user212276 on 1/13/22.
//

import Foundation
import Alamofire
import UIKit


//Struct de Pokemons
struct Poke: Codable {
    let id: Int
    let nome: String
    let tipos: Tipos
    let peso, altura: Double
    let habilidades: Habilidades
    let estatisticas: Estatisticas
    let cor: String
    let linkImg: String?

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case nome = "Nome"
        case tipos = "Tipos"
        case peso = "Peso"
        case altura = "Altura"
        case habilidades = "Habilidades"
        case estatisticas = "Estatisticas"
        case cor = "Cor"
        case linkImg = "Link_img"
    }
}

//Estatisticas
struct Estatisticas: Codable {
    let estatisticas: [String]

    enum CodingKeys: String, CodingKey {
        case estatisticas = "Estatisticas"
    }
}

//Habilidades
struct Habilidades: Codable {
    let habilidades: [String]

    enum CodingKeys: String, CodingKey {
        case habilidades = "Habilidades"
    }
}

//Tipos
struct Tipos: Codable {
    let tipos: [String]

    enum CodingKeys: String, CodingKey {
        case tipos = "Tipos"
    }
}
