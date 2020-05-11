//
//  Services.swift
//  GorillaTest
//
//  Created by Eduardo Oliveros Acosta on 11/05/20.
//  Copyright © 2020 Eduardo Oliveros Acosta. All rights reserved.
//

import Foundation

class Services {
    static func getPosts(completion: @escaping (([Post]) -> Void)) {
        guard let url = URL(string: "https://gl-endpoint.herokuapp.com/feed") else { return }

        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error took place \(error)")
                return
            }
            // Convert HTTP Response Data to a simple String
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Response data string:\n \(dataString)")
                do {
                    let arrayPost =  try JSONDecoder().decode([Post].self, from: data)
                    completion(arrayPost)
                } catch let jsonErr {
                    print("Error serializing json", jsonErr)
                }
            }
           
        })

        task.resume()
    }
}
