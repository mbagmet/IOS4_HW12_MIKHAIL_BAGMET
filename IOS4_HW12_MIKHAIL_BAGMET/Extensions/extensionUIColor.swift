//
//  TwoDynamicColorsUIColorExtension.swift
//  IOS4_HW12_MIKHAIL_BAGMET
//
//  Created by Михаил on 09.12.2021.
//

import UIKit

infix operator |: AdditionPrecedence
public extension UIColor {

    /// Easily define two colors for both light and dark mode.
    /// - Parameters:
    ///   - lightMode: The color to use in light mode.
    ///   - darkMode: The color to use in dark mode.
    /// - Returns: A dynamic color that uses both given colors respectively for the given user interface style.
    static func | (lightMode: UIColor, darkMode: UIColor) -> UIColor {
        guard #available(iOS 13.0, *) else { return lightMode }

        return UIColor { (traitCollection) -> UIColor in
            return traitCollection.userInterfaceStyle == .light ? lightMode : darkMode
        }
    }
}
