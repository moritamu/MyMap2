//
//  MapView.swift
//  MyMap2
//
//  Created by MsMacM on 2026/05/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    let searchKey: String
    var body: some View {
        Map(){

        }
        .onChange(of: searchKey, initial: true ) {
            oldValue, newValue in
            print("検索キーワード：\(newValue)")
        }
    }
}

#Preview {
    MapView(searchKey: "熊谷")
}
