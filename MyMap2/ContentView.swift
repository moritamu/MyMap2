//
//  ContentView.swift
//  MyMap2
//
//  Created by MsMacM on 2026/05/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView(searchKey: "熊谷駅")
        }
    }
}

#Preview {
    ContentView()
}
