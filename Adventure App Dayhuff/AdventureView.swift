//
//  ContentView.swift
//  Adventure App Dayhuff
//
//  Created by Noah Dayhuff on 7/1/24.
//

import SwiftUI

struct AdventureView: View {
    @ObservedObject var controller: AdventureController

    var body: some View {
        VStack {
            Button(action: {
                controller.resetAdventure()
            }) {
                Text("Restart Adventure")
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.top, 20)
                    .padding(.bottom, 180)
            }
            Text(controller.model.story)
                .font(.title)
                .padding()
            ForEach(controller.model.choices, id: \.self) { choice in
                Button(action: {
                    controller.makeChoice(choice)
                }) {
                    Text(choice)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.bottom, 10)
            }
        }
        .padding()
    }
}

struct AdventureView_Previews: PreviewProvider {
    static var previews: some View {
        let model = AdventureModel.initial
        let controller = AdventureController(model: model)
        AdventureView(controller: controller)
    }
}
