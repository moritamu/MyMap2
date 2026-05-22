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
    @State var targetCoordenate = CLLocationCoordinate2D()
    @State var cameraPosistion: MapCameraPosition = .automatic

    var body: some View {
        Map(position: $cameraPosistion) {
            // マーカーを表示
            Marker(searchKey, coordinate: targetCoordenate)
        }
        .onChange(of: searchKey, initial: true ) {
            oldValue, newValue in
            print("検索キーワード：\(newValue)")
            let request = MKLocalSearch.Request()
            request.naturalLanguageQuery = newValue
            let search = MKLocalSearch(request: request)

            search.start { response, error in
                if let mapItem = response?.mapItems,
                   let mapItem = mapItem.first {
                    targetCoordenate = mapItem.location.coordinate
                    print("経度緯度：\(targetCoordenate)")
                    cameraPosistion = .region(MKCoordinateRegion(
                        center: targetCoordenate,
                        latitudinalMeters: 500.0,
                        longitudinalMeters: 500.0
                    ))//CameraPosition
                }
            }//search
        }//onChange
    }//View
}//MapView

#Preview {
    MapView(searchKey: "桶川中学校")
}
