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
    
    init() {
        getLocations()
    }
    
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
    
    //firebaseから情報を取得
    func getLocations() {
        db.collection("locations").addSnapshotListener { querySnapshot, error in
                    
            // If we don't have documents, exit the function
            guard let documents = querySnapshot?.documents else {
                print("Error fetching documents: \(String(describing: error))")
                return
            }
            
            // Mapping through the documents
            self.locations = documents.compactMap { document -> TaikoLocation? in
                do {
                    // Converting each document into the Message model
                    // Note that data(as:) is a function available only in FirebaseFirestoreSwift package - remember to import it at the top
                    return try document.data(as: TaikoLocation.self)
                } catch {
                    // If we run into an error, print the error in the console
                    print("Error decoding document into Message: \(error)")

                    // Return nil if we run into an error - but the compactMap will not include it in the final array
                    return nil
                }
            }
        }
    }
}

