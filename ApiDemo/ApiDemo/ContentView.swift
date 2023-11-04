//
//  ContentView.swift
//  ApiDemo
//
//  Created by Gurjinder Singh on 03/11/23.
//

import SwiftUI
import Kingfisher


struct ContentView: View {
    
//    @State private var info = [Users]()
    
    var body: some View {
        UserGridView()
//        NavigationView {
//
//            List(info, id: \.id) { info in
//                VStack(alignment: .leading) {
//                    Text(info.firstName)
//                    Text(info.lastName)
//                    Text(info.maidenName)
//                    Text(info.email)
//                    Text(info.gender)
//                KFImage(URL(string: info.image))
//                        .resizable()
//                        .scaledToFit()
//                }
//            }
//        }
//        .navigationTitle("Breaking Bad")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        UserGridView()
    }
}
