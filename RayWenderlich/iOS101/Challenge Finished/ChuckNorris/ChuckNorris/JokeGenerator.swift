//
//  JokeGenerator.swift
//  ChuckNorrisLab1
//
//  Created by Brian Moakley on 10/29/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
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
  
  func randomJoke() -> String {
    let randomIndex = Int(arc4random()) % jokes.count
    return jokes[randomIndex]
  }
  
}
