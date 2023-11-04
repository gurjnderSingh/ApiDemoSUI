//
//  InfoModel.swift
//  ApiDemo
//
//  Created by Gurjinder Singh on 04/11/23.
//

import Foundation


struct Info: Codable {
    var users: [Users]
    var total, skip, limit: Int
}

struct Users: Codable, Identifiable {
    var id: Int
    var firstName, lastName, maidenName, gender, email, image: String
}
