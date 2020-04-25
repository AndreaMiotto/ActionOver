//
//  ActionOverButton.swift
//  
//
//  Created by Andrea Miotto on 19/4/20.
//
import SwiftUI

struct ActionOver: ViewModifier {

    // MARK: - Public Properties

    /// Set to true when you want to display the **ActionOver view**
    @Binding var presented: Bool

    /// The **title** of the *Action Over*
    let title: String

    /// The **message** of the *Action Over*
    let message: String?

    /// All the **buttons** that will be displayed inside the *Action Over*
    let buttons: [ActionOverButton]

    /// The iPad and Mac configuration
    let ipadAndMacConfiguration: IpadAndMacConfiguration

    /// The normal action button color
    let normalButtonColor: UIColor



    // MARK: - Private Properties

    /// The **Action Sheet Buttons** built from the Action Over Buttons
    private var sheetButtons: [ActionSheet.Button] {

        UIView.appearance(whenContainedInInstancesOf: [UIAlertController.self]).tintColor = normalButtonColor

        var actionButtons: [ActionSheet.Button] = []

        // for each action over button
        // build an action sheet button
        for button in buttons {
            switch button.type {
            case .cancel:
                let button: ActionSheet.Button = .cancel()
                actionButtons.append(button)
            case .normal:
                let button: ActionSheet.Button = .default(
                    Text(button.title ?? ""),
                    action: button.action
                )
                actionButtons.append(button)
            case .destructive:
                let button: ActionSheet.Button = .destructive(
                    Text(button.title ?? ""),
                    action: button.action
                )
                actionButtons.append(button)
            }
        }
        return actionButtons
    }

    /// The **Popover Buttons** built from the Action Over Buttons
    private var popoverButtons: [Button<Text>] {
        var actionButtons: [Button<Text>] = []

        // for each action over button
        // build an action sheet button
        for button in buttons {
            switch button.type {
            case .cancel:
                break
            case .normal:
                let button = Button(
                    action: {
                        self.presented = false
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            button.action?()
                        }
                },
                    label: {
                        Text(button.title ?? "")
                            .foregroundColor(Color(self.normalButtonColor))
                })
                actionButtons.append(button)
            case .destructive:
                let button = Button(
                    action: {
                        self.presented = false
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            button.action?()
                        }
                },
                    label: {
                        Text(button.title ?? "")
                            .foregroundColor(Color(UIColor.systemRed))
                })

                actionButtons.append(button)
            }
        }
        return actionButtons
    }

    // MARK: - Body

    func body(content: Content) -> some View {
        content
            .iPhone {
                $0
                    .actionSheet(isPresented: $presented) {
                        ActionSheet(
                            title: Text(self.title),
                            message: Text(self.message ?? ""),
                            buttons: sheetButtons)
                }
        }
        .iPadAndMac {
            return ipadAndMacConfiguration.anchor != nil ?
                $0.popover(
                    isPresented: $presented,
                    attachmentAnchor: PopoverAttachmentAnchor.point(ipadAndMacConfiguration.anchor ?? .topTrailing),
                    arrowEdge: (ipadAndMacConfiguration.arrowEdge ?? .top),
                    content: popContent
                )
                :
                $0.popover(isPresented: $presented, content: popContent)
        }
    }

    // MARK: - Private Methods

    private func popContent() -> some View {
        return VStack(alignment: .center, spacing: 10) {
            Text(self.title)
                .font(.headline)
                .foregroundColor(Color(UIColor.secondaryLabel))
                .padding(.top)
            if self.message != nil {
                Text(self.message ?? "")
                    .font(.body)
                    .foregroundColor(Color(UIColor.secondaryLabel))
                    .multilineTextAlignment(.center)
                    .lineLimit(4)
                    .frame(minHeight: 60)
                    .padding(.horizontal)
            }

                ForEach((0..<self.popoverButtons.count), id: \.self) { index in
                    Group {
                        Divider()
                        self.popoverButtons[index]
                            .padding(.all, 10)
                    }
                }
            }
        }
        .buttonStyle(PlainButtonStyle())
        .padding(10)

    }
}
