//
//  ContentView.swift
//  ApiDemo
//
//  Created by Gurjinder Singh on 03/11/23.
//

import SwiftUI

struct Info: Codable {
//    var id = UUID().uuidString
    var users: [Users]
    var total, skip, limit: Int
}

struct Users: Codable {
    var id: Int
    var firstName, lastName, maidenName, gender, email, image: String
}

struct ContentView: View {
    
    @State private var info = [Users]()
    
    var body: some View {
        NavigationView {

            List(info, id: \.id) { info in
                VStack(alignment: .leading) {
                    Text(info.firstName)
                    Text(info.lastName)
                    Text(info.maidenName)
                    Text(info.email)
                    Text(info.gender)
                    Text(info.image)
                }
            }
            .task {
                await fetchData()
            }
        }
        .navigationTitle("Breaking Bad")
    }
    
    // create URL and fetch data
    
    func fetchData() async {
        guard let url = URL(string: "https://dummyjson.com/users") else {
            print("Bad URL")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            // decode data
            print("Data received", data)
            if let decodedRes = try? JSONDecoder().decode(Info.self, from: data) {
                print(decodedRes)
                self.info = decodedRes.users
            } else {
                print("failed")
            }
        } catch {
            print("failed to fetch request")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
