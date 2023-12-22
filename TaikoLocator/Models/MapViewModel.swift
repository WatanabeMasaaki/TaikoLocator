//
//  MapViewModel.swift
//  TaikoLocator
//
//  Created by 渡邉雅晃 on 2023/10/17.
//

import Foundation
import SwiftUI
import MapKit
import Combine

final class MapViewModel: NSObject, ObservableObject {
    private let manager = CLLocationManager()
    @Published var location = CLLocation()
    
    //初期位置の座標
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 35.6812362,
            longitude: 139.7671248
        ),
        latitudinalMeters: 10_000,
        longitudinalMeters: 10_000
    )
    
    @Published var trackingMode: MapUserTrackingMode = .follow
    
    //イニシャライザで自身をデリゲートに設定する
    override init() {
        super.init()
        manager.delegate = self
    }
    
}

extension MapViewModel: CLLocationManagerDelegate {
    
    // 位置情報関連の権限をリクエスト
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print(#function)
        if manager.authorizationStatus == .authorizedWhenInUse {
            print(#function, "権限があるのでリクエスト")
            manager.startUpdatingLocation()
        } else {
            print(#function,"権限がないので権限をリクエスト")
            manager.requestWhenInUseAuthorization()
        }
    }
    
    // 位置情報が更新されたら呼び出される.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(#function)
        
        self.location = locations.last!
    }
}


