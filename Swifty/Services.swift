//
//  Services.swift
//  Swifty
//
//  Created by Zenande GODONGWANA on 2018/10/16.
//  Copyright © 2018 Zenande GODONGWANA. All rights reserved.
//

import Foundation


public struct Data {
    static var data: UserData?;
    static var skills: [Skill]?;
    static var projects: [Projects]?;
}


public struct Client {
    static let UID: String = "55ce8a059586905204ff4443cc37fdb82985e3f69dd92d16ce3fadc002e57986"
    static let SECRET: String = "8c78587b4ac3e125003456029434d10603767ec866133bd0cac4385a09d3c54a"
    static var Token: String? = nil
    
    static func getToken() {
        // Use UID and Secrwt Key to make a POST request
        let parameters = ["grant_type":"client_credentials", "client_id":self.UID, "client_secret": self.SECRET]
        guard let url = URL(string: "https://api.intra.42.fr/oauth/token") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {return}
        
        request.httpBody = httpBody
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let data = data {
                do {
                    
                    let token: TokenModel = try JSONDecoder().decode(TokenModel.self, from: data)
                        print("token= ", token)
                    self.Token = token.access_token
                    
                } catch {
                    print(error)
                }
            }
        }
        .resume()
    }
}

/*


 */



var endPoints: [String] = [
    "https://api.intra.42.fr/oauth/token",
    "/v2/users/:user_id/projects_users",
    "/v2/users/:id",
    "/v2/users"
]

public class Services {
    var accessToken: String;
    
    init(accessToken: String) {
        self.accessToken = accessToken
    }
    
    func getUserData(userID: String, with function: @escaping (String) -> (), and errorHandler: @escaping () -> ()) {
        // /v2/users/ + "userID"
        // GET request
        // USe headers
        
        guard let url = URL(string: "https://api.intra.42.fr/v2/users/" + userID) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(Client.Token!)", forHTTPHeaderField: "Authorization")
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let data = data {
                do {
//                    if let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
//                        print(json)
//                   }
                    
                    let userData: UserData = try JSONDecoder().decode(UserData.self, from: data)
                    //print("userData= ", userData)
                    Data.data = userData as? UserData
                    Data.skills = userData.cursus_users[0].skills
                    Data.projects = userData.projects_users
                    //self.Token = token.access_token
                    DispatchQueue.main.async {
                        function(userData.login!)
                    }
                    
                    
                    
                } catch {
                    print("Error: ", error)
                    DispatchQueue.main.async {
                         errorHandler()
                    }
                }
            }
        }
        .resume()
    }
    
    func getUserPojects(userID: Int) {
        // Use v2/users/:user_id/projects_users
        print("Do stuff")
    }
    
    func getAllUsers(username: String) -> Int? {
        // Use /v2/users
        print("Get all users, Match the username, and return the ID or nil if not found")
        return 0;
    }
}
