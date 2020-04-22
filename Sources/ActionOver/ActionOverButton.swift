//
//  ActionOverButton.swift
//  
//
//  Created by Andrea Miotto on 19/4/20.
//

/**
 The Action Over Button will be translated to an ActionSheetButton for the Action Sheet, or to a Button for the Popover menu.

 It defines the:
 - **title**: the title for the button.
 - **type** for the button: (normal, cancel, destructive).
 - **action** executed when the button is pressed.
 */
public struct ActionOverButton {
    public enum ActionType {
        case destructive, cancel, normal
    }
    let title: String?
    let type: ActionType
    let action: (() -> Void)?

    public init(title: String?, type: ActionType, action: (() -> Void)?) {
        self.title = title
        self.type = type
        self.action = action
    }
}
