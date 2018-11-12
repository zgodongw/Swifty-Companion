//
//  TokenModel.swift
//  Swifty
//
//  Created by Malebo MTHOMBENI on 2018/10/18.
//  Copyright © 2018 Zenande GODONGWANA. All rights reserved.
//

import Foundation

struct TokenModel: Decodable {
    let access_token: String
    let token_type: String
    let expires_in: Int
    let scope: String
    let created_at: Int
}
