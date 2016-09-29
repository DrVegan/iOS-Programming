//
//  JokeClass.swift
//  ChuckNorris
//
//  Created by Daniel Freeman on 14/06/2016.
//  Copyright © 2016 Razeware. All rights reserved.
//

import Foundation

class JokeGenerator { // 1
    
    var jokes : [String];
    
    init() {
        jokes = [String]()
        jokes.append("They once named a street after Chuck Norris, but they had to close it down because no one dared cross Chuck Norris.")
        jokes.append("The truth hurts because Chuck Norris roundhouse kicked it.")
        jokes.append("Chuck Norris doesn't cheat death, he beats it fair and square.")
        jokes.append("Ghosts sit around the campfire and tell Chuck Norris stories.")
        jokes.append("Chuck Norris only uses stunt doubles for crying sc enes.")
        jokes.append("That's not an eclipse - it’s the sun hiding from Chuck Norris.")
    }

    func tellJoke() -> String {
        let jokeindex = UInt32(jokes.count)
        let randomNum = Int(arc4random_uniform(jokeindex))
        return jokes[randomNum]
        
    }
}