//
//  TaikoLocation.swift
//  TaikoLocator
//
//  Created by 渡邉雅晃 on 2023/10/18.
//

import Foundation
import SwiftUI
import MapKit

struct TaikoLocation: Identifiable {
    var id: String
    var latitude: Double
    var longitude: Double
    var name: String //店舗名
    var cases: Int //筐体の数
    var coins: Int //何クレか
    var plays: Int //何曲か
    var description: String? //説明
    var updateDate: Date //更新した日付
}

//struct Coordinates: Hashable, Codable {
//    var latitude: Double
//    var longitude: Double
//}
