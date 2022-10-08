//
//  LoginInputView.swift
//  stargazers
//
//  Created by PieroAdmin on 07/10/22.
//

import SwiftUI

struct LoginInputView: View {
    @Binding  var username: String
    @Binding  var password: String

    var body: some View {
        VStack(alignment: .leading) {
            Text("Accedi")
                
            TextField("Email", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }.padding()
    }
}

struct LoginInputView_Previews: PreviewProvider {
    static var previews: some View {
        LoginInputView(username: .constant(""), password: .constant(""))
    }
}
