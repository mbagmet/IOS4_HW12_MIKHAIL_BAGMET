//
//  Settings.swift
//  IOS4_HW12_MIKHAIL_BAGMET
//
//  Created by Михаил on 30.01.2022.
//

import Foundation

enum CellType: Equatable {
    case profile
    case byDefault
    case withSwitch(isOn: Bool)
    case withBadge
}

struct Settings {
    let name: String?
    let icon: String?
    let badge: String?
    let description: String?
    let type: CellType?
}
