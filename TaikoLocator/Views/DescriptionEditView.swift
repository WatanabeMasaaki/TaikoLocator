//
//  DescriptionEditView.swift
//  TaikoLocator
//
//  Created by 渡邉雅晃 on 2024/01/21.
//

import SwiftUI

struct DescriptionEditView: View {
    @Binding var description: String
    
    var body: some View {
        
        
        VStack{
            Text("詳細を編集")
                .font(.title)
            
            VStack(alignment: .leading){
                Text("詳細")
                    .bold()
                    .padding(.leading, 15)
                TextField("詳細", text: $description, axis: .vertical)
                    .padding()
                    .overlay{
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(lineWidth: 1)
                    }
                
                Spacer()
            }
            .padding(5)
        }
        
    }
}

struct DescriptionEditView_Previews: PreviewProvider {
    @State static var preDescription = "test"
    static var previews: some View {
        DescriptionEditView(description: $preDescription)
    }
}
