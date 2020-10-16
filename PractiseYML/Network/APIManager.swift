//
//  APIManager.swift
//  PractiseYML
//
//  Created by Himani on 14/10/20.
//  Copyright © 2020 Himani. All rights reserved.
//

import Foundation

class APIManager {

    let urlString = "https://run.mocky.io/v3/d28e9048-64d4-4543-96d7-adc7fedf8a86"

    func getUsers(completionHandler: @escaping(UserResponseModel?) -> (), failure: @escaping(Error?) -> Void ) {

        guard let url = URL(string: urlString) else { return }

        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                failure(error)
                return
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("there is some issue..try again")
                return
            }

            guard let data = data else { return }

            do {
                let userData = try JSONDecoder().decode(UserResponseModel.self, from: data)
                completionHandler(userData)
            } catch let error {
                failure(error)
            }
        }

        task.resume()
    }
}

//class APIManager {
//    let urlString = "https://run.mocky.io/v3/d28e9048-64d4-4543-96d7-adc7fedf8a86"
//
//    func getUsers(completionHandler: @escaping(UserResponseModel) -> Void, failure: @escaping(Error?) -> Void) {
//        guard let url = URL(string: urlString) else { return }
//        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//            if error != nil {
//                failure(error)
//            }
//
//            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//                print("Some error occured. Please try agian later...")
//                return
//            }
//
//            guard let data = data else { return }
//
//            do {
//                let userData = try JSONDecoder().decode(UserResponseModel.self, from: data)
//                completionHandler(userData)
//            } catch let error {
//                failure(error)
//            }
//        }
//
//        task.resume()
//    }
//}
