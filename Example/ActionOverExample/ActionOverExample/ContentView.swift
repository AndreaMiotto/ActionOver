//
//  ContentView.swift
//  ActionOverExample
//
//  Created by Andrea Miotto on 19/4/20.
//  Copyright © 2020 Andrea Miotto. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @State var presented = false

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 40) {
                Text("""
                Hi, this is the Action Over modifier.

                With this modifier you will preset an Action Sheet on iPhone
                and a Popover on iPad and Mac.

                You will write just once your actions, and with a single modifier
                you will dislay the proper menu according the user's device.
                """)
                Button(action: {
                    self.presented = true
                }, label: {
                    Text("Show Action Over")
                })
                    .actionOver(
                        presented: $presented,
                        title: "Settings",
                        message: "Wich setting will you enamble?",
                        buttons: buttons,
                        ipadAndMacConfiguration: ipadMacConfig
                )
                HStack {
                    Spacer()
                }
                Spacer()
            }
            .padding()
                .navigationBarTitle("Action Over", displayMode: .large)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

    private var buttons: [ActionOverButton] = {
        return [
            ActionOverButton(
                title: "Option one",
                type: .normal,
                action: {}
            ),
            ActionOverButton(
                title: "Option two",
                type: .normal,
                action: {}
            ),
            ActionOverButton(
                title: "Delete",
                type: .destructive,
                action: {}
            ),
            ActionOverButton(
                title: nil,
                type: .cancel,
                action: nil
            ),
        ]
    }()

    private var ipadMacConfig = {
        IpadAndMacConfiguration(anchor: nil, arrowEdge: nil)
    }()
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
