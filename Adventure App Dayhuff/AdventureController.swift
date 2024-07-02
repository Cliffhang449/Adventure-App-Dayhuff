//
//  AdventureController.swift
//  Adventure App Dayhuff
//
//  Created by Noah Dayhuff on 7/1/24.
//

import Foundation

class AdventureController: ObservableObject {
    @Published var model: AdventureModel

    init(model: AdventureModel) {
        self.model = model
    }

    func makeChoice(_ choice: String) {
        model.makeChoice(choice)
    }
    
    func resetAdventure() {
        model.reset()
    }
}
