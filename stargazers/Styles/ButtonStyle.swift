//
//  ButtonStyle.swift
//  stargazers
//
//  Created by PieroAdmin on 07/10/22.
//

import SwiftUI

struct LoginButtonStyle: ButtonStyle {
 
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(.horizontal,15)
            .padding(.vertical, 10)
            .background(.blue)
            .foregroundColor(Color.white)
            .cornerRadius(20)
    }
}

struct ButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            Button(action: {
                print("pippo")
            }) {
                Text("Reset")
            }.buttonStyle(LoginButtonStyle())
        }
    }
}
