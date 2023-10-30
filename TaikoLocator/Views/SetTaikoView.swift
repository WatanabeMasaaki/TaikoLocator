//
//  SetTaikoView.swift
//  TaikoLocator
//
//  Created by 渡邉雅晃 on 2023/10/18.
//

import SwiftUI

struct SetTaikoView: View {
    @EnvironmentObject var locationManager: LocationManager
    @Environment (\.dismiss) private var dismiss
    
    let latitude: Double
    let longitude: Double
    
    @State var name: String = ""
    @State var cases: String = "1"
    @State var coins: String = "1"
    @State var plays: String = "3"
    @State var description: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        VStack {
            Text("太鼓を登録")
                .font(.title)
            
            TextField("店舗名", text: $name)
            TextField("台数", text: $cases)
            TextField("クレ数", text: $coins)
            TextField("曲数", text: $plays)
            TextField("メモ", text: $description)
            
            Spacer()
            
            Button(action: {
                locationManager.sendLocation(latitude: latitude, longitude: longitude, name: name, cases: Int(cases)!, coins: Int(coins)!, plays: Int(plays)!, description: description)
                showAlert = true
            }, label: {
                Text("登録")
                    .font(.title)
            })
        }
        .alert("登録しました！", isPresented: $showAlert, actions: {
            Button("OK", role: .cancel, action: {
                dismiss()
            })
        })
        
        
        
        
        
    }
}

struct SetTaikoView_Previews: PreviewProvider {
    static var previews: some View {
        SetTaikoView(latitude: 0, longitude: 0)
            .environmentObject(LocationManager())
    }
}
