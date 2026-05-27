//
//  ContentView.swift
//  MyMap2
//
//  Created by MsMacM on 2026/05/22.
//  完成：5/27

import SwiftUI

struct ContentView: View {
    @State var inputText: String = ""
    @State var displaySearchkey: String = "吹上駅"
    @State var displayMapType: MapType = .standard
    var body: some View {
        VStack {
            TextField("キーワード", text: $inputText, prompt: Text("表示する場所を入力してください"))
                .onSubmit {
                    displaySearchkey = inputText
                }
                .padding()
            ZStack(alignment: .bottomTrailing){
                MapView(searchKey: displaySearchkey, mapType: displayMapType)
                Button{
                    if displayMapType == .standard {
                        displayMapType = .satellite
                    } else if displayMapType == .satellite {
                        displayMapType = .hybrid
                    } else {
                        displayMapType = .standard
                    }
                } label: {
                    Image(systemName: "map")
                        .resizable()
                        .frame(width: 35.0, height: 35.0)
                }
                .padding(.trailing, 20.0)
                .padding(.bottom, 30.0)
            }//ZStack
        }
    }
}

#Preview {
    ContentView()
}
