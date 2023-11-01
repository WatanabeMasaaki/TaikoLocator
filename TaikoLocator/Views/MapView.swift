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
        NavigationView {
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)){
                Map(
                    coordinateRegion: $viewModel.region,
                    interactionModes: .all,
                    showsUserLocation: true,
                    userTrackingMode: $viewModel.trackingMode
                )
                .ignoresSafeArea()
                
                
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
                
                NavigationLink(destination: SetTaikoView(latitude: latitude, longitude: longitude).environmentObject(locationManager), isActive: $showSetTaikoView) {
                    
                }
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
