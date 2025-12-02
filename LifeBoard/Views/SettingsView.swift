//
//  SettingsView.swift
//  LifeBoard
//
//  Created by 金融產規部財工組-鄭勝文 on 2025/12/1.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel: SettingsViewModel
    
    var body: some View {
        NavigationStack {
            Form {
                Section("外觀") {
                    Toggle("深色模式", isOn: $viewModel.isDarkMode)
                }
                
                Section("任務") {
                    Toggle("預設依到期日由近到遠排序",
                           isOn: $viewModel.defaultTaskSortAscending)
                }
                
                Section("關於") {
                    HStack {
                        Text("版本")
                        Spacer()
                        Text("1.0.0")
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationTitle("設定")
        }
    }
}
