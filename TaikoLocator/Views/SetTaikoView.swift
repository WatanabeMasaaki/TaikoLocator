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
    @State var cases: Int = 1
    @State var coins: Int = 1
    @State var plays: Int = 3
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
                    }
                    
            }
            .padding(5)
            
            HStack{
                Text("台数")
                    .bold()
                    .padding(.leading, 15)
                Stepper(value: $cases, in: 1...1000000, step: 1) {
                    Text("\(cases)")
                }
                .padding()

            }
            .padding(5)
            
            HStack{
                Text("クレ数")
                    .bold()
                    .padding(.leading, 15)
                Stepper(value: $coins, in: 1...1000000, step: 1) {
                    Text("\(coins)")
                }
                .padding()
            }
            .padding(5)
            
            HStack{
                Text("曲数")
                    .bold()
                    .padding(.leading, 15)
                Stepper(value: $plays, in: 1...1000000, step: 1) {
                    Text("\(plays)")
                }
                .padding()
            }
            .padding(5)
            
            
            
            VStack(alignment: .leading){
                HStack{
                    Text("詳細")
                        .bold()
                        .padding(.leading, 15)
                    
                    
                    
                    
                    NavigationLink("編集", destination: DescriptionEditView(description: $description))
                    
                    
                }
                
                
                HStack{
                    Text("\(description)")
                        .padding()
                        .background(Color(.secondarySystemFill))
                        .cornerRadius(14)
                    Spacer()
                }
                
            }
            .padding(5)
                
                
            
            
            
            Spacer()
            
            Button(action: {
                locationManager.sendLocation(latitude: latitude, longitude: longitude, name: name, cases: cases, coins: coins, plays: plays, description: description)
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
