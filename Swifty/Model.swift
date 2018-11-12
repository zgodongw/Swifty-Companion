//
//  Model.swift
//  Swifty
//
//  Created by Malebo MTHOMBENI on 2018/10/18.
//  Copyright © 2018 Zenande GODONGWANA. All rights reserved.
//

import Foundation

struct UserData: Decodable {
    let id: Int?
    let email: String?
    let login: String?
    let displayname: String?
    let image_url: String?
    let staff: Bool?
    let correction_point: Int?
    let phone: String?
    let location: String?
    let wallet: Int?
    let cursus_users: [Cursus]
    let projects_users: [Projects]
    
    enum CodingKeys : String, CodingKey {
        case id
        case email
        case login
        case displayname
        case image_url
        case staff = "staff?"
        case correction_point
        case phone
        case location
        case wallet
        case cursus_users
        case projects_users
   }
}

struct Cursus: Decodable {
    let level: Double?
    let skills: [Skill]
}

struct Skill: Decodable {
    let name: String?
    let level: Double?
}

struct Projects: Decodable {
    let final_mark: Int?
    let status: String?
    let project: Project?
    
}

struct Project: Decodable {
    let name: String?
    let slug: String?
}


