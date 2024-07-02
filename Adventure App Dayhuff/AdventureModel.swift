//
//  AdventureModel.swift
//  Adventure App Dayhuff
//
//  Created by Noah Dayhuff on 6/23/24.
//

import Foundation

struct AdventureModel {
    var story: String
    var choices: [String]
    var success: Bool?
    
    static let initial = AdventureModel (
        story: "You sit at a table in a tavern and pull out the map you just bought from a local goods seller. You thought you bought a map of the town but instead you see 'The Lost Treasure of the Dragon, Blightfang'",
        choices: ["Hire a guide to assist you with the route on the map.", "Find the way yourself."],
        success: nil
    )
    
    static let paths: [String: [(String, Bool)]] = [
        "Hire a guide to assist you with the route on the map.": [("The guide leads you to a pathway in the forest", true), ("The guide leads you to a river, cross the river", false)],
        "Find the way yourself.": [("Climb the mountain", false), ("Explore the cave at the base of the mountain", true)]
    ]
    
    mutating func makeChoice(_ choice: String) {
        if let nextChoices = AdventureModel.paths[choice] {
            self.story = "You chose to \(choice). Now what will you do next?"
            self.choices = nextChoices.map {$0.0}
        } else if let result = AdventureModel.paths.values.flatMap({ $0 }).first(where: { $0.0 == choice })?.1 {
            self.success = result
            self.story = result ? "Congratulations! You found the treasure!" : "You never found the treasure."
            self.choices = []
        }
    }
    
    mutating func reset() {
        self = AdventureModel.initial
    }
}
