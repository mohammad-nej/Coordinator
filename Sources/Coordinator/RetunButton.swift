//
//  RetunButton.swift
//  Coordinator
//
//  Created by MohammavDev on 1/14/25.
//

import SwiftUI



struct ReturnButton: View {
    @Environment(Coordinator.self) var cord : Coordinator
    public init(){
        
    }
    let text : String = "بازگشت"
    var body: some View {
        Button{
            cord.pop()
        }label:{
            HStack{
                Text(text)
                Image(systemName: "chevron.left")
            }.font(.body)
        }.buttonStyle(.borderedProminent)
    }
}

#Preview {
    ReturnButton()
}

