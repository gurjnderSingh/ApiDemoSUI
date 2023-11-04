//
//  UserDetailView.swift
//  ApiDemo
//
//  Created by Gurjinder Singh on 04/11/23.
//

import SwiftUI
let userNModel: Users = Users(id: 1, firstName: "Gurjinder", lastName: "Singh", maidenName: "Singh", gender: "Male", email: "gurjindersingh663@gmail.com", image: "https://robohash.org/doloremquesintcorrupti.png")
let samplNVM = UserViewModel()

struct UserDetailView: View {
    
    let viewModel: UserViewModel
    let user: Users
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(viewModel: samplNVM, user: userNModel)
    }
}
