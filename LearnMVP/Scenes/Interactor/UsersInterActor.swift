//
//  UserInteractor.swift
//  LearnMVP
//
//  Created by Eslam on 6/4/20.
//  Copyright © 2020 Ioslam. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class UsersInterActor {
     func getUsers(completion: @escaping (_ error: Error?,_ user: [User]?) -> () ) {
        AF.request("https://jsonplaceholder.typicode.com/users").responseJSON() { (response) in
            do {
                switch response.result {
                case .success:
                    let jsonDecoder = try JSONDecoder().decode([User].self, from: response.data!)
                        completion(nil,jsonDecoder)
                case .failure(let error):
                    completion(error,nil)
                }
            } catch {
                print(error)

            }
        }
    }
}
