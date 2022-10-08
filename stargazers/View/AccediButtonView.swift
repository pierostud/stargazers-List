//
//  AccediButtonView.swift
//  stargazers
//
//  Created by PieroAdmin on 07/10/22.
//

import SwiftUI

struct AccediButtonView: View {
    var text: LocalizedStringKey
    var action: () -> ()
    
    var body: some View {
        Button(action: {
            self.action()
        }) {
            Text(text)
                .frame(width: UIScreen.main.bounds.width * 0.7)
        }.buttonStyle(LoginButtonStyle())
    }
}

struct AccediButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AccediButtonView(text:"Accedi") {
            print("Finito")
        }
    }
}
