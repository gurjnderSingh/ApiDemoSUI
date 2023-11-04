//
//  UserGridView.swift
//  ApiDemo
//
//  Created by Gurjinder Singh on 04/11/23.
//

import SwiftUI

struct UserGridView: View {
    
    private var gridItems = [GridItem(.flexible()), GridItem(.flexible())] // Columns
    @StateObject var viewModel = UserViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.green.opacity(0.2), Color.pink.opacity(0.3)]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    LazyVGrid(columns: gridItems, spacing: 16) {
                        ForEach(viewModel.users) { user in
                            NavigationLink {
                                UserDetailView(viewModel: viewModel, user: user)
                            } label: {
                                UserCell(user: user, viewModel: viewModel)
                            }

                        }
                    }
                    .navigationTitle("Users List \(viewModel.users.count)")
                }
            }
        }
    }
}

struct UserGridView_Previews: PreviewProvider {
    static var previews: some View {
        UserGridView()
    }
}
