//
//  ViewController.swift
//  NetworkingHW
//
//  Created by Александр Полочанин on 5.05.23.
//

import UIKit


enum Link {
    case urlCharacter
    case urlPlanet
    
    var url: URL {
        switch self {
        case .urlCharacter:
            return URL(string: "https://swapi.dev/api/people/1/")!
        case .urlPlanet:
            return URL(string: "https://swapi.dev/api/planets/1/")!
        }
    }
    
}

final class ViewController: UIViewController {
    
    @IBAction func runFetchCharacter() {
        fetchCharacter()
    }
    
}

extension ViewController {
    private func fetchCharacter() {
        URLSession.shared.dataTask(with: Link.urlCharacter.url) { data, _, error in

            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let character = try decoder.decode(Protagonist.self, from: data)
                print(character)
                self.fetchPlanet()
               
            } catch {
                print(error.localizedDescription)
            }
            
           
        }.resume()
    }
    
    private func fetchPlanet() {
        URLSession.shared.dataTask(with: Link.urlPlanet.url) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let decoder = JSONDecoder()
                let planet = try decoder.decode(Planet.self, from: data)
                print(planet)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

