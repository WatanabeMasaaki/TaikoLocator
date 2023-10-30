//
//  MapView.swift
//  TaikoLocator
//
//  Created by 渡邉雅晃 on 2023/10/17.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @StateObject private var viewModel = MapViewModel()
    
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
                
                
                NavigationLink(destination: SetTaikoView(latitude: 0, longitude: 0).environmentObject(LocationManager())) {
                    Text("現在地を太鼓として登録")
                        .frame(maxWidth: .infinity)
                        .frame(height: 75)
                        .font(.title)
                        .background(Color.white)
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
