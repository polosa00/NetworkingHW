//
//  Character.swift
//  NetworkingHW
//
//  Created by Александр Полочанин on 5.05.23.
//

import Foundation


struct Protagonist: Decodable {
    
    let name: String
    let height: String
    let hair_color: String
    let birth_year: String
    let homeworld: URL
    let films: [URL]

}

struct Planet: Decodable {
    let name: String
    let rotation_period: String
    let population: String
    
    
}
