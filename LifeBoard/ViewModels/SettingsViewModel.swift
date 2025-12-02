//
//  SettingsViewModel.swift
//  LifeBoard
//
//  Created by 金融產規部財工組-鄭勝文 on 2025/12/1.
//

import Foundation
import Combine
import SwiftUI

final class SettingsViewModel: ObservableObject {
    @AppStorage("isDarkMode") var isDarkMode: Bool = false
    @AppStorage("defaultTaskSortAscending") var defaultTaskSortAscending: Bool = true
}
