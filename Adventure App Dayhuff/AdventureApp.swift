//
//  Adventure_App_DayhuffApp.swift
//  Adventure App Dayhuff
//
//  Created by Noah Dayhuff on 7/1/24.
//

import SwiftUI

@main
struct AdventureApp: App {
    var body: some Scene {
        WindowGroup {
            let model = AdventureModel.initial
            let controller = AdventureController(model: model)
            AdventureView(controller: controller)
        }
    }
}
