//
//  UserCell.swift
//  ApiDemo
//
//  Created by Gurjinder Singh on 04/11/23.
//

import SwiftUI
import Kingfisher

let userModel: Users = Users(id: 1, firstName: "Gurjinder", lastName: "Singh", maidenName: "Singh", gender: "Male", email: "gurjindersingh663@gmail.com", image: "https://robohash.org/doloremquesintcorrupti.png")
let sampleVM = UserViewModel()

struct UserCell: View {
    
    let user: Users
    let viewModel: UserViewModel
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text(user.firstName.capitalized)
                    .font(.system(size: 20, weight: .semibold, design: .serif))
                    .foregroundColor(.white)
                    .padding(.top, 20)
                    .padding(.leading)
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.white)
                        .frame(width: 100, height: 40)
                        .overlay {
                            Text(user.lastName.capitalized)
                                .font(.system(size: 19 , weight: .medium, design: .serif))
                                .foregroundColor(.black)
                        }
                        .padding(.leading, 10)
                    
                    KFImage(URL(string: user.image))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 58, height: 68)
                        .padding([.bottom, .trailing], 4)
                }
            }
        }.background(.orange)
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .shadow(color: .pink, radius: 8, x: 8,y: 2)
            .padding(.all, 2)
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell(user: userModel, viewModel: sampleVM)
    }
}
