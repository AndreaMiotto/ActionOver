//
//  ActionSheetStyle.swift
//  ActionOverExample
//
//  Created by Andrea Miotto on 19/4/20.
//  Copyright © 2020 Andrea Miotto. All rights reserved.
//

import SwiftUI

internal struct ActionSheetConfigurator: UIViewControllerRepresentable {
    var configure: (UIAlertController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<ActionSheetConfigurator>) -> UIViewController {
        UIViewController()
    }

    func updateUIViewController(
        _ uiViewController: UIViewController,
        context: UIViewControllerRepresentableContext<ActionSheetConfigurator>) {
        if let actionSheet = uiViewController.presentedViewController as? UIAlertController,
            actionSheet.preferredStyle == .actionSheet {
            self.configure(actionSheet)
        }
    }
}

internal struct ActionSheetCustom: ViewModifier {

    var buttonCulor: UIColor

    func body(content: Content) -> some View {
        content
            .background(ActionSheetConfigurator { action in
                action.view.tintColor = self.buttonCulor
            })
    }
}

