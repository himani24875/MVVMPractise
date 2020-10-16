//
//  APIManager.swift
//  PractiseYML
//
//  Created by Himani on 14/10/20.
//  Copyright © 2020 Himani. All rights reserved.
//

import Foundation

class APIManager {

    func getUsers(completionHandler: @escaping(UserResponseModel?) -> (), failure: @escaping(Error?) -> Void ) {

        guard let url = URL(string: Constants.getEmployeeURL) else { return }

        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil,
            let response = response as? HTTPURLResponse, response.statusCode == 200,
            let data = data
                else {
                failure(error)
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let userData = try decoder.decode(UserResponseModel.self, from: data)
                completionHandler(userData)
            } catch let error {
                failure(error)
            }
        }

        task.resume()
    }
}
