//
//  UserViewModel.swift
//  ApiDemo
//
//  Created by Gurjinder Singh on 04/11/23.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var users = [Users]()
    
    let baseURl = "https://dummyjson.com/users"
    
    init() {
        fetchData() // called when UserViewModel obj created
    }
    
    func fetchData() {
        guard let url = URL(string: "https://dummyjson.com/users") else {
            print("Bad URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, urlRes, error in
            guard let data = data?.parseResponse() else { return }
            guard let decodedRes = try? JSONDecoder().decode(Info.self, from: data) else { return }
            DispatchQueue.main.async { [weak self] in
                self?.users = decodedRes.users
            }
        }.resume()
        //        do {
        //            let (data, _) = try await URLSession.shared.data(from: url)
        //            // decode data
        //            print("Data received", data)
        //            if let decodedRes = try? JSONDecoder().decode(Info.self, from: data) {
        //                print(decodedRes)
        //                self.info = decodedRes.users
        //            } else {
        //                print("failed")
        //            }
        //        } catch {
        //            print("failed to fetch request")
        //        }
    }
}

extension Data {
    func parseResponse() -> Data? {
        if let stringData = String(data: self, encoding: .utf8) {
            let withouNull = stringData.replacingOccurrences(of: "null,", with: "")
            let data = withouNull.data(using: .utf8)
            return data
        }
        return nil
    }
}
