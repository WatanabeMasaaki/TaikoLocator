//
//  MapView.swift
//  TaikoLocator
//
//  Created by 渡邉雅晃 on 2023/10/17.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @StateObject var viewModel = MapViewModel()
    @StateObject var locationManager = LocationManager()
    @State var showSetTaikoView = false
    @State var latitude: Double = 0
    @State var longitude: Double = 0
    
    
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)){
                
                //マップ表示
                Map(
                    coordinateRegion: $viewModel.region,
                    interactionModes: .all,
                    showsUserLocation: true,
                    userTrackingMode: $viewModel.trackingMode,
                    annotationItems: locationManager.locations
                ) { place in
                    MapMarker(coordinate: CLLocationCoordinate2D(latitude: place.latitude, longitude: place.longitude), tint: Color.orange)
                }
                .ignoresSafeArea()
                
                
                //SetTaikoViewがに遷移するボタン
                Button(action: {
                    //緯度と軽度を取得
                    latitude = $viewModel.location.wrappedValue.coordinate.latitude
                    longitude = $viewModel.location.wrappedValue.coordinate.longitude
                    showSetTaikoView.toggle()
                }, label: {
                    Text("現在地を太鼓として登録")
                        .frame(maxWidth: .infinity)
                        .frame(height: 75)
                        .font(.title)
                        .background(Color.white)
                })
                
                //showSetTaikoViewがTrueになったらSetTaikoViewの画面に遷移する
                NavigationLink(destination: SetTaikoView(latitude: latitude, longitude: longitude).environmentObject(locationManager), isActive: $showSetTaikoView) {
                    
                }
            }
        }
    }
}

//struct MapView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapView()
//    }
//}
