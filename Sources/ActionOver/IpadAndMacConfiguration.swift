//
//  IpadAndMacConfiguration.swift
//  ActionOverExample
//
//  Created by Andrea Miotto on 19/4/20.
//  Copyright © 2020 Andrea Miotto. All rights reserved.
//

import SwiftUI

/**
 The configuration that helps the Action Over menu to position itself in iPad and Mac device.

 It defines the:
 - **Anchor Point**: where you want to attach the *ActionOver*.
 - **Arrow Edge** for the the *ActionOver*
 */
struct IpadAndMacConfiguration {

    /// The **Anchor Point** where you want to attach the *ActionOver* in **iPad and Mac devices**
    let anchor: UnitPoint?

    /// The **Arrow Edge** for the the *ActionOver* in **iPad and Mac devices**
    let arrowEdge: Edge?
}
