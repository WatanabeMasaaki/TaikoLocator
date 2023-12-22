//
//  LocationManager.swift
//  TaikoLocator
//
//  Created by 渡邉雅晃 on 2023/10/28.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class LocationManager: ObservableObject {
    @Published private(set) var locations:[TaikoLocation] = []
    let db = Firestore.firestore()
    
    //Firebaseにデータを追加
    func sendLocation (latitude: Double, longitude: Double, name: String, cases: Int, coins: Int, plays: Int, description: String?) {
        
        let newLocation: [String : Any] = [
            "cases" : cases,
            "coins" : coins,
            "description" : description,
            "id" : "\(UUID())",
            "latitude" : latitude,
            "longitude" : longitude,
            "name" : name,
            "plays" : plays,
            "updateDate" : Date()
        ]
        
        db.collection("locations").document().setData(newLocation) { err in
            if let err = err {
                print("error sending location to Firestore: \(err)")
            }
        }
    }
}

