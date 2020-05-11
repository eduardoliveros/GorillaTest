//
//  Post.swift
//  GorillaTest
//
//  Created by Eduardo Oliveros Acosta on 11/05/20.
//  Copyright © 2020 Eduardo Oliveros Acosta. All rights reserved.
//

import Foundation


struct Post: Decodable {
    var first_name: String
    var last_name: String
    var post_body: String
    var image: String?
    var id: Int
    var unix_timestamp: String
}

