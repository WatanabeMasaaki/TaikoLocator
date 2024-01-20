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
            
            VStack(alignment: .leading){
                Text("店舗名")
                    .bold()
                    .padding(.leading, 15)
                TextField("店舗名", text: $name)
                    .padding()
                    .overlay{
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(lineWidth: 1)
                            .frame(height: 57)
                    }
            }
            .padding(5)
            
            VStack(alignment: .leading){
                Text("台数")
                    .bold()
                    .padding(.leading, 15)
                TextField("台数", text: $cases)
                    .padding()
                    .overlay{
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(lineWidth: 1)
                            .frame(height: 57)
                    }
            }
            .padding(5)
            
            VStack(alignment: .leading){
                Text("クレ数")
                    .bold()
                    .padding(.leading, 15)
                TextField("クレ数", text: $coins)
                    .padding()
                    .overlay{
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(lineWidth: 1)
                            .frame(height: 57)
                    }
            }
            .padding(5)
            
            VStack(alignment: .leading){
                Text("曲数")
                    .bold()
                    .padding(.leading, 15)
                TextField("曲数", text: $plays)
                    .padding()
                    .overlay{
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(lineWidth: 1)
                            .frame(height: 57)
                    }
            }
            .padding(5)
            
            VStack(alignment: .leading){
                Text("メモ")
                    .bold()
                    .padding(.leading, 15)
                TextField("メモ", text: $description)
                    .padding()
                    .overlay{
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(lineWidth: 1)
                            .frame(height: 57)
                    }
            }
            .padding(5)
            
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
