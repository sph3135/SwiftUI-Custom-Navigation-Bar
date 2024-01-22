//
//  Extension+Color.swift
//  CustomTabSwiftUI
//
//  Created by Sudeep P H on 27/09/23.
//

import Foundation
import SwiftUI

extension Color {
    public static var backgroundGradient: Gradient {
        return Gradient(colors: [Color(.sRGB, red:139 / 255, green: 10 / 255, blue: 130 / 255), Color(.sRGB, red:83 / 255, green: 120 / 255, blue: 149 / 255)])
    }
}
