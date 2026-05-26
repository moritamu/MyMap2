//
//  ContentView.swift
//  MyMap2
//
//  Created by MsMacM on 2026/05/22.
//

import SwiftUI

struct ContentView: View {
    @State var inputText: String = ""
    @State var displaySearchkey: String = "吹上駅"
    var body: some View {
        VStack {
            TextField("キーワード", text: $inputText, prompt: Text("表示する場所を入力してください"))
                .onSubmit {
                    displaySearchkey = inputText
                }
                .padding()
            MapView(searchKey: displaySearchkey)
        }
    }
}

#Preview {
    ContentView()
}
