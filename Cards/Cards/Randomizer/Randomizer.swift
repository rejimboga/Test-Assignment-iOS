//
//  Randomizer.swift
//  Cards
//
//  Created by Macbook Air on 11.02.2022.
//

import Foundation

struct Randomizer {
    
    static let shared = Randomizer()
    
    func randomNumber(digits: Int) -> String {
        var number = String()
        for _ in 1...digits {
           number += "\(Int.random(in: 0...9))"
        }
        return number
    }
    
    func randomImage() -> Int {
        var id: Int
        let imageRandom = Int.random(in: 0...1)
        id = imageRandom
        return id
    }
    
}
